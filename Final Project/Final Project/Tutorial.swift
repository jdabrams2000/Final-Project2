//
//  Tutorial.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/8/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit

class Tutorial : SKScene {
    var frames = 0
    var label: SKLabelNode!
    
    override func didMove(to view: SKView) {
        label = childNode(withName: "label") as! SKLabelNode
    }
    
    override func update(_ currentTime: TimeInterval) {
        frames = frames + 1
        
        switch frames {
        case 60:
            label.text = "Hello, your job is to build the strongest, tallest "
        default:
            break
        }
    }
}

