//
//  OverviewCellModel.swift
//  Chaser
//
//  Created by Вадим Сайко on 2.05.23.
//

import Foundation

struct OverviewCellModel {
    struct Data {
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    let items: [Data]
}
