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
    var levelSix: MSButtonNode!
    var levelSeven: MSButtonNode!
    var levelEight: MSButtonNode!
    var levelNine: MSButtonNode!
    var levelTen: MSButtonNode!
    var notUnlock: SKLabelNode!
    var comingSoon: SKLabelNode!
    var homeButton: MSButtonNode!
    
    override func didMove(to view: SKView) {
        notUnlock = childNode(withName: "notUnlock") as! SKLabelNode
        comingSoon = childNode(withName: "comingSoon") as! SKLabelNode
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
            self.comingSoon.zPosition = -4
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
            self.comingSoon.zPosition = -4
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
            self.comingSoon.zPosition = -4
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
            self.comingSoon.zPosition = -4
            if levelNumReached >= 3 {
                self.notUnlock.zPosition = -4
                levelNum = 3
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
        levelFive = childNode(withName: "levelFive") as! MSButtonNode
        levelFive.selectedHandler = {
            self.comingSoon.zPosition = -4
            if levelNumReached >= 4 {
                self.notUnlock.zPosition = -4
                levelNum = 4
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
        levelSix = childNode(withName: "levelSix") as! MSButtonNode
        levelSix.selectedHandler = {
            self.comingSoon.zPosition = -4
            if levelNumReached >= 5 {
                self.notUnlock.zPosition = -4
                levelNum = 5
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
        levelSeven = childNode(withName: "levelSeven") as! MSButtonNode
        levelSeven.selectedHandler = {
            self.comingSoon.zPosition = -4
            if levelNumReached >= 6 {
                self.notUnlock.zPosition = -4
                levelNum = 6
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
        levelEight = childNode(withName: "levelEight") as! MSButtonNode
        levelEight.selectedHandler = {
            self.comingSoon.zPosition = -4
            if levelNumReached >= 7 {
                self.notUnlock.zPosition = -4
                levelNum = 7
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
        levelNine = childNode(withName: "levelNine") as! MSButtonNode
        levelNine.selectedHandler = {
            self.notUnlock.zPosition = -4
            self.comingSoon.zPosition = 10
        }
        levelTen = childNode(withName: "levelTen") as! MSButtonNode
        levelTen.selectedHandler = {
            self.notUnlock.zPosition = -4
            self.comingSoon.zPosition = 10
        }
    }
}
