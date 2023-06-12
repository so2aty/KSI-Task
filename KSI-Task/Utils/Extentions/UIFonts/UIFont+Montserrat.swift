//
//  UIFont+Montserrat.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import UIKit

extension UIFont {

    public enum MontserratType: String {
        case regular = "-Regular"
        case bold = "-Bold"
        case medium = "-Medium"
    }

    static func montserrat(_ type: MontserratType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "MontserratRoman\(type.rawValue)", size: size)!
    }
}
