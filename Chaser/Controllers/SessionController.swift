//
//  SessionController.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

class SessionController: BaseViewController {
    
    private lazy var timerView: TimerView = {
        let view = TimerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timerDuration = 10.0
    
    override func addSubviews() {
        super.addSubviews()
        
        view.addSubview(timerView)
    }

    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }

    override func configure() {
        super.configure()
        
        navigationItem.title = "High Intensy Cardio"
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
        navigationItem.leftBarButtonItem = self.editButtonItem
        self.editButtonItem.title = "Start"
        timerView.configureProgress(with: timerDuration, progress: 0)
        timerView.timerCallback = { [weak self] in
            self?.editButtonItem.isEnabled = false
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            self.editButtonItem.title = "Pause"
            timerView.startTimer()
        } else {
            self.editButtonItem.title = "Start"
            timerView.pauseTimer()
        }
    }
    
    override func leftBarButtonTapped() {
        timerView.startTimer()
    }
    
    override func rightBarButtonTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.isEditing = false
            self?.editButtonItem.isEnabled = true
        }
        timerView.stopTimer()
    }
}
