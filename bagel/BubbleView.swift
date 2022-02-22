//
//  BubbleView.swift
//  bagel
//
//  Created by Александр on 18/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    
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
            arcCenter: CGPoint(x: 100, y: 100),
            radius: 100,
            startAngle: -CGFloat.pi / 2,
            endAngle: 2 * CGFloat.pi,
            clockwise: true
        )
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 25.0
        self.layer.addSublayer(shapeLayer)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
