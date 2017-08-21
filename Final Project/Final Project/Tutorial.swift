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
    var textIndex = -1
    var bool = false
    var labels: SKLabelNode!
    var materialLabel: SKLabelNode!
    var strengthLabel: SKLabelNode!
    var costLabel: SKLabelNode!
    var weakLabel: SKLabelNode!
    var resLabel: SKLabelNode!
    
    var label: SKLabelNode!
    var sample: SKSpriteNode!
    var stone: SKSpriteNode!
    var stoneIcon: MSButtonNode!
    var brickIcon: MSButtonNode!
    var thatchIcon: MSButtonNode!
    var iceIcon: MSButtonNode!
    var marbleIcon: MSButtonNode!
    var copperIcon: MSButtonNode!
    var done: MSButtonNode!
    var play: MSButtonNode!
    var back: MSButtonNode!
    var textArray = ["Hello, you must be the ace architect", "Build the strongest, tallest and cheapest tower", "To learn more info, press the buttons on the sidebar"]
    
    override func didMove(to view: SKView) {
        labels = childNode(withName: "labels") as! SKLabelNode
        materialLabel = childNode(withName: "//materialLabel") as! SKLabelNode
        strengthLabel = childNode(withName: "//strengthLabel") as! SKLabelNode
        costLabel = childNode(withName: "//costLabel") as! SKLabelNode
        weakLabel = childNode(withName: "//weakLabel") as! SKLabelNode
        resLabel = childNode(withName: "//resLabel") as! SKLabelNode
        label = childNode(withName: "label") as! SKLabelNode
        stone = childNode(withName: "stone") as! SKSpriteNode
        stoneIcon = childNode(withName: "//stoneIcon") as! MSButtonNode
        stoneIcon.selectedHandler = {
            self.labels.zPosition = 3
            self.materialLabel.text = "Stone"
            self.strengthLabel.text = "40"
            self.costLabel.text = "40"
            self.weakLabel.text = "Acid, Ground"
            self.resLabel.text = "Wind"
            self.bool = true
        }
        brickIcon = childNode(withName: "//brickIcon") as! MSButtonNode
        brickIcon.selectedHandler = {
            self.labels.zPosition = 3
            self.materialLabel.text = "Brick"
            self.strengthLabel.text = "55"
            self.costLabel.text = "20"
            self.weakLabel.text = "Ground"
            self.resLabel.text = "Wind"
            self.bool = true
        }
        thatchIcon = childNode(withName: "//thatchIcon") as! MSButtonNode
        thatchIcon.selectedHandler = {
            self.labels.zPosition = 3
            self.materialLabel.text = "Thatch"
            self.strengthLabel.text = "35"
            self.costLabel.text = "50"
            self.weakLabel.text = "Bug, Acid"
            self.resLabel.text = "Water, Ground"
            self.bool = true
        }
        iceIcon = childNode(withName: "//iceIcon") as! MSButtonNode
        iceIcon.selectedHandler = {
            self.labels.zPosition = 3
            self.materialLabel.text = "Ice"
            self.strengthLabel.text = "30"
            self.costLabel.text = "35"
            self.weakLabel.text = ""
            self.resLabel.text = "Acid, Water, Bug"
            self.bool = true
        }
        marbleIcon = childNode(withName: "//marbleIcon") as! MSButtonNode
        marbleIcon.selectedHandler = {
            self.labels.zPosition = 3
            self.materialLabel.text = "Marble"
            self.strengthLabel.text = "45"
            self.costLabel.text = "45"
            self.weakLabel.text = "Water, Acid"
            self.resLabel.text = ""
            self.bool = true
        }
        copperIcon = childNode(withName: "//copperIcon") as! MSButtonNode
        copperIcon.selectedHandler = {
            self.labels.zPosition = 3
            self.materialLabel.text = "Copper"
            self.strengthLabel.text = "70"
            self.costLabel.text = "70"
            self.weakLabel.text = "Water, Acid"
            self.resLabel.text = "Bug, Ground"
            self.bool = true
        }
        done = childNode(withName: "done") as! MSButtonNode
        done.selectedHandler = {
            self.loadGame()
        }
        play = childNode(withName: "play") as! MSButtonNode
        play.selectedHandler = {
            if self.textIndex <= self.textArray.count - 2 {
                self.textIndex = self.textIndex + 1
            }
        }
        back = childNode(withName: "back") as! MSButtonNode
        back.selectedHandler = {
            if self.textIndex > 0 {
                self.textIndex = self.textIndex - 1
            }
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
        scene.scaleMode = .aspectFit
        
        /* Show debug */
        skView.showsPhysics = false
        skView.showsDrawCount = false
        skView.showsFPS = false
        
        /* 4) Start game scene */
        skView.presentScene(scene)
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
        if bool == true {
            done.zPosition = 2
        }
        if done.zPosition == 2 {
            textArray.append("Good. Press the button when ready, but")
            textArray.append("You can drag the blocks anyway you see fit, limit is 15")
            done.zPosition = 3
        }
        if frames == 1 {
            self.label.text = "Press the green buttons to advance through the text"
        }
        if textIndex >= 0 {
            self.label.text = textArray[textIndex]
        }
    }
}
