//
//  Cloud.swift
//  CloudyBird
//
//  Created by Katie Ning on 1/31/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class Cloud: NSObject {
    var image: UIImage
    var imageView: UIImageView
    var push: UIPushBehavior!
    override init() {
        self.image = UIImage(named: "Cloud1")!
        self.imageView = UIImageView(image: self.image)
    }
}
