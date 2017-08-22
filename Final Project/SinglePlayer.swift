//
//  SinglePlayer.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/21/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit
import GameplayKit

var levelNum = 0

class SinglePlayer: SKScene {
    let materials = MaterialType.allValues()
    
    var frames = 0
    var materialArray: [Material] = []
    var materialNode: [SKNode] = []
    var strength = 0
    var cost = 0
    var weather = WeatherType.wind
    var heights: [Double] = []
    var count = 15
    
    var stoneIcon: MSButtonNode!
    var brickIcon: MSButtonNode!
    var thatchIcon: MSButtonNode!
    var iceIcon: MSButtonNode!
    var marbleIcon: MSButtonNode!
    var copperIcon: MSButtonNode!
    
    var stone: SKSpriteNode!
    var brick: SKSpriteNode!
    var thatch: SKSpriteNode!
    var ice: SKSpriteNode!
    var marble: SKSpriteNode!
    var copper: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        stone = childNode(withName: "stone") as! SKSpriteNode
        brick = childNode(withName: "brick") as! SKSpriteNode
        thatch = childNode(withName: "thatch") as! SKSpriteNode
        ice = childNode(withName: "ice") as! SKSpriteNode
        marble = childNode(withName: "marble") as! SKSpriteNode
        copper = childNode(withName: "copper") as! SKSpriteNode
        stoneIcon = childNode(withName: "stoneIcon") as! MSButtonNode
        stoneIcon.selectedHandler = { [unowned self] in
            if self.count > 0 && self.cost >= 40 {
                let newStone = self.stone.copy() as! SKNode
                self.addChild(newStone)
                newStone.position.x = 30
                newStone.position.y = 40
                self.materialNode.append(newStone)
                self.count = self.count - 1
                self.materialArray.append(Material(material: self.materials[0]))
                self.cost = self.cost - 40
            }
        }
        brickIcon = childNode(withName: "brickIcon") as! MSButtonNode
        brickIcon.selectedHandler = { [unowned self] in
            if self.count > 0 && self.cost >= 20 {
                let newBrick = self.brick.copy() as! SKNode
                self.addChild(newBrick)
                newBrick.position.x = 30
                newBrick.position.y = 40
                self.materialNode.append(newBrick)
                self.count = self.count - 1
                self.materialArray.append(Material(material: self.materials[1]))
                self.cost = self.cost - 20
            }
        }
        thatchIcon = childNode(withName: "thatchIcon") as! MSButtonNode
        thatchIcon.selectedHandler = { [unowned self] in
            if self.count > 0 && self.cost >= 50 {
                let newThatch = self.thatch.copy() as! SKNode
                self.addChild(newThatch)
                newThatch.position.x = 30
                newThatch.position.y = 40
                self.materialNode.append(newThatch)
                self.count = self.count - 1
                self.materialArray.append(Material(material: self.materials[2]))
                self.cost = self.cost - 50
            }
        }
        iceIcon = childNode(withName: "iceIcon") as! MSButtonNode
        iceIcon.selectedHandler = { [unowned self] in
            if self.count > 0 && self.cost >= 35 {
                let newIce = self.ice.copy() as! SKNode
                self.addChild(newIce)
                newIce.position.x = 30
                newIce.position.y = 40
                self.materialNode.append(newIce)
                self.count = self.count - 1
                self.materialArray.append(Material(material: self.materials[3]))
                self.cost = self.cost - 35
            }
        }
        marbleIcon = childNode(withName: "marbleIcon") as! MSButtonNode
        marbleIcon.selectedHandler = { [unowned self] in
            if self.count > 0 && self.cost >= 45 {
                let newMarble = self.marble.copy() as! SKNode
                self.addChild(newMarble)
                newMarble.position.x = 30
                newMarble.position.y = 40
                self.materialNode.append(newMarble)
                self.count = self.count - 1
                self.materialArray.append(Material(material: self.materials[4]))
                self.cost = self.cost - 45
            }
        }
        copperIcon = childNode(withName: "copperIcon") as! MSButtonNode
        copperIcon.selectedHandler = { [unowned self] in
            if self.count > 0 && self.cost >= 70 {
                let newCopper = self.copper.copy() as! SKNode
                self.addChild(newCopper)
                newCopper.position.x = 30
                newCopper.position.y = 40
                self.materialNode.append(newCopper)
                self.count = self.count - 1
                self.materialArray.append(Material(material: self.materials[5]))
                self.cost = self.cost - 70
            }
        }

    }
    
    func loadLevel(level: Levels) {
        weather = level.weatherHazard
        cost = level.costMax
        switch level.material1 {
        case MaterialType.brick:
            brickIcon.position.x = -250
        case MaterialType.ice:
            iceIcon.position.x = -250
        default:
            break
        }
        switch level.material2 {
        case MaterialType.stone:
            stoneIcon.position.x = 0
        default:
            break
        }
        switch level.material3 {
        case MaterialType.marble:
            marbleIcon.position.x = 250
        default:
            break
        }
    }
    
    func scoring(level: Levels) {
        if materialArray.count != 0 {
            for material in materialNode {
                heights.append(Double(material.position.y) + 30.0)
            }
            let final = Int(heights.max() ?? 0) * strength/(level.costMax - cost)
            if final >= level.targetScore {
                print("Success")
            }
            else {
                print("Failure")
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = atPoint(t.location(in: self))
            if node.name == "stone" || node.name == "ice" || node.name == "brick" || node.name == "marble" {
                node.position = t.location(in: self)
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        frames = frames + 1
        if frames == 0 {
            print("0")
            loadLevel(level: levelArray[levelNum])
            levelNum = levelNum + 1
        }
    }
}
