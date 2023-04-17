//
//  UIView+extension.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, of height: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        border.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(border)
    }
}
