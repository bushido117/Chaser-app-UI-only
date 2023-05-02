//
//  OverviewController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

final class OverviewController: BaseViewController {
    
    private let data = [
        OverviewCellModel(items: [
        .init(title: "Warm Up Cardio", subtitle: "Stair Climber · 10 minutes", isDone: true),
        .init(title: "High Intensy Cardio", subtitle: "Treadmill · 50 minutes", isDone: false)
        ]),
        OverviewCellModel(items: [
            .init(title: "Warm Up Cardio", subtitle: "Treadmill · 10 minutes", isDone: false),
            .init(title: "Chest Workout", subtitle: "Bench Press · 3 sets · 10 reps", isDone: false),
            .init(title: "Tricep Workout", subtitle: "Overhead Extension · 5 sets · 8 reps", isDone: false)
        ]),
        OverviewCellModel(items: [
            .init(title: "Cardio Interval Workout", subtitle: "Treadmill · 60 minutes", isDone: true),
            .init(title: "Biceps Workout", subtitle: "Overhead Extension · 4 sets · 10 reps", isDone: true)
        ])
    ]
    
    private lazy var overviewNavBar: OverviewNavBar = {
        let navBar = OverviewNavBar()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OverviewCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: OverviewCollectionViewCell.self))
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: String(describing: SectionHeaderView.self))
        return collectionView
    }()

    override func addSubviews() {
        super.addSubviews()
        
        view.addSubview(overviewNavBar)
        view.addSubview(collectionView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            overviewNavBar.topAnchor.constraint(equalTo: view.topAnchor),
            overviewNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overviewNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: overviewNavBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configure() {
        super.configure()
        
        navigationController?.navigationBar.isHidden = true
    }
}

extension OverviewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OverviewCollectionViewCell.self), for: indexPath)
                as? OverviewCollectionViewCell else { return UICollectionViewCell() }
        let item = data[indexPath.section].items[indexPath.row]
        let roundType: CellRoundedType
        if indexPath.row == 0 && indexPath.row == data[indexPath.section].items.count - 1 {
            roundType = .all
        } else if indexPath.row == 0 {
            roundType = .top
        } else if indexPath.row == data[indexPath.section].items.count - 1 {
            roundType = .bottom
        } else {
            roundType = .noone
        }
        cell.configure(title: item.title, subtitle: item.subtitle, isDone: item.isDone, roundType: roundType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: String(describing: SectionHeaderView.self),
            for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
        let date = Date.calendar.date(byAdding: .day, value: indexPath.section, to: Date()) ?? Date()
        header.configure(with: date)
        return header
    }
}

extension OverviewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
}
