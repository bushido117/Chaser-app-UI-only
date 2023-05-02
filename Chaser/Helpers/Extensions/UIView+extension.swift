//
//  UIView+extension.swift
//  Chaser
//
//  Created by Вадим Сайко on 17.04.23.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, of height: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        border.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        addSubview(border)
    }
    
    func customButtonToSystem(button: UIButton) {
        button.addTarget(self, action: #selector(tapIn), for: .touchDown)
        button.addTarget(self, action: #selector(tapOut), for: .touchUpInside)
    }
    
    @objc func tapIn() {
        UIView.animate(withDuration: 0.25) {
            self.alpha = 0.55
        }
    }
    
    @objc func tapOut() {
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
    
    func addDashLine(yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = UIColor.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        layer.addSublayer(dashLayer)
    }
    
    func addDashLines() {
        for i in 0...9 {
            addDashLine(yPosition: bounds.height / 9 * CGFloat(i))
        }
    }
    
    func addChart(values: [Int]) {
        guard let maxValue = values.max() else { return }
        let valuePoints = values.enumerated().map { CGPoint(x: $0, y: $1) }
        let chartHeight = bounds.height / CGFloat(maxValue + 10)
        let points = valuePoints.map {
            let x = bounds.width / CGFloat(valuePoints.count - 1) * $0.x
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        points.forEach {
            chartPath.addLine(to: $0)
            addChartDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = UIColor.active.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineJoin = .round
        layer.addSublayer(chartLayer)
    }
    
    func addChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        layer.addSublayer(dotLayer)
        
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let cornerLayer = CAShapeLayer()
        cornerLayer.path = path.cgPath
        cornerLayer.strokeColor = UIColor.separator.cgColor
        cornerLayer.fillColor = UIColor.clear.cgColor
        cornerLayer.lineWidth = 1
        layer.addSublayer(cornerLayer)
    }
}
