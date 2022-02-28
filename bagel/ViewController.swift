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
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
            self.bubbleView.frame =  CGRect(x: 150, y: 150, width: 250, height: 250)
        }, completion: nil)
        
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

