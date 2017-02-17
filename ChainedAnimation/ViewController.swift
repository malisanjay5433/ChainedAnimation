//
//  ViewController.swift
//  ChainedAnimation
//
//  Created by Sanjay Mali on 17/02/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var snap: UIImageView!
    @IBOutlet weak var skype: UIImageView!
    @IBOutlet weak var welcomeTxt: UILabel!
    @IBOutlet weak var subTxt: UILabel!
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var fb: UIButton!
    @IBOutlet weak var snapChat: UIButton!
    @IBOutlet weak var skpye: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var circleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeTxt.alpha = 0
        self.subTxt.alpha = 0
        self.bg.alpha = 0
        self.skype.alpha = 0
        self.snap.alpha = 0
        self.circleView.layer.cornerRadius = 22
        self.circleView.layer.masksToBounds = true
        self.fb.alpha = 0
        self.snapChat.alpha  = 0
        self.skpye.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.bg.alpha = 0.8
        }) { (true) in
            self.showText()
        }
    }
    @IBAction func toggleButton(_ sender: Any) {
        if circleView.transform == CGAffineTransform.identity{
            UIView.animate(withDuration: 1, animations: {
                self.circleView.transform = CGAffineTransform(scaleX: 11, y: 11)
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -67)
                self.button.transform = CGAffineTransform(rotationAngle: self.radians(180))

            }) { (true) in
                
                UIView.animate(withDuration: 1, animations: {
                    self.toggleButton()

                })
            }
        }else{
                UIView.animate(withDuration: 1, animations: {
                    self.circleView.transform = .identity
                    self.menuView.transform = .identity
                    self.button.transform = .identity
                    self.toggleButton()

                })
        }
        
    }
    
    func toggleButton(){
        let alpha = CGFloat(fb.alpha == 0 ? 1 : 0)
        fb.alpha = alpha
        skpye.alpha = alpha
        snapChat.alpha = alpha
    }

    func radians(_ degree:Double) ->CGFloat {
        
        return CGFloat(degree * .pi/degree)
    }
    func showSocial(){
        UIView.animate(withDuration: 0.5, animations: {
            self.skype.alpha = 1
        }, completion: { (true) in
            UIView.animate(withDuration: 0.5, animations: {
                self.snap.alpha = 1
            })
        })
    }
    func subText(){
        UIView.animate(withDuration: 1, animations: {
            self.subTxt.alpha = 1
        }, completion: { (true) in
            self.showSocial()
        })
    }
    
    
    func showText(){
        UIView.animate(withDuration: 1, animations: {
            self.welcomeTxt.alpha = 1
        }, completion: { (true) in
            self.subText()
        })
    }
}
