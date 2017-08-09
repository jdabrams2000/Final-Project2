//
//  MainMenu.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/1/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    /* UI Connections */
//    var buttonSingle: MSButtonNode!
    var buttonParty: MSButtonNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        /* Set UI connections */
//        buttonSingle = self.childNode(withName: "buttonSingle") as! MSButtonNode
        
        buttonParty = self.childNode(withName: "buttonParty") as! MSButtonNode
        buttonParty.selectedHandler = { [unowned self] in
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
}
