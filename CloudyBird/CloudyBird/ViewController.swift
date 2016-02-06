//
//  ViewController.swift
//  CloudyBird
//
//  Created by Katie Ning on 1/31/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//
//  This is the launch page for the game. Infomation include the title, the option to start the
//  game, and the direction to rules.

import UIKit

class ViewController: UIViewController {
    var ruleImageView: UIImageView!
    var backImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        view.backgroundColor = UIColor.whiteColor()
        
        //this is the background picture
        let bgImage = UIImage(named: "background1")
        let bgImageView = UIImageView(image: bgImage!)
        bgImageView.frame = view.frame
        view.addSubview(bgImageView)
        
        //this is the title of the game
        let NameImage = UIImage(named: "GameName")
        let NameImageView = UIImageView(image: NameImage!)
        NameImageView.frame = CGRect(x: 20, y: 120, width: 365, height: 190)
        view.addSubview(NameImageView)
        
        //this is the button for the rule
        let ruleImage = UIImage(named: "Rule")
        let ruleImageView = UIImageView(image: ruleImage!)
        ruleImageView.frame = CGRect(x: view.frame.maxX, y: 450, width: 225, height: 150)
        let ruleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("ruleTapped:"))
        ruleImageView.userInteractionEnabled = true
        ruleImageView.addGestureRecognizer(ruleTapGestureRecognizer)
        view.addSubview(ruleImageView)
        UIView.animateWithDuration(2, animations: { () -> Void in
            ruleImageView.frame = CGRect(x: self.view.frame.midX - 20, y: 450, width: 225, height: 150)
            }, completion: nil)
        
        
        //this is the start button of the game
        let startImage = UIImage(named: "StartGame")
        let startImageView = UIImageView(image: startImage!)
        startImageView.frame = CGRect(x: view.frame.minX - 225/2, y: 350, width: 225, height: 150)
        
        //create gesture actions for the image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("startTapped:"))
        startImageView.userInteractionEnabled = true
        startImageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(startImageView)
        UIView.animateWithDuration(2, animations: { () -> Void in
            startImageView.frame = CGRect(x: self.view.frame.midX - 200, y: 350, width: 225, height: 150)
            }, completion: nil)
        
        
        let birdImage = UIImage(named: "BirdFly1")
        let birdImageView = UIImageView(image: birdImage!)
        birdImageView.frame = CGRect(x: self.view.frame.midX + 35, y: 330, width: 100, height: 100)
        let delay = Double(2*NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.view.addSubview(birdImageView)
            UIView.animateWithDuration(1, animations: { () -> Void in
                birdImageView.frame = CGRect(x: self.view.frame.midX + 35, y: 367, width: 100, height: 100)
                }, completion: nil)
        }
                // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func startTapped(img: AnyObject){
        let gameVC = GameViewController()
        //assign a bird for the game
        gameVC.bird = Bird()
        presentViewController(gameVC, animated: true, completion: nil)
        
    }
    
    func ruleTapped(img: AnyObject){
        //plan to add a subview, with animation
        
        let rule = UIImage(named: "RulePage")
        ruleImageView = UIImageView(image: rule)
        ruleImageView.frame = CGRect(x: 40, y: 40, width: 350, height: 600)
        ruleImageView.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        ruleImageView.hidden = true
        self.view.addSubview(self.ruleImageView)
        
        //this is the back button
        let backImage = UIImage(named: "Back")
        backImageView = UIImageView(image: backImage!)
        backImageView.frame = CGRect(x: view.frame.maxX-90, y: 70, width: 50, height: 50)
        
        //create gesture actions for the image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("backTapped:"))
        backImageView.userInteractionEnabled = true
        backImageView.addGestureRecognizer(tapGestureRecognizer)
        backImageView.hidden = true
        self.view.addSubview(self.backImageView)
        UIView.animateWithDuration(5, animations: { () -> Void in
            self.ruleImageView.hidden = false
            self.backImageView.hidden = false
            
            }, completion: nil)
        
    }
    
    func backTapped(img: AnyObject){
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.ruleImageView.removeFromSuperview()
            self.backImageView.removeFromSuperview()
            }, completion: nil)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

