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
        print("innerСircle clicked ViewController")
        let tapLocation = sender.location(in: sender.view)
        //print(tapLocation.x)
        //print(tapLocation.y)
        //25 толщина границы
        //print(bubbleView.layer.anchorPoint)
         //print(bubbleView.layer.frame)
        // 0-50 - Левая сторона
        
        guard let hitTestNode = self.augmentedRealityView.hitTest(tapLocation, options: nil).first?.node else { return }
    
         print(hitTestNode)

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

