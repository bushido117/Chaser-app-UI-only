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
    
    func customButtonToSystem(button: UIButton) {
        button.addTarget(self, action: #selector(tapIn), for: .touchDown)
        button.addTarget(self, action: #selector(tapOut), for: .touchUpInside)
    }
    
    @objc func tapIn() {
        UIView.animate(withDuration: 0.25) {
            self.alpha = 0.55
        }
    }
    
    @objc func tapOut() {
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
