//
//  GameViewController.swift
//  CloudyBird
//
//  Created by Katie Ning on 1/31/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        view.backgroundColor = UIColor.blueColor()
        //this is the back button
        let backImage = UIImage(named: "Back")
        let backImageView = UIImageView(image: backImage!)
        backImageView.frame = CGRect(x: view.frame.maxX-50, y: 0, width: 50, height: 50)
        
        //create gesture actions for the image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("backTapped:"))
        backImageView.userInteractionEnabled = true
        backImageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(backImageView)
        // Do any additional setup after loading the view.
        
        let bird1Image = UIImage(named: "BirdFly1")
        let bird1ImageView = UIImageView(image: bird1Image!)
        bird1ImageView.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        view.addSubview(bird1ImageView)
    }
    
    func backTapped(img: AnyObject){
        //print("back tapped")
        let launchVC = ViewController()
        
        presentViewController(launchVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
