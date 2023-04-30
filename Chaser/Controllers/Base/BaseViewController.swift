//
//  ViewController.swift
//  Chaser
//
//  Created by Вадим Сайко on 5.11.22.
//

import UIKit

class BaseViewController: UIViewController {
    
    enum NavBarButtonPosition {
        case left, right
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupConstraints()
        configure()
    }
    
    func configure() {
        view.backgroundColor = .background
    }
    
    func addSubviews() {}
    
    func setupConstraints() {}
    
    func addNavBarButton(at position: NavBarButtonPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.active, for: .normal)
        button.setTitleColor(.inactive, for: .disabled)
        button.titleLabel?.font = UIFont.helveticaRegular(with: 17)
        switch position {
        case .left:
            button.addTarget(self, action: #selector(leftBarButtonTapped), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(rightBarButtonTapped), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }

    }
    
    @objc func leftBarButtonTapped() {
        print("Left Bar Button Tap")
    }
    
    @objc func rightBarButtonTapped() {
        print("Right Bar Button Tap")
    }
}
