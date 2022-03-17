import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    
    let bubbleView: BubbleView = BubbleView()
    let halfFrameBuble = Int(BubbleView().lineWidth / 2)
    
    var horizontalConstraint: NSLayoutConstraint!
    var verticalConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    
    func changeFrameView() {
        
        self.bubbleView.frame = CGRect(
            x: self.bubbleView.frame.origin.x + 10,
            y: self.bubbleView.frame.origin.y + 20,
            width: self.bubbleView.frame.size.width + 30,
            height: self.bubbleView.frame.size.height + 15
        )
        
    }
    
    func changeConstraintView() {
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.horizontalConstraint = NSLayoutConstraint(
            item: self.bubbleView,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: 0
        )
        
        self.verticalConstraint = NSLayoutConstraint(
            item: self.bubbleView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self.view,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0
        )
        
        self.widthConstraint = NSLayoutConstraint(
            item: self.bubbleView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 200
        )
        
        self.heightConstraint = NSLayoutConstraint(
            item: self.bubbleView,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 200
        )
        
        self.view.addConstraints(
            [
             self.horizontalConstraint,
             self.verticalConstraint,
             self.widthConstraint,
             self.heightConstraint
            ]
        )
        
        //обязательно для работы анимации при изменении Constraints
        self.view.layoutIfNeeded()
        
    }
    
    func rotateBubleTO45(){
        
        let radians = atan2f(Float(self.bubbleView.transform.b), Float(self.bubbleView.transform.a));
        let degrees = radians * (180 / Float(M_PI));

        self.bubbleView.transform = CGAffineTransform(rotationAngle: CGFloat(Double(Double(degrees-45) * .pi/180)))
        
    }
    
    @objc func innerСircleClicked(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController(
            title: "Выберете вариант взаимодействия с окружностью",
            message: "Доступны действия: изменить размер и перемещение, вращение на 45 градусов.",
            preferredStyle: .alert
        )
         
        alert.addAction(UIAlertAction(title: "изменить размер и переместить", style: .default, handler: { action in
               
                    
            UIView.animate(withDuration: 0.5, delay: 0.4, options: [], animations: {
                        
                // Вариант расположения вьюхи, через frame
                self.changeFrameView()
                        
                // Вариант расположения вьюхи, через Constraints
                //self.changeConstraintView()
              
            }, completion: nil)
                    

        }))
        
        
        alert.addAction(UIAlertAction(title: "повернуть на 45 градусов", style: .default, handler: { action in
            
            UIView.animate(withDuration: 1, delay: 0.4, options: [], animations: {
                
                self.rotateBubleTO45()
                
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
     
        self.view.addSubview(bubbleView)
        
        self.setViewWithFrame()
        //self.setViewWithConstraint()
        
    }
    
    func setViewWithFrame(){
        
        self.bubbleView.frame = CGRect(x: 50, y: 50, width: 250, height: 250)
        
    }
    
    
    func setViewWithConstraint(){
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.horizontalConstraint = NSLayoutConstraint(
            item: bubbleView,
            attribute: NSLayoutConstraint.Attribute.centerX,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.centerX,
            multiplier: 1,
            constant: 0
        )
        
        self.verticalConstraint = NSLayoutConstraint(
            item: bubbleView,
            attribute: NSLayoutConstraint.Attribute.centerY,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.centerY,
            multiplier: 1,
            constant: 0
        )
        
        self.widthConstraint = NSLayoutConstraint(
            item: bubbleView,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 300
        )
        
        self.heightConstraint = NSLayoutConstraint(
            item: bubbleView,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: 300
        )
        
        view.addConstraints(
            [
             self.horizontalConstraint,
             self.verticalConstraint,
             self.widthConstraint,
             self.heightConstraint
            ]
        )
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan in ViewController")
    }
    
}
