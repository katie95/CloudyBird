//
//  RuleViewController.swift
//  CloudyBird
//
//  Created by Katie Ning on 1/31/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        view.opaque = false
        let rule = UIView(frame: CGRect(x: 40, y: 40, width: 400, height: 500))
        rule.backgroundColor = UIColor.redColor()
        view.addSubview(rule)
        // Do any additional setup after loading the view.
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
