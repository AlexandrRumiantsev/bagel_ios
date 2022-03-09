//
//  ViewController.swift
//  bagel
//
//  Created by Александр on 16/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let bubbleView = BubbleView()
    let halfFrameBuble = Int(BubbleView().lineWidth / 2)
    
    @objc func innerСircleClicked(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: "Выберете вариант взаимодействия с окружностью", message: "Доступны действия: изменить размер и перемещение, вращение на 45 градусов.", preferredStyle: .alert)
         
        alert.addAction(UIAlertAction(title: "изменить размер и переместить", style: .default, handler: { action in
            
            UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            
                
                let animation = CABasicAnimation(keyPath: "path")
                animation.duration = 0.5
                
                    animation.toValue = UIBezierPath(
                        ovalIn: CGRect(
                        x: self.bubbleView.shapeLayer.frame.midX - 5,
                        y: self.bubbleView.shapeLayer.frame.midY - 5,
                        width: self.bubbleView.shapeLayer.frame.width - 150,
                        height: self.bubbleView.shapeLayer.frame.height - 150)
                    ).cgPath
                
                    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)

                    animation.fillMode = kCAFillModeForwards
                    animation.isRemovedOnCompletion = false

                    self.bubbleView.shapeLayer.add(animation, forKey: nil)
                
  
            }, completion: nil)
            
        }))
        
        
        alert.addAction(UIAlertAction(title: "повернуть на 45 градусов", style: .default, handler: { action in
            UIView.animate(withDuration: 1, delay: 0.4, options: [], animations: {
                
                var transform = self.bubbleView.shapeLayer.transform
                transform = CATransform3DRotate(transform, CGFloat(45.0 * M_PI / 180.0), 0.0, 0.0, 1.0)
                self.bubbleView.shapeLayer.transform = transform
                
            }, completion: { action in
                print(self.bubbleView.shapeLayer.frame)
                print(self.bubbleView.shapeLayer.bounds)
            })
        }))
         
        self.present(alert, animated: true)
        
        
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(innerСircleClicked(_:)))
        bubbleView.addGestureRecognizer(guestureRecognizer)
        bubbleView.backgroundColor = .green
        bubbleView.frame = CGRect(x: 50, y: 50, width: 250, height: 250)
        
        self.view.addSubview(
            bubbleView
        )
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan in ViewController")
    }
    
}

