//
//  UIViewController+addBackButton.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 11/06/2023.
//

import UIKit

extension UIViewController {
    func addBackButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back"), for: .normal)
        let menuBarItem = UIBarButtonItem(customView: button)
        var topParent: UIViewController = self
        while topParent.parent != nil,
              String(describing: type(of: topParent.parent!.self))
                != String(describing: UINavigationController.self) {
            topParent = topParent.parent!
        }
        topParent.navigationItem.leftBarButtonItem = menuBarItem
        return button
    }
}
