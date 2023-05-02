//
//  OverviewCollectionViewCell.swift
//  Chaser
//
//  Created by Вадим Сайко on 1.05.23.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, noone
}

final class OverviewCollectionViewCell: UICollectionViewCell {
    
    private lazy var checkmarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(scale: .large)
        imageView.image = UIImage(systemName: "chevron.right", withConfiguration: config)
        imageView.tintColor = .inactive
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .helveticaRegular(with: 17)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .helveticaRegular(with: 13)
        label.textColor = .inactive
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 3
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setupConstraints()
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, subtitle: String, isDone: Bool, roundType: CellRoundedType) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        checkmarkImageView.image = isDone ? UIImage(named: "checkmark_done") : UIImage(named: "checkmark_not_done")
        switch roundType {
        case .top:
            self.roundCorners([.topRight, .topLeft], radius: 5)
        case .bottom:
            self.roundCorners([.bottomRight, .bottomLeft], radius: 5)
        case .all:
            self.roundCorners(.allCorners, radius: 5)
        case .noone:
            break
        }
    }
    
    private func addSubviews() {
        addSubview(checkmarkImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addSubview(arrowImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkmarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkImageView.widthAnchor.constraint(equalTo: checkmarkImageView.heightAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: checkmarkImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -15),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            arrowImageView.heightAnchor.constraint(equalToConstant: 12),
            arrowImageView.widthAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    private func configureCell() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.separator.cgColor
    }
}
