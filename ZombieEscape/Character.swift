//
//  Character.swift
//  ZombieEscape
//
//  Created by Jordan DULLIER on 09/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import Foundation
import UIKit
class Character{
    
    var xPosition:Int!
    var yPosition:Int!
    var color:String!
    var subview:UIView!
    
    init(xPosition:Int,yPosition:Int,color:String){
        
        self.xPosition = xPosition
        self.yPosition = yPosition
        self.color = color
    }
    
    func drawCharacter(view : UIView,game : Game){
        
        let positionX = self.xPosition*game.widthCell!
        let positionY = self.yPosition*game.heigthCell!
       
        var rectCharacter:CGRect = CGRect(x: positionX, y: positionY , width: game.widthCell!, height: game.heigthCell!)
        self.subview = UIView(frame: rectCharacter)
        self.subview.backgroundColor = UIColor.redColor()
        view.addSubview(self.subview)
    }
    
    func moveCharacterRight(game : Game){
        if (xPosition == (game.sizeX-1)){
            self.subview.frame.origin.x = 0
            self.xPosition = 0
        }else{
            self.subview.frame.origin.x += CGFloat(game.widthCell!)
            self.xPosition! += 1
        }
        
    }
    
    func moveCharacterLeft(game : Game){
        if (self.xPosition == 0) {
            self.subview.frame.origin.x = CGFloat(game.widthCell!*(game.sizeX!-1))
            self.xPosition! = game.sizeX-1
        } else {
            self.subview.frame.origin.x -= CGFloat(game.widthCell!)
            self.xPosition! -= 1
        }
    }
    
    func moveCharacterDown(game : Game){
        if (yPosition == (game.sizeY-1)){
            self.subview.frame.origin.y = 0
            yPosition = 0
        }else{
            self.subview.frame.origin.y += CGFloat(game.heigthCell!)
            self.yPosition! += 1
        }
    }
    
    func moveCharacterUp(game : Game){
        
        if (yPosition == 0){
            self.subview.frame.origin.y = CGFloat((game.sizeY! - 1) * game.heigthCell!)
            yPosition = game.sizeY-1
        }else{
            self.subview.frame.origin.y -= CGFloat(game.heigthCell!)
            self.yPosition! -= 1
        }
        
    }
    
    
}