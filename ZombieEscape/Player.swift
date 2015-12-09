//
//  Player.swift
//  ZombieEscape
//
//  Created by Jordan DULLIER on 09/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import Foundation

class Player:Character{
    let colorPlayer:String!="#444444"
     var health:Int!
     var name:String!
     var score:Int!
    
    init(health:Int,xPosition: Int, yPosition: Int,name:String) {
        self.health = health
        self.name = name
        self.score = 0
        super.init(xPosition: xPosition, yPosition: yPosition, color: self.colorPlayer)
    }
    
}
