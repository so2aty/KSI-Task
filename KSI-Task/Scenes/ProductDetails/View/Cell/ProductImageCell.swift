//
//  ProductImageCell.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

class ProductImageCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        setupLayOut()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var continerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.borderGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shoe")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()

    func setupLayOut() {
        addSubview(continerView)
        continerView.anchor(.top(topAnchor, constant: 0),
                            .bottom(bottomAnchor, constant: 0),
                            .leading(leadingAnchor, constant: 0),
                            .trailing(trailingAnchor, constant: 0))

        continerView.addSubview(productImage)
        productImage.anchor(.top(continerView.topAnchor, constant: 0),
                            .bottom(continerView.bottomAnchor, constant: 0),
                            .leading(continerView.leadingAnchor, constant: 0),
                            .trailing(continerView.trailingAnchor, constant: 0))
    }
}
