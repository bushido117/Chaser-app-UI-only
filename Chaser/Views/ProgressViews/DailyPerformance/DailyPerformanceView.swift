//
//  DailyPerfomanceView.swift
//  Chaser
//
//  Created by Вадим Сайко on 27.04.23.
//

import UIKit

final class DailyPerformanceView: BaseInfoView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var barView1 = BaseBarView(value: "1", heightMultiplier: 0.2, title: "MON")
    private lazy var barView2 = BaseBarView(value: "2", heightMultiplier: 0.4, title: "TUE")
    private lazy var barView3 = BaseBarView(value: "3", heightMultiplier: 0.6, title: "WED")
    private lazy var barView4 = BaseBarView(value: "4", heightMultiplier: 0.8, title: "THU")
    private lazy var barView5 = BaseBarView(value: "5", heightMultiplier: 1, title: "FRI")
    private lazy var barView6 = BaseBarView(value: "3", heightMultiplier: 0.6, title: "SAT")
    private lazy var barView7 = BaseBarView(value: "2", heightMultiplier: 0.4, title: "SUN")
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(stackView)
        stackView.addArrangedSubview(barView1)
        stackView.addArrangedSubview(barView2)
        stackView.addArrangedSubview(barView3)
        stackView.addArrangedSubview(barView4)
        stackView.addArrangedSubview(barView5)
        stackView.addArrangedSubview(barView6)
        stackView.addArrangedSubview(barView7)
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
