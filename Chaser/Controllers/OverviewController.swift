//
//  OverviewController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class OverviewController: BaseViewController {
    
    private lazy var overviewNavBar = OverviewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


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
//            overviewNavBar.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    override func configure() {
        super.configure()
        
        navigationController?.navigationBar.isHidden = true
        overviewNavBar.translatesAutoresizingMaskIntoConstraints = false
    }
}
