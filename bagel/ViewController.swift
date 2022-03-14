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
            
                
                self.bubbleView.bounds = CGRect(x: 10, y: 0, width: 200, height: 200)
                self.bubbleView.shapeLayer.bounds = CGRect(x: -10, y: 0, width: 200, height: 200)
  
            }, completion: nil)
            
        }))
        
        
        alert.addAction(UIAlertAction(title: "повернуть на 45 градусов", style: .default, handler: { action in
            UIView.animate(withDuration: 1, delay: 0.4, options: [], animations: {
               
                self.bubbleView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(-45) * .pi/180))

                
            }, completion: { action in
                print(self.bubbleView.frame)
                print(self.bubbleView.bounds)
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

