//
//  StepsView.swift
//  Chaser
//
//  Created by Вадим Сайко on 27.04.23.
//

import UIKit

final class StepsView: BaseInfoView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var barView1 = BaseBarView(value: "8k", heightMultiplier: 1, title: "2/14")
    private lazy var barView2 = BaseBarView(value: "7k", heightMultiplier: 0.875, title: "2/15")
    private lazy var barView3 = BaseBarView(value: "5k", heightMultiplier: 0.625, title: "2/16")
    private lazy var barView4 = BaseBarView(value: "6k", heightMultiplier: 0.75, title: "2/17")
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(stackView)
        stackView.addArrangedSubview(barView1)
        stackView.addArrangedSubview(barView2)
        stackView.addArrangedSubview(barView3)
        stackView.addArrangedSubview(barView4)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
