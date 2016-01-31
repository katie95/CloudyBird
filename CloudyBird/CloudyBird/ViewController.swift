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
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func startTapped(img: AnyObject){
        print("image tapped")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

