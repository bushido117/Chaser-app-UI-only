//
//  OverviewNavBar.swift
//  Chaser
//
//  Created by Вадим Сайко on 18.04.23.
//

import UIKit

final class OverviewNavBar: UIView {
    
    private lazy var allWarkoutsButton = SecondaryButton()
    private lazy var addButton = UIButton()
    private lazy var titleLabel = UILabel()
    private lazy var weekView = WeekView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addSubview(allWarkoutsButton)
        addSubview(addButton)
        addSubview(titleLabel)
        addSubview(weekView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: .separator, of: 1)
    }
    
    private func configure() {
        backgroundColor = .white
        
        allWarkoutsButton.setTitle(title: "All workouts")
        allWarkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        allWarkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonTapped), for: .touchUpInside)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(textStyle: .title1)
        let buttonImage = UIImage(systemName: "plus.circle", withConfiguration: config)
        addButton.setImage(buttonImage, for: .normal)
//        addButton.backgroundColor = .systemBlue
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.helveticaRegular(with: 22)
        titleLabel.text = "Today"
        titleLabel.textColor = .darkGray
        
        weekView.translatesAutoresizingMaskIntoConstraints = false
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
