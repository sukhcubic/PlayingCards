//
//  PlayingCardDeck.swift
//  PlayingCards
//
//  Created by Sukhjinder Singh on 8/3/19.
//  Copyright © 2019 Sukhjinder Singh. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    init(){
        for suit in PlayingCard.Suit.all{
            for rank in PlayingCard.Rank.all{
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    // mutating func inside struct
    mutating func draw() -> PlayingCard?{
        if cards.count > 0 {
        // draw randow card from deck
        return cards.remove(at: cards.count.arc4random)
        }else{
            return nil
        }
    }
}

extension Int{
    var arc4random:Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
