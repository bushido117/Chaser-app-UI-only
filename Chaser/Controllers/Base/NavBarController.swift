//
//  NavBarController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

final class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor : UIColor.darkGray,
            .font : UIFont.helveticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(with: .separator, of: 1)
    }
}
