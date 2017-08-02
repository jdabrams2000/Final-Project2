//
//  Material.swift
//  Final Project
//
//  Created by Jacob Abrams on 7/24/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import Foundation

enum MaterialType {
    case stone, brick, thatch, ice, marble, copper
    
    static func allValues() -> [MaterialType] {
        return [stone, brick, thatch, ice, marble, copper]
    }
}

var masses = [45, 40, 20, 30, 40, 45]
var strengths = [65, 60, 35, 30, 45, 70]
var costs = [40, 20, 50, 35, 45, 70]

class Material {
    var materialType: MaterialType!
    var mass: Int
    var strength: Int
    var cost: Int
    init(material: MaterialType) {
        let index = MaterialType.allValues().index(of: material)!
        self.materialType = material
        self.mass = masses[index]
        self.strength = masses[index]
        self.cost = costs[index]
    }
    
    func toString() -> String {
        return "\(self.materialType) has a mass of \(mass), a strength of \(strength) and a cost of $\(cost)"
    }
}
