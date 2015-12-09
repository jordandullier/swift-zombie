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
    var player:Player?
    var game:Game?
    
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
        }
    }


}

