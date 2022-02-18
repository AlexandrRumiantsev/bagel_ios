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
        
        let bugel = UIView()
        bugel.layer.cornerRadius = (UIScreen.main.bounds.width/2) / 2
        bugel.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y:  UIScreen.main.bounds.height/2 - 100, width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
        bugel.clipsToBounds = true
        bugel.backgroundColor = .green
       
        
        view.addSubview(bugel)
        
        let innerСircle = UIView()
        innerСircle.layer.cornerRadius = 50
        innerСircle.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        innerСircle.clipsToBounds = true
        innerСircle.backgroundColor = .white
        innerСircle.center = CGPoint(x: bugel.bounds.width / 2, y: bugel.bounds.height / 2)
        
    
        innerСircle.isUserInteractionEnabled = true
        let guestureRecognizerInner = UITapGestureRecognizer(target: self, action: #selector(innerСircleClicked(_:)))
        innerСircle.addGestureRecognizer(guestureRecognizerInner)
        
        
        bugel.addSubview(innerСircle)
        
        bugel.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bugelClicked(_:)))
        bugel.addGestureRecognizer(guestureRecognizer)
        
        self.view.addSubview(
            view
        )
        self.view.addSubview(view)
        
        
    }
    
    @objc func bugelClicked(_ sender: Any) {
        print("bugel clicked")
    }
    
    @objc func innerСircleClicked(_ sender: Any) {
        print("innerСircle clicked")
    }
}

