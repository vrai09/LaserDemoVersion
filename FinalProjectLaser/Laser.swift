//
//  Laser.swift
//  FinalProjectLaser
//
//  Created by Jaewon Kim on 2017-09-11.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import Foundation

import SpriteKit
import GameplayKit

class Laser: SKSpriteNode {
    
    static var leftLaserMovementSpeed: CGFloat = 4.0
    
    var laserHub:SKSpriteNode = LaserHub()

    static func leftLaserSpeedIncrease() {
        self.leftLaserMovementSpeed = self.leftLaserMovementSpeed * 1.2
    }
    
    static func moveLaser(scene:SKScene, hero:Hero) {
            
        scene.enumerateChildNodes(withName:"laser")
        {
            
            (node, error) in
            
            node.position.y -= self.leftLaserMovementSpeed
            
        }
    }
    
    static func removeExessLasers(scene:SKScene) {
        
        for temp in scene.children {
            if temp.name == "laser" && temp.position.y < -700 {
                temp.removeFromParent()
                print(temp.position.y)
            }
        }
    }
    
}
