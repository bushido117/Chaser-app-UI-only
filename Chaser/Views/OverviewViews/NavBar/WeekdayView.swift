//
//  WeekDayView.swift
//  Chaser
//
//  Created by Вадим Сайко on 18.04.23.
//

import UIKit

final class WeekdayView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.helveticaRegular(with: 9)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.helveticaRegular(with: 15)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureStackView(index: Int, name: String) {
        let startOfWeek = Date().startOfWeek
        let currentDay = startOfWeek.agoForward(to: index)
        let day = Date.calendar.component(.day, from: currentDay)
        let isTooday = currentDay.stripTime() == Date().stripTime()
        backgroundColor = isTooday ? .active : .background
        nameLabel.textColor = isTooday ? .white : .inactive
        dateLabel.textColor = isTooday ? .white : .inactive
        nameLabel.text = name.uppercased()
        dateLabel.text = "\(day)"
    }
}
