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
    
    private var spinnyNode : SKShapeNode?
    
    var weather: WeatherType = WeatherType.wind
    
    var labels: SKLabelNode!
    var massLabel: SKLabelNode!
    var strengthLabel: SKLabelNode!
    var costLabel: SKLabelNode!
    var heightLabel: SKLabelNode!
    var labels2: SKLabelNode!
    var massLabel2: SKLabelNode!
    var strengthLabel2: SKLabelNode!
    var costLabel2: SKLabelNode!
    var heightLabel2: SKLabelNode!
    
    var bottomHeights: [Double] = []
    var bottomMass = 0
    var bottomStrength = 0
    var bottomCost = 0
    
    var topHeights: [Double] = []
    var topMass = 0
    var topStrength = 0
    var topCost = 0
    
    var frames = 0
    var bottomMaterialArray: [SKNode] = []
    var topMaterialArray: [SKNode] = []
    var bottom: [Material] = []
    var top: [Material] = []
    let materials = MaterialType.allValues()
    
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
    var warning: SKSpriteNode!
    var tornado: SKSpriteNode!
    var restartButton: MSButtonNode!
    
    override func didMove(to view: SKView) {
        tornado = childNode(withName: "tornado") as! SKSpriteNode
        warning = childNode(withName: "warning") as! SKSpriteNode
        labels = childNode(withName: "labels") as! SKLabelNode
        massLabel = childNode(withName: "//massLabel") as! SKLabelNode
        costLabel = childNode(withName: "//costLabel") as! SKLabelNode
        strengthLabel = childNode(withName: "//strengthLabel") as! SKLabelNode
        heightLabel = childNode(withName: "//heightLabel") as! SKLabelNode
        labels2 = childNode(withName: "labels2") as! SKLabelNode
        massLabel2 = childNode(withName: "//massLabel2") as! SKLabelNode
        costLabel2 = childNode(withName: "//costLabel2") as! SKLabelNode
        strengthLabel2 = childNode(withName: "//strengthLabel2") as! SKLabelNode
        heightLabel2 = childNode(withName: "//heightLabel2") as! SKLabelNode
        stone = childNode(withName: "stone") as! SKSpriteNode
        brick = childNode(withName: "brick") as! SKSpriteNode
        thatch = childNode(withName: "thatch") as! SKSpriteNode
        ice = childNode(withName: "ice") as! SKSpriteNode
        marble = childNode(withName: "marble") as! SKSpriteNode
        copper = childNode(withName: "copper") as! SKSpriteNode
        restartButton = childNode(withName: "restartButton") as! MSButtonNode
        restartButton.selectedHandler = { [unowned self] in
        }
        stoneIcon = childNode(withName: "//stoneIcon") as! MSButtonNode
        stoneIcon.selectedHandler = {
            if self.bottomCount > 0 {
                let newStone = self.stone.copy() as! SKNode
                self.addChild(newStone)
                newStone.position.x = 30
                newStone.position.y = 40
                self.bottomMaterialArray.append(newStone)
                self.bottomCount = self.bottomCount - 1
                self.bottom.append(Material(material: self.materials[0]))
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
                self.bottom.append(Material(material: self.materials[1]))
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
                self.bottom.append(Material(material: self.materials[2]))
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
                self.bottom.append(Material(material: self.materials[3]))
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
                self.bottom.append(Material(material: self.materials[4]))
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
                self.bottom.append(Material(material: self.materials[5]))
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
                self.top.append(Material(material: self.materials[0]))
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
                self.top.append(Material(material: self.materials[1]))
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
                self.top.append(Material(material: self.materials[2]))
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
                self.top.append(Material(material: self.materials[3]))
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
                self.top.append(Material(material: self.materials[4]))
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
                self.top.append(Material(material: self.materials[5]))
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
    
    func scoring(gameWeather: WeatherType) {
        for material in bottom {
            print(material.toString())
            bottomMass = bottomMass + material.mass
            bottomCost = bottomCost +  material.cost
            if material.weak.contains(gameWeather) {
                bottomStrength = bottomStrength + material.strength / 2
            }
            else if material.resist.contains(gameWeather) {
                bottomStrength = bottomStrength + material.strength * 2
            }
            else {
                bottomStrength = bottomStrength + material.strength
            }
        }
        for material in bottomMaterialArray {
            bottomHeights.append(Double(material.position.y) + 30.0)
        }
        labels.zPosition = 2
        massLabel.text = String(bottomMass)
        strengthLabel.text = String(bottomStrength)
        costLabel.text = String(bottomCost)
        heightLabel.text = String(Int(bottomHeights.max()!))
        for material in top {
            print(material.toString())
            topMass = topMass + material.mass
            topCost = topCost +  material.cost
            if material.weak.contains(gameWeather) {
                topStrength = topStrength + material.strength / 2
            }
            else if material.resist.contains(gameWeather) {
                topStrength = topStrength + material.strength * 2
            }
            else {
                topStrength = topStrength + material.strength
            }
        }
        for material in topMaterialArray {
            topHeights.append(1364 - Double(material.position.y))
        }
        labels2.zPosition = 2
        massLabel2.text = String(topMass)
        strengthLabel2.text = String(topStrength)
        costLabel2.text = String(topCost)
        heightLabel2.text = String(Int(topHeights.max()!))
    }
    
    func callWind() {
        print("Tornado")
        tornado.zPosition = 4
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.tornado.zPosition = -2
            let tornadoBottom = SKFieldNode.vortexField()
            tornadoBottom.position.x = 375
            tornadoBottom.position.y = 333.5
            tornadoBottom.strength = 50
            self.addChild(tornadoBottom)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                tornadoBottom.strength = 0
                tornadoBottom.position.x = 375
                tornadoBottom.position.y = 1000
                tornadoBottom.strength = 50
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    tornadoBottom.strength = 0
                }
            }
        }
    }
    
    func callBug() {
        print("Bug")
        let swarmBottom = SKFieldNode.radialGravityField()
        swarmBottom.position.x = 1125
        swarmBottom.position.y = 333.5
        swarmBottom.strength = 300
        self.addChild(swarmBottom)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            swarmBottom.strength = 0
            swarmBottom.position.x = -1125
            swarmBottom.position.y = 1000
            swarmBottom.strength = 300
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                swarmBottom.strength = 0
            }
        }
    }
    
    func callWater() {
        let bottomWater = SKFieldNode.radialGravityField()
        bottomWater.position.x = 375
        bottomWater.position.y = 667
        bottomWater.strength = 150
        self.addChild(bottomWater)
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            bottomWater.strength = 0
        }
    }
    
    func callAcid() {
        var removed: [SKNode] = []
        if bottomMaterialArray.count != 0 {
            let bottomIndex = Int(arc4random_uniform(UInt32(bottomMaterialArray.count)))
            removed.append(bottomMaterialArray.remove(at: bottomIndex))
            bottom.remove(at: bottomIndex)
        }
        if topMaterialArray.count != 0 {
            let topIndex = Int(arc4random_uniform(UInt32(topMaterialArray.count)))
            removed.append(topMaterialArray.remove(at: topIndex))
            top.remove(at: topIndex)
        }
        self.removeChildren(in: removed)
    }
    
    func callFire() {
        let fire = SKFieldNode.springField()
        fire.position.x = 375
        fire.position.y = 333.5
        fire.strength = 100
        self.addChild(fire)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            fire.strength = 0
            fire.position.y = 1000
            fire.strength = 100
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                fire.strength = 0
            }
        }
    }
    
//    func callAntiGravity() {
//        print("AntiGravity")
//        let antiGravity = SKFieldNode.vortexField()
//        antiGravity.position.x = 375
//        antiGravity.position.y = 333.5
//        antiGravity.strength = 50
//        self.addChild(antiGravity)
//        let antiGravity2 = SKFieldNode.vortexField()
//        antiGravity2.position.x = 375
//        antiGravity2.position.y = 1000.5
//        antiGravity2.strength = 50
//        self.addChild(antiGravity2)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            antiGravity.strength = 0
//        }
//    }
    
//    func callSpring() {
//        print("Spring")
//        spring.strength = 100
//        self.addChild(spring)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            self.spring.strength = 0
//        }
//    }
    
    
    class func loadScene() -> GameScene? {
        guard let scene = GameScene(fileNamed: "GameScene") else {
            return nil
        }
        scene.scaleMode = .aspectFill
        return scene
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
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        var location = touch.location(in: self)
        
        for t in touches {
            let node = atPoint(t.location(in: self))
            if node.name == "stone" || node.name == "brick" || node.name == "thatch" || node.name == "ice" || node.name == "marble" || node.name == "copper" {
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
        if frames == 900 {
            warning.zPosition = 3
//            run(SKAction.playSoundFileNamed("sfx_alert", waitForCompletion: false))
        }
        if frames == 1000 {
            self.isUserInteractionEnabled = false
            let num = Int(arc4random_uniform(UInt32(6)))
            switch num {
            case 0:
                callFire()
                weather = WeatherType.fire
            case 1:
                callAcid()
                weather = WeatherType.acid
            case 2:
                callBug()
                weather = WeatherType.bug
            case 3:
                callWind()
                weather = WeatherType.electric
            case 4:
                callWater()
                weather = WeatherType.water
            default:
                callWind()
                
            }
            print(num)
        }
        if frames == 1700 {
            scoring(gameWeather: weather)
        }
    }
}
