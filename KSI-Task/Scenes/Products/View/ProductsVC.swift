//
//  ProductsVC.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit
import RxSwift

class ProductsVC: UIViewController {

    @IBOutlet weak var searchView: AppSearchView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var sortBtn: UIButton!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var productsNumLbl: UILabel!
    @IBOutlet weak var productLbl: UILabel!

    
    private var disposeBag = DisposeBag()
    private var apiService = ApiServices()
    var products = [ProductModel]()
    var filteredProducts = [ProductModel]()
    var productsData = [ProductClass]()
    
    var viewModel = ProductsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        self.viewModel.getProducts()
        self.subscribeToProducts()
        filteredProducts = products
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    private
    func setupViews() {
        self.view.backgroundColor = .bgColor

        searchView.searchTF.delegate = self

        productLbl.font = .montserrat(.bold, size: 30)
        productLbl.textColor = .appMainText
        productLbl.text = "Products"

        filterBtn.setTitle("", for: .normal)
        sortBtn.setTitle("", for: .normal)

        productsNumLbl.font = .montserrat(.regular, size: 16)
        productsNumLbl.textColor = .appMainText
        productsNumLbl.text = "products found"

        productsCollectionView.registerNibForCollection(ofType: ProductCell.self)
        productsCollectionView.backgroundColor = .clear
    }

    private
    func subscribeToProducts() {
        self.viewModel.productsObservable.subscribe(onNext: { [weak self] products in
            guard let self = self else {return}
            if !(products.isEmpty) {
                self.filteredProducts = products
                self.productsNumLbl.text = "\(filteredProducts.count) products found"
                self.productsCollectionView.reloadData()
            }
        }).disposed(by: self.disposeBag)
    }


    func searchProducts(for searchText: String) {
        if searchText.isEmpty {
            // If the search text is empty, show all the data
            filteredProducts = products
        } else {
            // Otherwise, filter the data based on the search text
            filteredProducts = products.filter { product in
                if let title = product.title {
                    return title.localizedCaseInsensitiveContains(searchText)
                }
                return false
            }
        }
    }
}

