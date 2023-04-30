//
//  MonthlyPerformanceView.swift
//  Chaser
//
//  Created by Вадим Сайко on 29.04.23.
//

import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    
    private lazy var yAxisView: YAxisView = {
        let view = YAxisView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var xAxisView: XAxisView = {
        let view = XAxisView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var chartView: ChartView = {
        let view = ChartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(yAxisView)
        addSubview(xAxisView)
        addSubview(chartView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            yAxisView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 10),
            xAxisView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            xAxisView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 15),
            chartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -15),
        ])
    }
    
    func setupChart() {
        chartView.configure()
    }
}
