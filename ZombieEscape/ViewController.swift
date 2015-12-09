//
//  ViewController.swift
//  ZombieEscape
//
//  Created by Jordan DULLIER on 09/12/2015.
//  Copyright © 2015 Jordan DULLIER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    var player:Player?
    var zombies:[Zombie]! = []
    var game:Game?
    var currentSpawnTime:Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //var bounds = boardView.bounds
        let bounds: CGRect = boardView.frame
        let heightScreen = Int(bounds.height)
        let widthScreen = Int(bounds.width)
        
        boardView.layer.borderWidth = 3
        boardView.layer.borderColor = UIColor.blackColor().CGColor

        self.player = Player(health: 10, xPosition: 3, yPosition: 6, name: "myPlayer")
        self.game = Game(sizeX:12, sizeY: 16, startPlayerHealth: 4, spawnRate: 4)
        self.game!.calculateSizeCell(widthScreen, heigthScreen: heightScreen)
        self.lifeLabel.text = String(player!.health!)
        player!.drawCharacter(boardView, game: self.game!)
        listenerGesture()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func listenerGesture(){
       
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            player?.score! += 1
            self.currentSpawnTime? += 1
            
            if( self.currentSpawnTime == game?.spawnRate){
                self.currentSpawnTime? = 0
                let zombie:Zombie = Zombie(xPosition: 10, yPosition: 2)
                zombie.drawCharacter(boardView, game: game!)
                self.zombies.append(zombie)
            }
            
            
            
            scoreLabel.text = String(player!.score)
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                player!.moveCharacterRight(game!)
            case UISwipeGestureRecognizerDirection.Down:
                player!.moveCharacterDown(game!)
            case UISwipeGestureRecognizerDirection.Left:
                player!.moveCharacterLeft(game!)
            case UISwipeGestureRecognizerDirection.Up:
                player!.moveCharacterUp(game!)
            default:
                break
            }
            
            var index = 0;
            
            for zm in zombies{
                
                
                var randomNum:Int = randomNumber(1...4)
                
                switch(randomNum){
                case 1: zm.moveCharacterDown(game!)
                case 2: zm.moveCharacterRight(game!)
                case 3: zm.moveCharacterUp(game!)
                case 4: zm.moveCharacterLeft(game!)
                default: break
                }
                
                if(zm.xPosition == player?.xPosition && zm.yPosition == player?.yPosition){
                    player?.health! -= 1
                    self.lifeLabel.text = String(player!.health!)
                    zm.subview.removeFromSuperview()
                    zombies.removeAtIndex(index)
                }
                 index += 1;
                
            }
        }
    }
    
    func randomNumber(range: Range<Int> = 1...6) -> Int {
        let min = range.startIndex
        let max = range.endIndex
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }


}

