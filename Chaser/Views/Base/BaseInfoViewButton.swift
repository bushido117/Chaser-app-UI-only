//
//  BaseInfoViewButton.swift
//  Chaser
//
//  Created by Вадим Сайко on 19.04.23.
//

import UIKit

final class BaseInfoViewButton: UIButton {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.helveticaRegular(with: 13)
        label.textColor = UIColor.inactive
        label.textAlignment = .center
        return label
    }()
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.image = UIImage(systemName: "chevron.down")
        iconView.tintColor = UIColor.inactive
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
        customButtonToSystem(button: self)
    }
    
    private func addSubviews() {
        addSubview(label)
        addSubview(iconView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    func setTitle(title: String) {
        label.text = title
    }
}
