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
        
        self.settingBuble()
        
        let innerСircle = UIView()
        innerСircle.layer.cornerRadius = 50
        innerСircle.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        innerСircle.clipsToBounds = true
        innerСircle.backgroundColor = .white
        
        innerСircle.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        
        innerСircle.isUserInteractionEnabled = true
        let guestureRecognizerInner = UITapGestureRecognizer(target: self, action: #selector(innerСircleClicked(_:)))
        innerСircle.addGestureRecognizer(guestureRecognizerInner)
        
        self.addSubview(innerСircle)
        
    }
    
    func settingBuble(){
        self.layer.cornerRadius = (UIScreen.main.bounds.width/2) / 2
        self.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y:  UIScreen.main.bounds.height/2 - 100, width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
        self.clipsToBounds = true
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func innerСircleClicked(_ sender: Any) {
        print("innerСircle clicked")
    }
    

}
