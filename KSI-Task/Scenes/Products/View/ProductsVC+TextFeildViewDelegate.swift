//
//  ProductsVC+TextFeildViewDelegate.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 11/06/2023.
//

import UIKit

extension ProductsVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        searchProducts(for: textField.text ?? "")
        productsCollectionView.reloadData()
        return true
    }
}
