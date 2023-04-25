//
//  WeekView.swift
//  Chaser
//
//  Created by Вадим Сайко on 18.04.23.
//

import UIKit

final class WeekView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let calendar = Calendar.current
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        if calendar.firstWeekday == 1 {
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
        }
        weekdays.enumerated().forEach { index, name in
            let view = WeekdayView()
            view.configureStackView(index: index, name: name)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
