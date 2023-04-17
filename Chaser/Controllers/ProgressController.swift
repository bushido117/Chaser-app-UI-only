//
//  ProgressController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class ProgressController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Workout Progress"
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }
    
}
