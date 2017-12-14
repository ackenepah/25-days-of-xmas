//
//  EarthNode.swift
//  day2-3dearth
//
//  Created by Adrian Kenepah-Martin on 12/13/17.
//  Copyright © 2017 Adrian Kenepah-Martin. All rights reserved.
//

import SceneKit

class EarthNode: SCNNode {
    
    override init() {
        super.init()
        self.geometry = SCNSphere(radius: 1)
        self.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
