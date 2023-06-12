//
//  ProductCell+ViewDelegate.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import Foundation
import SDWebImage

protocol ProductCellAction: AnyObject {
    func displayInfo(image: String, barnd: String, deis: String, price: Int)
}

extension ProductCell: ProductCellAction {
    func displayInfo(image: String, barnd: String, deis: String, price: Int) {
        let url = URL(string: image)
        productImage.sd_setImage(with: url,
                                 completed: nil)
        productName.text = barnd
        productDisc.text = deis
        priceLbl.text = "$ \(price)"
    }
}
