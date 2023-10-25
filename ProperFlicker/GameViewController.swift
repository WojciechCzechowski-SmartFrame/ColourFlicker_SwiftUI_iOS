//
//  GameViewController.swift
//  ProperFlicker
//
//  Created by Wojciech Czechowski on 03/10/2023.
//

import UIKit
import SpriteKit
import GameplayKit
import SwiftUI

class GameViewController: UIViewController {
    var currentGame: GameScene?
    
    @IBOutlet var shouldFlicker: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        if let view = self.view as! SKView? {

            if let scene = SKScene(fileNamed: "GameScene") {

                view.presentScene(scene)
                
                currentGame = scene as? GameScene
                currentGame?.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true 
            view.showsNodeCount = false
        }
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
    
    
    @IBAction func toggleFlickering(_ sender: UISwitch, forEvent event: UIEvent) {
        if shouldFlicker.isOn {
            currentGame?.startFlickering()
        } else {
            currentGame?.stopFlickering()
        }
    }
    
}
