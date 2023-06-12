//
//  ProductCell.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

class ProductCell: UICollectionViewCell {

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
        return view
    }()
    lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var favBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "fav")?.withTintColor(.appMainText), for: .normal)
        return btn
    }()

    lazy var productName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Nike"
        lbl.font = .montserrat(.bold, size: 16)
        lbl.textColor = .appMainText
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()

    lazy var productDisc: UILabel = {
        let lbl = UILabel()
        lbl.text = "Air Force 1 Jester XX Black Sonic Yellow ..."
        lbl.font = .montserrat(.regular, size: 13)
        lbl.textColor = .lightGray
        lbl.numberOfLines = 2
        return lbl
    }()

    lazy var priceLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "$ 96"
        lbl.font = .montserrat(.bold, size: 14)
        lbl.textColor = .appMainText
        return lbl
    }()

    func setupLayOut() {
        addSubview(continerView)
        continerView.anchor(.top(topAnchor, constant: 15),
                            .bottom(bottomAnchor, constant: 0),
                            .leading(leadingAnchor, constant: 0),
                            .trailing(trailingAnchor, constant: 0))

        continerView.addSubview(productImage)
        productImage.anchor(.top(continerView.topAnchor, constant: 35),
                            .leading(continerView.leadingAnchor, constant: 15),
                            .trailing(continerView.trailingAnchor, constant: 15),
                            .height(65))

        continerView.addSubview(productName)
        productName.anchor(.top(productImage.bottomAnchor, constant: 15),
                           .leading(continerView.leadingAnchor, constant: 15),
                           .trailing(continerView.trailingAnchor, constant: 15))

        continerView.addSubview(productDisc)
        productDisc.anchor(.top(productName.bottomAnchor, constant: 7),
                           .leading(continerView.leadingAnchor, constant: 15),
                           .trailing(continerView.trailingAnchor, constant: 15),
                           .height(32))

        continerView.addSubview(priceLbl)
        priceLbl.anchor(.top(productDisc.bottomAnchor, constant: 7),
                        .leading(continerView.leadingAnchor, constant: 15))

        continerView.addSubview(favBtn)
        favBtn.anchor(.top(continerView.topAnchor, constant: 15),
                      .trailing(continerView.trailingAnchor, constant: 15),
                      .width(20),
                      .height(16))

    }
}
