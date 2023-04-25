//
//  StatsItemView.swift
//  Chaser
//
//  Created by Вадим Сайко on 25.04.23.
//

import UIKit

final class StatsItemView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .helveticaRegular(with: 17)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .inactive
        label.font = .helveticaRegular(with: 10)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(valueLabel)
        labelStackView.addArrangedSubview(titleLabel)
    }
    
    func configureItem(with imageName: String, value: String, title: String) {
        imageView.image = UIImage(named: imageName)
        valueLabel.text = value
        titleLabel.text = title.uppercased()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 23),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            labelStackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            labelStackView.topAnchor.constraint(equalTo: topAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
