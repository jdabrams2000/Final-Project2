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
var levelNumReached = UserDefaults.standard.integer(forKey: "LEVELNUMREACHED")

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
    var homeButton: MSButtonNode!
    
    var targetLabel: SKLabelNode!
    var moneyLabel: SKLabelNode!
    var materialLabel1: SKLabelNode!
    var materialLabel2: SKLabelNode!
    var materialLabel3: SKLabelNode!
    
    var scores: SKSpriteNode!
    var objective: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var strengthLabel: SKLabelNode!
    var costLabel: SKLabelNode!
    var heightLabel: SKLabelNode!
    var blockLabel: SKLabelNode!
    
    var stone: SKSpriteNode!
    var brick: SKSpriteNode!
    var thatch: SKSpriteNode!
    var ice: SKSpriteNode!
    var marble: SKSpriteNode!
    var copper: SKSpriteNode!
    var warning: SKSpriteNode!
    
    var tornado: SKSpriteNode!
    var acid: SKSpriteNode!
    var tsunami: SKSpriteNode!
    var earthquake: SKSpriteNode!
    var swarm: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        scores = childNode(withName: "scores") as! SKSpriteNode
        objective = childNode(withName: "objective") as! SKSpriteNode
        scoreLabel = childNode(withName: "//scoreLabel") as! SKLabelNode
        strengthLabel = childNode(withName: "//strengthLabel") as! SKLabelNode
        costLabel = childNode(withName: "//costLabel") as! SKLabelNode
        heightLabel = childNode(withName: "//heightLabel") as! SKLabelNode
        targetLabel = childNode(withName: "//targetLabel") as! SKLabelNode
        blockLabel = childNode(withName: "//blockLabel") as! SKLabelNode
        moneyLabel = childNode(withName: "//moneyLabel") as! SKLabelNode
        materialLabel1 = childNode(withName: "//materialLabel1") as! SKLabelNode
        materialLabel2 = childNode(withName: "//materialLabel2") as! SKLabelNode
        materialLabel3 = childNode(withName: "//materialLabel3") as! SKLabelNode
        tornado = childNode(withName: "tornado") as! SKSpriteNode
        acid = childNode(withName: "acid") as! SKSpriteNode
        tsunami = childNode(withName: "tsunami") as! SKSpriteNode
        earthquake = childNode(withName: "earthquake") as! SKSpriteNode
        swarm = childNode(withName: "swarm") as! SKSpriteNode
        warning = childNode(withName: "warning") as! SKSpriteNode
        stone = childNode(withName: "stone") as! SKSpriteNode
        brick = childNode(withName: "brick") as! SKSpriteNode
        thatch = childNode(withName: "thatch") as! SKSpriteNode
        ice = childNode(withName: "ice") as! SKSpriteNode
        marble = childNode(withName: "marble") as! SKSpriteNode
        copper = childNode(withName: "copper") as! SKSpriteNode
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
        scores.zPosition = -4
        weather = level.weatherHazard
        cost = level.costMax
        targetLabel.text = String(level.targetScore)
        moneyLabel.text = String(level.costMax)
        switch level.material1 {
        case MaterialType.brick:
            brickIcon.position.x = -200
            materialLabel1.text = "Brick"
        case MaterialType.ice:
            iceIcon.position.x = -200
            materialLabel1.text = "Ice"
        default:
            break
        }
        switch level.material2 {
        case MaterialType.stone:
            stoneIcon.position.x = 0
            materialLabel2.text = "Stone"
        default:
            break
        }
        switch level.material3 {
        case MaterialType.marble:
            marbleIcon.position.x = 250
            materialLabel3.text = "Marble"
        default:
            break
        }
    }
    
    func callWeather(level: Levels) {
        switch level.weatherHazard {
        case WeatherType.wind:
            callWind()
        case WeatherType.bug:
            callBug()
        case WeatherType.ground:
            callground()
        case WeatherType.water:
            callWater()
        default:
            print("default")
        }
    }
    
    func scoring(level: Levels) {
        if materialArray.count != 0 {
            for material in materialNode {
                heights.append(Double(material.position.y) + 670.0)
            }
            for material in materialArray {
                if material.weak.contains(level.weatherHazard) {
                    strength = strength + material.strength / 2
                }
                else if material.resist.contains(level.weatherHazard) {
                    strength = strength + material.strength * 2
                }
                else {
                    strength = strength + material.strength
                }

            }
            let final = Int(heights.max()!) * strength/(level.costMax - cost)
            strengthLabel.text = String(strength)
            costLabel.text = String(level.costMax - cost)
            heightLabel.text = String(Int(heights.max()!))
            scoreLabel.text = String(final)
            scores.zPosition = 4
            objective.zPosition = -4
            if final >= level.targetScore {
                success()
            }
            else {
                fail()
            }
        }
        else {
            fail()
        }
    }
    
    func success() {
        print("success")
        levelNum = levelNum + 1
        if levelNumReached < levelNum {
            saveLevelNumReached()
        }
    }
    
    func fail() {
        
    }
    
    func saveLevelNumReached() {
        UserDefaults().set(levelNum, forKey: "LEVELNUMREACHED")
    }
    
    func callWind() {
        print("Tornado")
        tornado.zPosition = 4
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.tornado.zPosition = -3
            let tornadoBottom = SKFieldNode.vortexField()
            tornadoBottom.position.x = 375
            tornadoBottom.position.y = 667
            tornadoBottom.strength = 50
            self.addChild(tornadoBottom)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                tornadoBottom.strength = 0
            }
        }
    }
    
    func callBug() {
        print("Bug")
        swarm.zPosition = 4
        let swarmBottom = SKFieldNode.radialGravityField()
        swarmBottom.position.x = 1125
        swarmBottom.position.y = 333.5
        swarmBottom.strength = 300
        self.addChild(swarmBottom)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.swarm.zPosition = -3
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
        tsunami.zPosition = 4
        let bottomWater = SKFieldNode.radialGravityField()
        bottomWater.position.x = 375
        bottomWater.position.y = 667
        bottomWater.strength = 150
        self.addChild(bottomWater)
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            self.tsunami.zPosition = -3
            bottomWater.strength = 0
        }
    }
    
//    func callAcid() {
//        print("Acid")
//        acid.zPosition = 4
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            self.acid.zPosition = -3
//            var removed: [SKNode] = []
//            if self.bottomMaterialArray.count != 0 {
//                let bottomIndex = Int(arc4random_uniform(UInt32(self.bottomMaterialArray.count)))
//                removed.append(self.bottomMaterialArray.remove(at: bottomIndex))
//                self.bottom.remove(at: bottomIndex)
//            }
//            if self.topMaterialArray.count != 0 {
//                let topIndex = Int(arc4random_uniform(UInt32(self.topMaterialArray.count)))
//                removed.append(self.topMaterialArray.remove(at: topIndex))
//                self.top.remove(at: topIndex)
//            }
//            self.removeChildren(in: removed)
//        }
//    }
    
    func callground() {
        print("Earthquake")
        earthquake.zPosition = 4
        let ground = SKFieldNode.springField()
        ground.position.x = 375
        ground.position.y = 667
        ground.strength = 100
        self.addChild(ground)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.earthquake.zPosition = -3
            ground.strength = 0
            ground.position.y = 1000
            ground.strength = 100
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                ground.strength = 0
            }
        }
    }
    
    
    class func loadScene() -> GameScene? {
        guard let scene = GameScene(fileNamed: "SinglePlayer") else {
            return nil
        }
        scene.scaleMode = .aspectFit
        return scene
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
        if frames == 0 {
            print(levelNum)
            loadLevel(level: levelArray[levelNum])
        }
        if frames == 1000 {
            self.isUserInteractionEnabled = false
            callWeather(level: levelArray[levelNum])
        }
        if frames == 1400 {
            scoring(level: levelArray[levelNum])
            self.isUserInteractionEnabled = true
        }
        frames = frames + 1
        self.moneyLabel.text = String(cost)
        self.blockLabel.text = String(count)
    }
}
