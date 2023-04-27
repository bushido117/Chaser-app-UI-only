//
//  BaseBarView.swift
//  Chaser
//
//  Created by Вадим Сайко on 27.04.23.
//

import UIKit

final class BaseBarView: UIView {

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .active
        label.font = .helveticaRegular(with: 13)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .inactive
        label.font = .helveticaRegular(with: 9)
        return label
    }()
    
    private lazy var barView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let heightMultiplier: Double
    
    init(value: String, heightMultiplier: Double, title: String) {
        self.heightMultiplier = heightMultiplier
        super.init(frame: .zero)
        
        self.valueLabel.text = value
        self.titleLabel.text = title
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(valueLabel)
        addSubview(barView)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier, constant: -40),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10)
        ])
    }
}
