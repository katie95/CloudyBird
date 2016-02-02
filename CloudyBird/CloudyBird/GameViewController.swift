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
    var cloudImageView: UIImageView!
    var timeInterval = 2.0
    var timer: NSTimer!
    var CloudList: [Cloud]! = []
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var birdSize = 100
    
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
        birdImageView.frame = CGRect(x: 50, y: 200, width: birdSize, height: birdSize)
        view.addSubview(birdImageView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [birdImageView])
        gravity.magnitude = 0.5
        animator.addBehavior(gravity)
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "timerFired:",userInfo: nil, repeats: true)
    }
    
    func timerFired(timer: NSTimer){
        
        let cloud = Cloud()
        CloudList.append(cloud)
        cloudImageView = UIImageView(image: cloud.image)
        cloudImageView.frame = CGRect(x: view.frame.maxX, y: 50, width: 200, height: 125)
        view.addSubview(cloudImageView)
        UIView.animateWithDuration(2, animations: { () -> Void in
            self.cloudImageView.frame.offsetInPlace(dx: -self.view.frame.width - 200, dy: 0)
            }, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("detect touches")
        animator.removeBehavior(gravity)
        bird.BirdImage = UIImage(named: "BirdFly1")!
        birdImageView.image = UIImage(named: "BirdFly1")
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.birdImageView.frame.offsetInPlace(dx: 0, dy: -150)
            }) { (Bool) -> Void in
                self.bird.BirdImage = UIImage(named: "BirdFly2")!
                self.birdImageView.image = UIImage(named: "BirdFly2")
        }
        
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
