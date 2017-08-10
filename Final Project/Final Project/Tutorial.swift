//
//  Tutorial.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/8/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit
import GameplayKit

class Tutorial : SKScene {
    var frames = 0
    var label: SKLabelNode!
    var table: SKSpriteNode!
    var sample: SKSpriteNode!
    var stone: SKSpriteNode!
    var stoneIcon: MSButtonNode!
    var done: MSButtonNode!
    
    override func didMove(to view: SKView) {
        label = childNode(withName: "label") as! SKLabelNode
        table = childNode(withName: "table") as! SKSpriteNode
        sample = childNode(withName: "sample") as! SKSpriteNode
        stone = childNode(withName: "stone") as! SKSpriteNode
        stoneIcon = childNode(withName: "//stoneIcon") as! MSButtonNode
        stoneIcon.selectedHandler = {
            self.stone.position.x = 300
            self.stone.position.y = 300
        }
        done = childNode(withName: "done") as! MSButtonNode
        done.selectedHandler = {
            self.loadGame()
        }
    }
    
    func loadGame() {
        /* 1) Grab reference to our SpriteKit view */
        guard let skView = self.view as SKView! else {
            print("Could not get Skview")
            return
        }
        
        /* 2) Load Game scene */
        guard let scene = GameScene(fileNamed: "GameScene") else {
            print("Could not load GameScene with level 1")
            return
        }
        
        /* 3) Ensure correct aspect mode */
        scene.scaleMode = .aspectFill
        
        /* Show debug */
        skView.showsPhysics = true
        skView.showsDrawCount = true
        skView.showsFPS = true
        
        /* 4) Start game scene */
        skView.presentScene(scene)
    }

    func tutorial() {
        table.zPosition = -3
        label.text = "Hello, you must be the ace architect"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.label.text = "You must build the strongest, tallest and cheapest"
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.table.zPosition = 2
                self.label.text = "The table list information about avaliable materials"
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.label.text = "Now, let's try using the materials"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.label.text = "Press the stone icon"
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = atPoint(t.location(in: self))
            if node.name == "stone" {
                node.position = t.location(in: self)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        frames = frames + 1
        if stone.position.x == 300.0 {
            label.text = "Good. Press the button when ready, but WAIT!"
            done.zPosition = 2
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.label.text = "You can drag the blocks anyway you see fit, limit is 15"
            }
        }
        if frames == 60 {
            tutorial()
        }
    }
}
