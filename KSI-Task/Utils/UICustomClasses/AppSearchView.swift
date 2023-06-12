//
//  AppSearchView.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

class AppSearchView: UIView {
    // initWithFrame to init view from code
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }

    // initWithCode to init view from xib or storyboard
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupView()
       }

    lazy var searchTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search product"
        textField.font = .montserrat(.regular, size: 16)
        textField.textColor = .grayColor
        return textField
    }()

    lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "search"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    func setupView() {
        backgroundColor = .white
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.clear.cgColor
        addSubview(searchBtn)
        searchBtn.anchor(.top(topAnchor, constant: 10),
                         .bottom(bottomAnchor, constant: 10),
                         .leading(leadingAnchor, constant: 20),
                         .width(22),
                         .height(22))

        addSubview(searchTF)
        searchTF.anchor(.top(topAnchor, constant: 0),
                        .bottom(bottomAnchor, constant: 0),
                        .leading(leadingAnchor, constant: 50),
                        .trailing(trailingAnchor, constant: 0))

    }
}
