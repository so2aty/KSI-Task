//
//  ProductDetailsVC+CollectionViewDelegate.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

extension ProductDetailsVC: UICollectionViewDelegate,
                            UICollectionViewDataSource,
                            UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCellForCollection(ofType: ProductImageCell.self, withIndex: indexPath)
        cell.displayImage(image: product?.images[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = URL(string: product?.images[indexPath.item] ?? "") else {return}
        productImage.sd_setImage(with: url, completed: nil)
    }
}
