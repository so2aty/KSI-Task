//
//  ProductImageCell+ViewDelegate.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 11/06/2023.
//

import Foundation
import SDWebImage

protocol ProductImageCellAction: AnyObject {
    func displayImage(image: String?)
}

extension ProductImageCell: ProductImageCellAction {
    func displayImage(image: String?) {
        guard let image else {return}
        let url = URL(string: image)
        productImage.sd_setImage(with: url,
                                 completed: nil)
    }
}
