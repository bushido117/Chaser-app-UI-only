//
//  SessionController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class SessionController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "High Intensy Cardio"
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
     
    }


}
