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
    
    @objc func innerСircleClicked(_ sender: UITapGestureRecognizer) {
        
        let tapLocation = sender.location(in: sender.view)
        let result = sqrt(pow((CGFloat(tapLocation.x) - bubbleView.arcCenter.x), 2) + pow(CGFloat(tapLocation.y)-CGFloat(bubbleView.arcCenter.y), 2) )
        
        if(Int(result) > Int(bubbleView.radius) + 15) {
            print("Клик вне круга")
        }else if( Int(result) > Int(bubbleView.radius) + 15 || Int(result) > Int(bubbleView.radius) - 15){
            print("Клик по кругу")
        }else {
            print("Клик внутри круга")
        }

    }

    override func viewDidLoad(){
        super.viewDidLoad()
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(innerСircleClicked(_:)))
        bubbleView.addGestureRecognizer(guestureRecognizer)
        
        view.addSubview(
            bubbleView
        )
        
        self.view.addSubview(
            view
        )
 
    }
    
}

