//
//  ProductDetailsVC.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productDiscLbl: UILabel!
    @IBOutlet weak var productLongDiscLbl: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var productImageCollectionView: UICollectionView!

    var product : ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        addBackButton().addTarget { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    private
    func setupViews() {

        productImageCollectionView.registerNibForCollection(ofType: ProductImageCell.self)
        productImageCollectionView.backgroundColor = .clear

        guard let product else {return}
        let url = URL(string: product.thumbnail ?? "")
        productImage.sd_setImage(with: url, completed: nil)
        productNameLbl.font = .montserrat(.bold, size: 20)
        productNameLbl.text = product.brand

        productDiscLbl.font = .montserrat(.bold, size: 16)
        productDiscLbl.text = product.title

        productLongDiscLbl.font = .montserrat(.medium, size: 16)
        productLongDiscLbl.numberOfLines = 4
        productLongDiscLbl.text = product.description

        productPriceLbl.font = .montserrat(.bold, size: 16)
        productPriceLbl.text = "$ \(product.price ?? 0)"

        addToCartBtn.titleLabel?.font = .montserrat(.bold, size: 16)
        addToCartBtn.layer.cornerRadius = 10
        addToCartBtn.setTitle("ADD TO CART", for: .normal)

        addFavButton()
    }
}

extension ProductDetailsVC {
    static func instantiate() -> ProductDetailsVC {
        let sb = UIStoryboard(name: "Product", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC
        return vc
    }
}
