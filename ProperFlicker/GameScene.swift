//
//  GameScene.swift
//  Flicker
//
//  Created by Wojciech Czechowski on 03/10/2023.
//

import SpriteKit
import SwiftUI

class GameScene: SKScene {
        
    var frame1 = SKSpriteNode()
    var frame2 = SKSpriteNode()
    
    let bgColor = UIColor(red: 85/255, green: 128/255, blue: 170/255, alpha: 1.0)
    let color1 = UIColor(red: 95/255, green: 142/255, blue: 152/255, alpha: 1.0)
    let color2 = UIColor(red: 75/255, green: 114/255, blue: 152/255, alpha: 1.0)
    
    var textureArray = [SKTexture]()
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    weak var viewController: GameViewController?
        
    override func didMove(to view: SKView) {
        prepareAndRenderFrames(bgColor)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func prepareAndRenderFrames(_ baseColor: UIColor) {
        self.scene?.backgroundColor = baseColor
        
//        setFlickeringColours(from: baseColor)
        textureArray.removeAll()
        stopFlickering()
        
        let frame1Img = createFrame(mainColor: bgColor, firstColor: color1, secondColor: color2)
        let frame1Texture = SKTexture(image: frame1Img)
        textureArray.append(frame1Texture)
        
        let frame2Img = createFrame(mainColor: bgColor, firstColor: color2, secondColor: color1)
        let frame2Texture = SKTexture(image: frame2Img)
        textureArray.append(frame2Texture)
        
        frame1 = SKSpriteNode(texture: frame1Texture)
        frame1.position = CGPoint.zero
        
        self.removeAllChildren()
        self.addChild(frame1)
    }
    
//    func setFlickeringColours(from baseColor: UIColor) {
//        (color1, color2) = ColoursCalculator.calculateFlickeringColors(from: baseColor)
//        
//        if viewController?.shouldFlicker.isEnabled == false {
//            viewController?.shouldFlicker.isEnabled = true
//        }
//    }
//    
    
    func startFlickering() {
        frame1.run(SKAction.repeatForever(SKAction.animate(with: textureArray, timePerFrame: 1/60)), withKey: "flickering")
    }
    
    func stopFlickering() {
        frame1.removeAction(forKey: "flickering")
    }
    
    func createFrame(mainColor: UIColor, firstColor: UIColor, secondColor: UIColor) -> UIImage {
        let size = CGSize(width: screenWidth, height: screenHeight / 2)
        let innerSize = size.width / 8
        let smallRect = CGRect(x: size.width / 2 - innerSize, y: size.height / 2 - innerSize / 2, width: innerSize, height: innerSize)
                
        let renderer = UIGraphicsImageRenderer(size: size)
        
        let frame = renderer.image { ctx in
            
            let bgRectangle = CGRect(x: 0, y: 0, width: size.width, height: size.height);
            mainColor.setFill()
            ctx.cgContext.addRect(bgRectangle)
            ctx.cgContext.drawPath(using: .fill)
            
            firstColor.setFill()
            ctx.cgContext.addRect(smallRect)
            ctx.cgContext.drawPath(using: .fill)
            
            secondColor.setFill()
            ctx.cgContext.addRect(smallRect.offsetBy(dx: CGFloat(innerSize), dy: 0))
            ctx.cgContext.drawPath(using: .fill)
            
        }
        
        return frame
    }
}
