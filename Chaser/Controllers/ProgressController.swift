//
//  ProgressController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class ProgressController: BaseViewController {
    
    private lazy var dailyPerformanceView: DailyPerformanceView = {
        let view = DailyPerformanceView(title: "Daily perfomance", buttonTitle: "Last 7 days")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var monthlyPerformanceView: MonthlyPerformanceView = {
        let view = MonthlyPerformanceView(title: "Monthly performance", buttonTitle: "Last 10 month")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func configure() {
        super.configure()
        
        navigationItem.title = "Workout Progress"
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
        monthlyPerformanceView.setupChart()
    }
    
    override func addSubviews() {
        super.addSubviews()
        view.addSubview(dailyPerformanceView)
        view.addSubview(monthlyPerformanceView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06),
        ])
        
    }
}
