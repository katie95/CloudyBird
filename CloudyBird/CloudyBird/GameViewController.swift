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
    var timeInterval = 1.0
    var timer: NSTimer!
    var CloudList: [UIImageView]! = []
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var birdSize = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        //this is the background picture
        let bgImage = UIImage(named: "background1")
        let bgImageView = UIImageView(image: bgImage!)
        bgImageView.frame = view.frame
        view.addSubview(bgImageView)
        
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
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [birdImageView])
        gravity.magnitude = 0.3
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [birdImageView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "timerFired:",userInfo: nil, repeats: true)
    }
    
    func timerFired(timer: NSTimer){
        let cloud = Cloud()
        CloudList.append(cloud.imageView)
        cloud.imageView.frame = CGRect(x: view.frame.maxX, y: (CGFloat(arc4random()) % (view.frame.size.height)), width: 200, height: 125)
        view.addSubview(cloud.imageView)
        let push = UIPushBehavior(items: [cloud.imageView], mode: UIPushBehaviorMode.Instantaneous)
        push.setAngle(CGFloat(M_PI), magnitude: 5)
        animator.addBehavior(push)
        cloud.push = push
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //print("detect touches")
        //animator.removeBehavior(gravity)
        bird.BirdImage = UIImage(named: "BirdFly1")!
        birdImageView.image = UIImage(named: "BirdFly1")
        let push = UIPushBehavior(items: [self.birdImageView], mode: UIPushBehaviorMode.Instantaneous)
        push.setAngle(CGFloat(M_PI_2), magnitude: -3)
        self.animator.addBehavior(push)
        let delay = Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.animator.removeBehavior(push)
            self.bird.BirdImage = UIImage(named: "BirdFly2")!
            self.birdImageView.image = UIImage(named: "BirdFly2")
        }
        
        
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
