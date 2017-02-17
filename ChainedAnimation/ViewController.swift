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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeTxt.alpha = 0
        self.subTxt.alpha = 0
        self.bg.alpha = 0
        self.skype.alpha = 0
        self.snap.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.bg.alpha = 0.8
        }) { (true) in
            self.showText()
        }
    }
    
    func showSocial(){
        UIView.animate(withDuration: 1, animations: {
            self.skype.alpha = 1
        }, completion: { (true) in
            UIView.animate(withDuration: 1, animations: {
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
