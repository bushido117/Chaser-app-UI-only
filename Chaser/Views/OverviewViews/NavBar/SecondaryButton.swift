//
//  SecondaryButton.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

final class SecondaryButton: UIButton {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.helveticaRegular(with: 15)
        label.textColor = UIColor.active
        label.textAlignment = .center
        return label
    }()
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(systemName: "chevron.down")
        iconView.tintColor = UIColor.active
        return iconView
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
        backgroundColor = .secondaryBackground
        layer.cornerRadius = 14
        customButtonToSystem(button: self)
    }
    
    private func addSubviews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
    
    func setTitle(title: String) {
        label.text = title
    }
}
