//
//  UICollectionView+forceDequeueCell.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

extension UICollectionView {
    func forceDequeueCell<T: UICollectionViewCell>(identifier: String, for indexPath: IndexPath) -> T {
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
