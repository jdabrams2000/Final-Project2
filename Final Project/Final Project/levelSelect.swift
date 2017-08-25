//
//  levelSelect.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/23/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit
import GameplayKit

class levelSelect: SKScene {
    
    var levelOne: MSButtonNode!
    var levelTwo: MSButtonNode!
    var levelThree: MSButtonNode!
    var levelFour: MSButtonNode!
    var levelFive: MSButtonNode!
    var notUnlock: SKLabelNode!
    var homeButton: MSButtonNode!
    
    override func didMove(to view: SKView) {
        notUnlock = childNode(withName: "notUnlock") as! SKLabelNode
        homeButton = childNode(withName: "homeButton") as! MSButtonNode
        homeButton.selectedHandler = { [unowned self] in
            /* 1) Grab reference to our SpriteKit view */
            guard let skView = self.view as SKView! else {
                print("Could not get Skview")
                return
            }
            
            /* 2) Load Game scene */
            guard let scene = GameScene(fileNamed: "MainMenu") else {
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
        levelOne = childNode(withName: "levelOne") as! MSButtonNode
        levelOne.selectedHandler = {
            self.notUnlock.zPosition = -4
            levelNum = 0
            guard let skView = self.view as SKView! else {
                print("Could not get Skview")
                return
            }
            
            guard let scene = GameScene(fileNamed: "SinglePlayer") else {
                print("Could not load GameScene with level 1")
                return
            }
            scene.scaleMode = .aspectFit
            
            /* Show debug */
            skView.showsPhysics = false
            skView.showsDrawCount = false
            skView.showsFPS = false
            
            /* 4) Start game scene */
            skView.presentScene(scene)
        }
        levelTwo = childNode(withName: "levelTwo") as! MSButtonNode
        levelTwo.selectedHandler = {
            if levelNumReached >= 1 {
                self.notUnlock.zPosition = -4
                levelNum = 1
                guard let skView = self.view as SKView! else {
                    print("Could not get Skview")
                    return
                }
            
                guard let scene = GameScene(fileNamed: "SinglePlayer") else {
                    print("Could not load GameScene with level 1")
                    return
                }
                scene.scaleMode = .aspectFit
            
                /* Show debug */
                skView.showsPhysics = false
                skView.showsDrawCount = false
                skView.showsFPS = false
            
                /* 4) Start game scene */
                skView.presentScene(scene)
            }
            else {
                self.notUnlock.zPosition = 4
            }
        }
        levelThree = childNode(withName: "levelThree") as! MSButtonNode
        levelThree.selectedHandler = {
            if levelNumReached >= 2 {
                self.notUnlock.zPosition = -4
                levelNum = 2
                guard let skView = self.view as SKView! else {
                    print("Could not get Skview")
                    return
                }
                
                guard let scene = GameScene(fileNamed: "SinglePlayer") else {
                    print("Could not load GameScene with level 1")
                    return
                }
                scene.scaleMode = .aspectFit
                
                /* Show debug */
                skView.showsPhysics = false
                skView.showsDrawCount = false
                skView.showsFPS = false
                
                /* 4) Start game scene */
                skView.presentScene(scene)
            }
            else {
                self.notUnlock.zPosition = 4
            }
        }
        levelFour = childNode(withName: "levelFour") as! MSButtonNode
        levelFour.selectedHandler = {
            levelNum = 3
        }
        levelFive = childNode(withName: "levelFive") as! MSButtonNode
        levelFive.selectedHandler = {
            levelNum = 4
        }
    }
}
