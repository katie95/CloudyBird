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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        view.backgroundColor = UIColor.whiteColor()
        //this is the title of the game
        let NameImage = UIImage(named: "GameName")
        let NameImageView = UIImageView(image: NameImage!)
        NameImageView.frame = CGRect(x: 0, y: 50, width: 420, height: 45)
        view.addSubview(NameImageView)
        
        //this is the start button of the game
        let startImage = UIImage(named: "StartGame")
        let startImageView = UIImageView(image: startImage!)
        startImageView.frame = CGRect(x: 0, y: 300, width: 150, height: 50)
        startImageView.center = CGPoint(x: view.frame.midX, y: 300)
        
        //create gesture actions for the image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("startTapped:"))
        startImageView.userInteractionEnabled = true
        startImageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(startImageView)
        
        //this is the button for the rule
        let ruleImage = UIImage(named: "Rule")
        let ruleImageView = UIImageView(image: ruleImage!)
        ruleImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        ruleImageView.center = CGPoint(x: view.frame.midX, y: 400)
        let ruleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("ruleTapped:"))
        ruleImageView.userInteractionEnabled = true
        ruleImageView.addGestureRecognizer(ruleTapGestureRecognizer)
        view.addSubview(ruleImageView)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func startTapped(img: AnyObject){
        let gameVC = GameViewController()
        presentViewController(gameVC, animated: true, completion: nil)
        
    }
    
    func ruleTapped(img: AnyObject){
        print("rule tapped")
        //plan to add a subview, with animation
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

