//
//  BubbleView.swift
//  bagel
//
//  Created by Александр on 18/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    
    var startAngle = -CGFloat.pi / 2
    var endAngle = 2 * CGFloat.pi
    var clockwise = true
    var lineWidth = 30.0
    var shapeLayer = CAShapeLayer()
    let viewAnchors = UIView()
    var width = 500
    
    var arcCenter: CGPoint?
    var radius: CGFloat?
    
    
    init() {
        super.init(frame: .zero)
        
            self.drawWithCAShapeLayer()
            self.isUserInteractionEnabled = true
            //без этого анкоры не работают
            self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
 
    func drawWithCAShapeLayer() {
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = CGFloat(self.lineWidth)
        self.layer.addSublayer(shapeLayer)
        
    }
    
   
    override func layoutSubviews() {
        
        //Тут поменял frame на bounce и пофиксил багу с увеличением круга внутри фрейма при его трансформации
        self.radius = self.bounds.width / 2 - CGFloat(self.lineWidth) / 2
        self.arcCenter = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        
        
            
            let circlePath = UIBezierPath(
                arcCenter: arcCenter!,
                radius: radius!,
                startAngle: self.startAngle,
                endAngle: self.endAngle,
                clockwise: self.clockwise
            )
            
            shapeLayer.frame = CGRect(
                x: 0,
                y: 0,
                width: self.bounds.width,
                height: self.bounds.height
            )
            shapeLayer.path = circlePath.cgPath
            
    
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        
        let arcCenter = self.arcCenter!
        let radius = self.radius!
        
        let halfDistanceToBorder = pow( (CGFloat(point.x) - arcCenter.x), 2) + pow(CGFloat(point.y) - CGFloat(arcCenter.y), 2)
        
        let distanceToBorder = sqrt(
            halfDistanceToBorder
        )
        
        let clickOutside = Int(distanceToBorder) > Int(radius) + Int(self.lineWidth / 2)
        let clickIn = Int(distanceToBorder) < Int(radius) - Int(self.lineWidth / 2)

        let circleOutsideСlick = clickOutside || clickIn
        
        
        if (!circleOutsideСlick)
        {
            return true
        }
        
        return false
    }
  
}
