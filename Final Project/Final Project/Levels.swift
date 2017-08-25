//
//  Levels.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/21/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import Foundation

let level_1 = Levels(targetScore: 500, costMax: 500, weatherHazard: WeatherType.wind, material1: MaterialType.brick, material2: MaterialType.stone, material3: MaterialType.stone)
let level_2 = Levels(targetScore: 300, costMax: 500, weatherHazard: WeatherType.ground, material1: MaterialType.brick, material2: MaterialType.stone, material3: MaterialType.marble)
let level_3 = Levels(targetScore: 300, costMax: 500, weatherHazard: WeatherType.water, material1: MaterialType.ice, material2: MaterialType.stone, material3: MaterialType.marble)

var levelArray = [level_1, level_2, level_3]

struct Levels {
    var targetScore: Int
    var costMax: Int
    var weatherHazard: WeatherType
    var material1: MaterialType
    var material2: MaterialType
    var material3: MaterialType
    
    init(targetScore: Int, costMax: Int, weatherHazard: WeatherType, material1: MaterialType, material2: MaterialType, material3: MaterialType) {
        self.targetScore = targetScore
        self.costMax = costMax
        self.weatherHazard = weatherHazard
        self.material1 = material1
        self.material2 = material2
        self.material3 = material3
    }
}

/* Level:   1                       2                       3
 Materials: Brick, Stone            Stone, Brick, Marble    Ice, Stone, Marble
 Target:    300                     300                     300
 Cost:      750                     500                     500
 Weather:   Tornado                 Earthquake              Tsunami
 
 AMaterials: Brick, Stone, Thatch, Ice, Marble, Copper
 AWeather: Acid, Tornado, Earthquake, Tsunami, Bug
 
 Top Needed Languages: French, Chinese
 */
