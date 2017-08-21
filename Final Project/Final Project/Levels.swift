//
//  Levels.swift
//  Final Project
//
//  Created by Jacob Abrams on 8/21/17.
//  Copyright © 2017 Jacob Abrams. All rights reserved.
//

import Foundation

var level_1 = Levels(targetScore: 300, costMax: 750, weatherHazard: WeatherType.wind, material1: Material(material: MaterialType.brick), material2: Material(material: MaterialType.stone), material3: nil)
var level_2 = Levels(targetScore: 300, costMax: 500, weatherHazard: WeatherType.ground, material1: Material(material: MaterialType.brick), material2: Material(material: MaterialType.stone), material3: Material(material: MaterialType.marble))
var level_3 = Levels(targetScore: 300, costMax: 500, weatherHazard: WeatherType.water, material1: Material(material: MaterialType.ice), material2: Material(material: MaterialType.stone), material3: Material(material: MaterialType.marble))

struct Levels {
    var targetScore: Int
    var costMax: Int
    var weatherHazard: WeatherType
    var material1: Material
    var material2: Material?
    var material3: Material?
    
    init(targetScore: Int, costMax: Int, weatherHazard: WeatherType, material1: Material, material2: Material?, material3: Material?) {
        self.targetScore = targetScore
        self.costMax = costMax
        self.weatherHazard = weatherHazard
        self.material1 = material1
        self.material2 = material2
        self.material3 = material3
    }
}

/* Level:   1                       2                       3
 Materials: Brick, Stone, Copper    Stone, Brick, Marble    Ice, Stone, Marble
 Target:    300                     300                     300
 Cost:      750                     500                     500
 Weather:   Tornado                 Earthquake              Tsunami
 
 AMaterials: Brick, Stone, Thatch, Ice, Marble, Copper
 AWeather: Acid, Tornado, Earthquake, Tsunami, Bug
 
 Top Needed Languages: French, Chinese
 */
