//
//  ProgressController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class ProgressController: BaseViewController {
    
    override func configure() {
        super.configure()
        
        navigationItem.title = "Workout Progress"
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }
    
}
