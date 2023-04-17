//
//  UIFont+extension.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

extension UIFont {
    static func helveticaRegular(with size: CGFloat) -> UIFont {
        UIFont(name: "Helvetica", size: size) ?? UIFont()
    }
}
