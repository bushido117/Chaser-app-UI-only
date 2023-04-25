//
//  OverviewController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class OverviewController: BaseViewController {
    
    private lazy var overviewNavBar: OverviewNavBar = {
        let navBar = OverviewNavBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()

    override func addSubviews() {
        super.addSubviews()
        
        view.addSubview(overviewNavBar)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            overviewNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            overviewNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overviewNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    override func configure() {
        super.configure()
        
        navigationController?.navigationBar.isHidden = true
    }
}
