//
//  SinglePlayer.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/21/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit
import GameplayKit

class SinglePlayer: SKScene {
    
    override func didMove(to view: SKView) {
        
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
     
    }
}
