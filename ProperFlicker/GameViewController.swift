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
    
//    @IBOutlet weak var pickedColor: UIColorWell!
    @IBOutlet var shouldFlicker: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        pickedColor.addTarget(self, action: #selector(self.colorChangeHandler), for: .valueChanged)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'

            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 500)
                
                // Present the scene
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
//    
//    @IBAction func colorChangeHandler(_ sender: UIColorWell, forEvent event: UIEvent) {
////        self.currentGame?.scene!.backgroundColor = pickedColor.selectedColor!
//        shouldFlicker.isOn = false
//        self.currentGame?.prepareAndRenderFrames(pickedColor.selectedColor!)
//    }

    
}
