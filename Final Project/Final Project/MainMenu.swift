//
//  MainMenu.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/1/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//


import SpriteKit
import GameplayKit

let defaults = UserDefaults.standard

class MainMenu: SKScene {
    
    /* UI Connections */
//    var buttonSingle: MSButtonNode!
    
    var buttonParty: MSButtonNode!
    var tutorialButton: MSButtonNode!
    var tutorialFinished = defaults.bool(forKey: "Tutorial") ?? false
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        /* Set UI connections */
//        buttonSingle = self.childNode(withName: "buttonSingle") as! MSButtonNode
        
        buttonParty = childNode(withName: "buttonParty") as! MSButtonNode
        buttonParty.state = .msButtonNodeStateActive
        buttonParty.selectedHandler = { [unowned self] in
            self.loadGame()
        }
        tutorialButton = childNode(withName: "tutorialButton") as! MSButtonNode
        tutorialButton.state = .msButtonNodeStateActive
        tutorialButton.selectedHandler = { [unowned self] in
            self.loadTutorial()
        }
    }
    
    func isAppAlreadyLaunchedOnce() -> Bool {      
        if defaults.string(forKey: "isAppAlreadyLaunchedOnce") != nil{
            print("App already launched")
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }

    func loadGame() {
        /* 1) Grab reference to our SpriteKit view */
        defaults.set(tutorialFinished, forKey: "Tutorial")
        
        guard let skView = self.view as SKView! else {
            print("Could not get Skview")
            return
        }
        
        if isAppAlreadyLaunchedOnce() == true {
            guard let scene = GameScene(fileNamed: "GameScene") else {
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
            guard let scene = GameScene(fileNamed: "Tutorial") else {
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
    }
    
    func loadTutorial() {
        /* 1) Grab reference to our SpriteKit view */
        
        guard let skView = self.view as SKView! else {
            print("Could not get Skview")
            return
        }
        
            guard let scene = GameScene(fileNamed: "Tutorial") else {
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
}
