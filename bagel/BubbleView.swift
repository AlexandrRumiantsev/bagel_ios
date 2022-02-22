//
//  BubbleView.swift
//  bagel
//
//  Created by Александр on 18/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    
    let arcCenter = CGPoint(x: 100, y: 100)
    let radius = 150
    let startAngle = -CGFloat.pi / 2
    let endAngle = 2 * CGFloat.pi
    let clockwise = true
    let lineWidth = 30.0
    
    init() {
        super.init(frame: .zero)

        self.frame = CGRect(
            x: UIScreen.main.bounds.width/2 - 100,
            y: UIScreen.main.bounds.height/2 - 100,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.width
        )
        
        self.isUserInteractionEnabled = true
        self.drawOval()
    }
    
    func drawOval() {
        
        let circlePath = UIBezierPath(
            arcCenter: self.arcCenter,
            radius: CGFloat(self.radius),
            startAngle: self.startAngle,
            endAngle: self.endAngle,
            clockwise: self.clockwise
        )
        
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = CGFloat(self.lineWidth)
        self.layer.addSublayer(shapeLayer)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
