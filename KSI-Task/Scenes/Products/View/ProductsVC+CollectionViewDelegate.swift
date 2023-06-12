//
//  ProductsVC+CollectionViewDelegate.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

extension ProductsVC: UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProducts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        collectionView.dequeueCellForCollection(ofType: ProductCell.self, withIndex: indexPath)
        viewModel.configure(cell: cell, product: filteredProducts[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 27.5) / 2, height: 230)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailsVC.instantiate()
        vc.product = viewModel.productsObservable.value[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
