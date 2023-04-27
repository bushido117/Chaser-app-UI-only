//
//  TimerView.swift
//  Chaser
//
//  Created by Вадим Сайко on 20.04.23.
//

import UIKit

class TimerView: BaseInfoView {
    
    private lazy var elapsedTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Elapsed time"
        label.font = .helveticaRegular(with: 14)
        label.textColor = .inactive
        label.textAlignment = .center
        return label
    }()
    
    private lazy var elapsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .helveticaRegular(with: 46)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Remaining time"
        label.font = .helveticaRegular(with: 13)
        label.textColor = .inactive
        label.textAlignment = .center
        return label
    }()
    
    private lazy var remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .helveticaRegular(with: 13)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var progressView: TimerProgressView = {
        let view = TimerProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = 25
        return stackView
    }()
    
    private lazy var bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var completedPercentView = TimerPercentView()
    private lazy var remainingPercentView = TimerPercentView()
    private lazy var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    var timerCallback: (() -> Void)?

    override func configure() {
        super.configure()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(progressView)
        addSubview(timerStackView)
        addSubview(bottomStackView)
        timerStackView.addArrangedSubview(elapsedTimeLabel)
        timerStackView.addArrangedSubview(elapsedTimeValueLabel)
        timerStackView.addArrangedSubview(remainingTimeLabel)
        timerStackView.addArrangedSubview(remainingTimeValueLabel)
        bottomStackView.addArrangedSubview(completedPercentView)
        bottomStackView.addArrangedSubview(bottomSeparatorView)
        bottomStackView.addArrangedSubview(remainingPercentView)
    }
    
    func configureProgress(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempValue = progress > duration ? duration : progress
        let goalValueDivider = duration == 0 ? 1 : duration
        let percent = tempValue / goalValueDivider
        let roundedPercent = Int(percent * 100)
        
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempValue))
        remainingTimeValueLabel.text = getDisplayedString(from: Int(duration) - Int(tempValue))
        remainingPercentView.configure(with: "Remaining".uppercased(), percent: 100 - roundedPercent)
        completedPercentView.configure(with: "Completed".uppercased(), percent: roundedPercent)
        progressView.drawProgress(percent: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.timerCallback?()
            }
            self.configureProgress(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard timerProgress > 0 else { return }
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.02
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configureProgress(with: self.timerDuration, progress: self.timerProgress)
        })
    }

    private func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        if hours == 0 {
            return [minutesStr, secondStr].joined(separator: ":")
        } else {
            return [hoursStr, minutesStr, secondStr].joined(separator: ":")
        }
    }
}
