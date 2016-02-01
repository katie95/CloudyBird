//
//  GameViewController.swift
//  CloudyBird
//
//  Created by Katie Ning on 1/31/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var bird: Bird!
    var birdImageView: UIImageView!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        //view.backgroundColor = UIColor.blueColor()
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
        
        let birdImage = bird.BirdImage
        birdImageView = UIImageView(image: birdImage)
        birdImageView.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
        view.addSubview(birdImageView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [birdImageView])
        gravity.magnitude = 0.5
        animator.addBehavior(gravity)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("detect touches")
        animator.removeBehavior(gravity)
        birdImageView.image = UIImage(named: "BirdFly1")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.birdImageView.frame = CGRect(x: 50, y: self.birdImageView.frame.minY - 100, width: 100, height: 100)
            }, completion: nil)
        birdImageView.image = UIImage(named: "BirdFly2")
        animator.addBehavior(gravity)
    }
    func backTapped(img: AnyObject){
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
