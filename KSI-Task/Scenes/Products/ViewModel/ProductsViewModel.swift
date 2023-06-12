//
//  ProductsViewModel.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 12/06/2023.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

struct ProductsViewModel {

    private var apiService = ApiServices()
    private var disposeBag = DisposeBag()

    private var productsSubject = BehaviorRelay<[ProductModel]>(value: [])
    var productsObservable: BehaviorRelay<[ProductModel]> {
        return productsSubject
    }
    
    func getProducts() {
        apiService.getProductsData { result in
            switch result {
            case .success(let products):
                self.productsSubject.accept(products.products)
            case .failure(let error):
                print(error)
            }
        }
    }

    func configure(cell: ProductCellAction, product: ProductModel) {
        cell.displayInfo(image: product.thumbnail ?? "",
                         barnd: product.brand ?? "",
                         deis: product.description ?? "",
                         price: product.price ?? 0 )
    }
//
//    mutating func saveProducts(products: [ProductModel]) {
//        products.forEach { product in
//            let productData = ProductClass()
//            productData.id = product.id ?? 0
//            productData.title = product.title ?? ""
//            productData.desc = product.description ?? ""
//            productData.price = product.price ?? 0
//            productData.brand = product.brand ?? ""
//            productData.thumbnail = product.thumbnail ?? ""
//            productData.images.append(objectsIn: product.images)
//
//            self.productsData.append(productData)
//
//            realm.beginWrite()
//            realm.add(productData)
//            try! realm.commitWrite()
//        }
//    }

}
