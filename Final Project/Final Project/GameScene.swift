//
//  GameScene.swift
//  Final Project
//
//  Created by Jacob Abrams on 7/24/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var frames = 0
    var bottomMaterialArray: [SKNode] = []
    var topMaterialArray: [SKNode] = []
    var bottom: [Material] = []
    var top: [Material] = []
    let tornadoTop = SKFieldNode.vortexField()
    let tornadoBottom = SKFieldNode.vortexField()
    let antiGravity = SKFieldNode.radialGravityField()
    let spring = SKFieldNode.springField()
    var bottomCount = 10
    var topCount = 10
    
    var stoneIcon: MSButtonNode!
    var brickIcon: MSButtonNode!
    var thatchIcon: MSButtonNode!
    var iceIcon: MSButtonNode!
    var marbleIcon: MSButtonNode!
    var copperIcon: MSButtonNode!
    var stoneIcon2: MSButtonNode!
    var brickIcon2: MSButtonNode!
    var thatchIcon2: MSButtonNode!
    var iceIcon2: MSButtonNode!
    var marbleIcon2: MSButtonNode!
    var copperIcon2: MSButtonNode!
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
        stoneIcon = childNode(withName: "//stoneIcon") as! MSButtonNode
        stoneIcon.selectedHandler = {
            if self.bottomCount > 0 {
                let newStone = self.stone.copy() as! SKNode
                self.addChild(newStone)
                newStone.position.x = 30
                newStone.position.y = 40
                self.bottomMaterialArray.append(newStone)
                self.bottomCount = self.bottomCount - 1
            }
        }
        brickIcon = childNode(withName: "//brickIcon") as! MSButtonNode
        brickIcon.selectedHandler = { [unowned self] in
            if self.bottomCount > 0 {
                let newBrick = self.brick.copy() as! SKNode
                self.addChild(newBrick)
                newBrick.position.x = 30
                newBrick.position.y = 40
                self.bottomMaterialArray.append(newBrick)
                self.bottomCount = self.bottomCount - 1
            }
        }
        thatchIcon = childNode(withName: "//thatchIcon") as! MSButtonNode
        thatchIcon.selectedHandler = {
            if self.bottomCount > 0 {
                let newThatch = self.thatch.copy() as! SKNode
                self.addChild(newThatch)
                newThatch.position.x = 30
                newThatch.position.y = 40
                self.bottomMaterialArray.append(newThatch)
                self.bottomCount = self.bottomCount - 1
            }
        }
        iceIcon = childNode(withName: "//iceIcon") as! MSButtonNode
        iceIcon.selectedHandler = {
            if self.bottomCount > 0 {
                let newIce = self.ice.copy() as! SKNode
                self.addChild(newIce)
                newIce.position.x = 30
                newIce.position.y = 40
                self.bottomMaterialArray.append(newIce)
                self.bottomCount = self.bottomCount - 1
            }
        }
        marbleIcon = childNode(withName: "//marbleIcon") as! MSButtonNode
        marbleIcon.selectedHandler = {
            if self.bottomCount > 0 {
                let newMarble = self.marble.copy() as! SKNode
                self.addChild(newMarble)
                newMarble.position.x = 30
                newMarble.position.y = 40
                self.bottomMaterialArray.append(newMarble)
                self.bottomCount = self.bottomCount - 1
            }
        }
        copperIcon = childNode(withName: "//copperIcon") as! MSButtonNode
        copperIcon.selectedHandler = {
            if self.bottomCount > 0 {
                let newCopper = self.copper.copy() as! SKNode
                self.addChild(newCopper)
                newCopper.position.x = 30
                newCopper.position.y = 40
                self.bottomMaterialArray.append(newCopper)
                self.bottomCount = self.bottomCount - 1
            }
        }
        stoneIcon2 = childNode(withName: "//stoneIcon2") as! MSButtonNode
        stoneIcon2.selectedHandler = {
            if self.topCount > 0 {
                let newStone = self.stone.copy() as! SKNode
                self.addChild(newStone)
                newStone.position.x = 600
                newStone.position.y = 1300
                self.topMaterialArray.append(newStone)
                self.topCount = self.topCount - 1
            }
        }
        brickIcon2 = childNode(withName: "//brickIcon2") as! MSButtonNode
        brickIcon2.selectedHandler = {
            if self.topCount > 0 {
                let newBrick = self.brick.copy() as! SKNode
                self.addChild(newBrick)
                newBrick.position.x = 600
                newBrick.position.y = 1300
                self.topMaterialArray.append(newBrick)
                self.topCount = self.topCount - 1
            }
        }
        thatchIcon2 = childNode(withName: "//thatchIcon2") as! MSButtonNode
        thatchIcon2.selectedHandler = {
            if self.topCount > 0 {
                let newThatch = self.thatch.copy() as! SKNode
                self.addChild(newThatch)
                newThatch.position.x = 600
                newThatch.position.y = 1300
                self.topMaterialArray.append(newThatch)
                self.topCount = self.topCount - 1
            }
        }
        iceIcon2 = childNode(withName: "//iceIcon2") as! MSButtonNode
        iceIcon2.selectedHandler = {
            if self.topCount > 0 {
                let newIce = self.ice.copy() as! SKNode
                self.addChild(newIce)
                newIce.position.x = 600
                newIce.position.y = 1300
                self.topMaterialArray.append(newIce)
                self.topCount = self.topCount - 1
            }
        }
        marbleIcon2 = childNode(withName: "//marbleIcon2") as! MSButtonNode
        marbleIcon2.selectedHandler = {
            if self.topCount > 0 {
                let newMarble = self.marble.copy() as! SKNode
                self.addChild(newMarble)
                newMarble.position.x = 600
                newMarble.position.y = 1300
                self.topMaterialArray.append(newMarble)
                self.topCount = self.topCount - 1
            }
        }
        copperIcon2 = childNode(withName: "//copperIcon2") as! MSButtonNode
        copperIcon2.selectedHandler = {
            if self.topCount > 0 {
                let newCopper = self.copper.copy() as! SKNode
                self.addChild(newCopper)
                newCopper.position.x = 600
                newCopper.position.y = 1300
                self.topMaterialArray.append(newCopper)
                self.topCount = self.topCount - 1
            }
        }
        
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//        
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//        
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//            
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//       }
    }
    
    func callTornado() {
        print("Tornado")
        tornadoBottom.strength = 50
        self.addChild(tornadoBottom)
        self.addChild(tornadoTop)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.tornadoBottom.strength = 0
            self.tornadoTop.strength = 0
        }
    }
    
    func callAntiGravity() {
        print("AntiGravity")
        antiGravity.strength = 500
        self.addChild(antiGravity)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.antiGravity.strength = 0
        }
    }
    
    func callSpring() {
        print("Spring")
        spring.strength = 100
        self.addChild(spring)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.spring.strength = 0
        }
    }
    
    func returnMaterial(node: SKNode, position: CGPoint) {
        print("Function returnMaterial is working")
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
//    func touchMoved(toPoint pos : CGPoint, forNode node: SKShapeNode?) {
//        if node?.name != "background" {
//            node?.position = pos
//        }
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//        
//    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        var location = touch.location(in: self)
        
        for t in touches {
            let node = atPoint(t.location(in: self))
            if node.name != "background" && node.name != "sidebar2" && node.name != "sidebar" {
                node.position = t.location(in: self)
            }
        }
//        let nodeAtPoint = atPoint(location)
//        if location.y <= 0 && location.x >= 235.769 {
//            if nodeAtPoint.name != "sidebar" {
//                returnMaterial(node: nodeAtPoint, position: location)
//            }
//        }
//        else {
//            if nodeAtPoint.name != "background" {
//                for touch in touches {
//                    location = touch.location(in: self)
//                    nodeAtPoint.position.x = (location.x)
//                    nodeAtPoint.position.y = (location.y)
//                }
//            }
//        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        frames = frames + 1
        for material in topMaterialArray {
            material.physicsBody?.applyForce(CGVector(dx: 0, dy: 250))
        }
        for material in bottomMaterialArray {
            material.physicsBody?.applyForce(CGVector(dx: 0, dy: -250))
        }
        if frames == 1800 {
            callAntiGravity()
        }
    }
}
