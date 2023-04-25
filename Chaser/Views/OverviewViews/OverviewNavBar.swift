//
//  OverviewNavBar.swift
//  Chaser
//
//  Created by Вадим Сайко on 18.04.23.
//

import UIKit

final class OverviewNavBar: UIView {
    
    private lazy var allWarkoutsButton: SecondaryButton = {
        let button = SecondaryButton()
        button.setTitle(title: "All workouts")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(allWorkoutsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(textStyle: .title1)
        let buttonImage = UIImage(systemName: "plus.circle", withConfiguration: config)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.helveticaRegular(with: 22)
        label.text = "Today"
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var weekView: WeekView = {
        let view = WeekView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: .separator, of: 1)
    }
    private func addSubviews() {
        addSubview(allWarkoutsButton)
        addSubview(addButton)
        addSubview(titleLabel)
        addSubview(weekView)
    }
    
    private func configure() {
        backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWarkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWarkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWarkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWarkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWarkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    @objc func allWorkoutsButtonTapped() {
        print("All workouts button tap")
    }
    
    @objc func addButtonTapped() {
        print("Add button tap")
    }
}
