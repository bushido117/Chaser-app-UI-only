//
//  StatsView.swift
//  Chaser
//
//  Created by Вадим Сайко on 25.04.23.
//

import UIKit

final class StatsView: BaseInfoView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var heartStatsItem = StatsItemView()
    private lazy var paceStatsItem = StatsItemView()
    private lazy var stepsStatsItem = StatsItemView()
    private lazy var distanceStatsItem = StatsItemView()
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(stackView)
        stackView.addArrangedSubview(heartStatsItem)
        stackView.addArrangedSubview(paceStatsItem)
        stackView.addArrangedSubview(stepsStatsItem)
        stackView.addArrangedSubview(distanceStatsItem)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
    override func configure() {
        super.configure()
        
        heartStatsItem.configureItem(with: "stats_heartRate", value: "155 bpm", title: "Heart rate")
        paceStatsItem.configureItem(with: "stats_averagePace", value: "8'2'' / km", title: "Average pace")
        stepsStatsItem.configureItem(with: "stats_totalSteps", value: "7,682", title: "Total steps")
        distanceStatsItem.configureItem(with: "stats_totalDistance", value: "8.25 km", title: "Total distance")
    }
}
