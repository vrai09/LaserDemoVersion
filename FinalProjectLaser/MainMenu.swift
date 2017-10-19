//
//  MenuScene.swift
//  Lasers
//
//  Created by Livleen Rai on 2017-09-07.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

//
//  MainMenu.swift
//  FinalProjectLaser
//
//  Created by Jaewon Kim on 2017-09-05.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
    
    var background:Background = Background()
    let hero:Hero = Hero()
    
    override func didMove(to view: SKView) {
        background.createBackgrounds(scene:self)
    }
    
    override func update(_ currentTime: TimeInterval) {
            
        background.moveBackgrounds(scene:self, hero: hero)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self);
            if atPoint(location).name == "Play" {
                
                if let scene = GameScene(fileNamed: "GameScene") {
                    scene.scaleMode = .aspectFit
                    view?.presentScene(scene)
                }
                
            }
        }
        
    }
    
    
    
}




