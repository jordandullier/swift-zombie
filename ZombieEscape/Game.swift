//
//  Rules.swift
//  ZombieEscape
//
//  Created by Jordan DULLIER on 09/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import Foundation
import UIKit
class Game{
    var sizeX:Int!
    var sizeY:Int!
    var startPlayerHealth:Int!
    var spawnRate:Int!
    var widthCell:Int?
    var heigthCell:Int?
    
    init(sizeX:Int,sizeY:Int,startPlayerHealth:Int,spawnRate:Int){
        self.sizeX = sizeX
        self.sizeY = sizeY
        self.startPlayerHealth = startPlayerHealth
        self.spawnRate = spawnRate
    }
    
    func calculateSizeCell(widthScreen:Int,heigthScreen:Int) {
       self.widthCell = widthScreen/self.sizeX
       self.heigthCell = heigthScreen/self.sizeY
       print(self.widthCell)
        print(self.heigthCell)
        
    }
}
