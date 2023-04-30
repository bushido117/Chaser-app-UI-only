//
//  ChartView.swift
//  Chaser
//
//  Created by Вадим Сайко on 29.04.23.
//

import UIKit

final class ChartView: UIView {
    
    private lazy var ySeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .separator
        return view
    }()
    
    private lazy var xSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .separator
        return view
    }()
    
    private let chartValues = [45, 55, 60, 65, 70, 80, 65, 45, 35, 15]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(ySeparator)
        addSubview(xSeparator)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ySeparator.topAnchor.constraint(equalTo: topAnchor),
            ySeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            ySeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            ySeparator.widthAnchor.constraint(equalToConstant: 1),
            
            xSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure() {
        layoutIfNeeded()
        addDashLines()
        addChart(values: chartValues)
    }
}
