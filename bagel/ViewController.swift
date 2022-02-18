//
//  ViewController.swift
//  bagel
//
//  Created by Александр on 16/02/2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad(){
        super.viewDidLoad()
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        view.backgroundColor = .white
        
        let bubbleView = BubbleView()
        
        bubbleView.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bugelClicked(_:)))
        bubbleView.addGestureRecognizer(guestureRecognizer)
        
        view.addSubview(
            bubbleView
        )
        
        self.view.addSubview(
            view
        )
 
    }
    
    @objc func bugelClicked(_ sender: Any) {
        print("bugel clicked")
    }
    
}

