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
        NameImageView.frame = CGRect(x: 20, y: 150, width: 365, height: 190)
        view.addSubview(NameImageView)
        
        //this is the button for the rule
        let ruleImage = UIImage(named: "Rule")
        let ruleImageView = UIImageView(image: ruleImage!)
        ruleImageView.frame = CGRect(x: view.frame.midX-50, y: 450, width: 300, height: 300)
        let ruleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("ruleTapped:"))
        ruleImageView.userInteractionEnabled = true
        ruleImageView.addGestureRecognizer(ruleTapGestureRecognizer)
        view.addSubview(ruleImageView)
        
        
        //this is the start button of the game
        let startImage = UIImage(named: "StartGame")
        let startImageView = UIImageView(image: startImage!)
        startImageView.frame = CGRect(x: -40, y: 350, width: 300, height: 300)
        
        
        //create gesture actions for the image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("startTapped:"))
        startImageView.userInteractionEnabled = true
        startImageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(startImageView)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func startTapped(img: AnyObject){
        let gameVC = GameViewController()
        presentViewController(gameVC, animated: true, completion: nil)
        
    }
    
    func ruleTapped(img: AnyObject){
        print("rule tapped")
        let ruleVC = RuleViewController()
        ruleVC.modalPresentationStyle = .OverCurrentContext
        presentViewController(ruleVC, animated: true, completion: nil)
        //plan to add a subview, with animation
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

