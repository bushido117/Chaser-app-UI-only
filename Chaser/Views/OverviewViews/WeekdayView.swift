//
//  WeekDayView.swift
//  Chaser
//
//  Created by Вадим Сайко on 18.04.23.
//

import UIKit

final class WeekdayView: UIView {
    
    private lazy var nameLabel = UILabel()
    private lazy var dateLabel = UILabel()
    private lazy var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        configure()
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        stackView.axis = .vertical
        nameLabel.font = UIFont.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        dateLabel.font = UIFont.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureStackView(index: Int, name: String) {
        let startOfWeek = Date().startOfWeek
//        print(startOfWeek)
        let currentDay = startOfWeek.agoForward(to: index)
        print(currentDay)
        let day = Calendar.current.component(.day, from: currentDay)
//        print(day)
        let isTooday = currentDay.stripTime() == Date().stripTime()
        backgroundColor = isTooday ? .active : .background
        nameLabel.textColor = isTooday ? .white : .inactive
        dateLabel.textColor = isTooday ? .white : .inactive
        nameLabel.text = name.uppercased()
        dateLabel.text = "\(day)"
    }
}
