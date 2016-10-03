//
//  MatchGame.swift
//  CardFlip2
//
//  Created by Joel Hollingsworth on 9/26/16.
//  Copyright © 2016 Joel Hollingsworth. All rights reserved.
//
//  Tyler Young

import UIKit

/**
 * This is the Model for the Match Game.
 */
class MatchGame {
    
    let deck = Deck()
    var flips = 0
    var score = 0
    var message = "Welcome!"
    
    var previous = -1
    
    var matrix: [Card] = []
    var whichValue: String = ""
    var previousValue: String = ""
    var whichSuit: String = ""
    var previousSuit: String = ""
    var previousSuitTwo: String = ""
    
    init() {
        // draw 16 random cards
        for _ in 1...16 {
            matrix.append(deck.drawRandomCard())
        }
    }
    
    /*
     * Called when a card is tapped.
     */
    func flipCardUp(_ which: Int) {
        
        // only need to do something if card is facing down
        if matrix[which].isShowing == false {
            
            // flip up
            matrix[which].isShowing = true
            
            //enumerated type with 3 states(non selectable)  //inactive(alpha value)
            // update values/text
            flips += 1
            score -= 1
            message = matrix[which].text
            whichSuit = matrix[which].suit
            whichValue = matrix[which].value
            
            if (previous != -1) {
                if(previousSuit == whichSuit){
                    matrix[previous].isShowing = true
                    matrix[which].isShowing = true
                    score += 5
                    message = "Suit match!"
                    previous = -1
                    previousSuit = matrix[which].suit
                } else if (previousValue == whichValue) {
                    matrix[previous].isShowing = true
                    matrix[which].isShowing = true
                    score += 17
                    message = "Value match!"
                    previous = -1
                    previousValue = matrix[which].value
                }
                else {
                    matrix[previous].isShowing = false
                    previous = which
                    previousSuit = matrix[which].suit
                    previousValue = matrix[which].value
                }
                
            } else {
                previous = which
                previousSuit = matrix[which].suit
                previousValue = matrix[which].value
            }
        }
    }
    
    /*
     * Return the current image for a particular Card
     */
    func getImage(_ which: Int) -> UIImage {
        return matrix[which].getImage()
    }
    
    
}
