//
//  MainTabBarVC.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

class MainTabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .appMainText
        tabBar.tintColor = .appMainColor
        tabBar.unselectedItemTintColor = .white
        //        tabBar.layer.cornerRadius = 27
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewConts = viewControllers else { return }
        for viewCont in viewConts {
            viewCont.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
//            viewCont
//                .tabBarItem
//                .setTitleTextAttributes([NSAttributedString.Key.font: UIFont.tajawal(.medium, size: 13)], for: .normal)
        }
    }
}
