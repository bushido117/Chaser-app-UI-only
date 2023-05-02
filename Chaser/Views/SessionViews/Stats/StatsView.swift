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
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var heartStatsItem = StatsItemView(imageName: "stats_heartRate", value: "155 bpm", title: "heart rate")
    private lazy var paceStatsItem = StatsItemView(imageName: "stats_averagePace", value: "8'2'' / km", title: "Average pace")
    private lazy var stepsStatsItem = StatsItemView(imageName: "stats_totalSteps", value: "7,682", title: "Total steps")
    private lazy var distanceStatsItem = StatsItemView(imageName: "stats_totalDistance", value: "8.25 km", title: "Total distance")
    
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
}
