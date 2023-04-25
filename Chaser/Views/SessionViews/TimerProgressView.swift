//
//  ProgressView.swift
//  Chaser
//
//  Created by Вадим Сайко on 20.04.23.
//

import UIKit

class TimerProgressView: UIView {
    
    func drawProgress(percent: CGFloat) {
        layer.sublayers?.removeAll()
        let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
        let radius = circleFrame / 2
        let center = CGPoint(x: radius, y: radius)
        let startAngle = -CGFloat.pi * 7 / 6
        let endAngle = CGFloat.pi * 1 / 6
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let defaultCircleLayer = CAShapeLayer()
        defaultCircleLayer.path = circlePath.cgPath
        defaultCircleLayer.strokeColor = UIColor.separator.cgColor
        defaultCircleLayer.lineWidth = 20
        defaultCircleLayer.strokeEnd = 1
        defaultCircleLayer.fillColor = UIColor.clear.cgColor
        defaultCircleLayer.lineCap = .round
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.active.cgColor
        circleLayer.lineWidth = 20
        circleLayer.strokeEnd = percent
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        
        let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
        let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                               y: sin(-dotAngle) * radius + center.y)
        let dotPath = UIBezierPath()
        dotPath.move(to: dotPoint)
        dotPath.addLine(to: dotPoint)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.fillColor = UIColor.clear.cgColor
        dotLayer.strokeColor = UIColor.white.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 8
        
        layer.addSublayer(defaultCircleLayer)
        layer.addSublayer(circleLayer)
        layer.addSublayer(dotLayer)
    }
}
