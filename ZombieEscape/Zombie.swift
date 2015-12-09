//
//  Zombie.swift
//  ZombieEscape
//
//  Created by Jordan DULLIER on 09/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import Foundation
import MapKit

class Zombie:Character{
    let colorZombie:String = "#BBBBBB"
    
    init(xPosition: Int, yPosition: Int) {
        super.init(xPosition: xPosition, yPosition: yPosition, color: colorZombie)
    }
    
}