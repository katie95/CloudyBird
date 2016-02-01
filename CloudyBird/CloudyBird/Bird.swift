//
//  Bird.swift
//  CloudyBird
//
//  Created by Katie Ning on 1/31/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class Bird: NSObject {
    var BirdImage: UIImage
    
    override init() {
        self.BirdImage = UIImage(named: "BirdFly2")!
    }
}
