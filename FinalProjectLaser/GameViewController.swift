//
//  GameViewController.swift
//  FinalProjectLaser
//
//  Created by Jaewon Kim on 2017-09-05.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    //public var pressedPlayAgain:Bool = false
    //public var pressedMainMenu:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        showMainMenu()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showMainMenu()
    }
    
    public func showMainMenu() {
        
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "MainMenu"){
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
        }
        
    }


    override var shouldAutorotate: Bool {
        return true
    }
    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}
