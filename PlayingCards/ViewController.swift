//
//  ViewController.swift
//  PlayingCards
//
//  Created by Sukhjinder Singh on 8/3/19.
//  Copyright © 2019 Sukhjinder Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView!{
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextcard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pintch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustCardScale(_:)))
            playingCardView.addGestureRecognizer(pintch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
    }
    @objc func nextcard(){
        if let card = deck.draw(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.self.rawValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        for _ in 1...10{
//            if let card = deck.draw(){
//                print("\(card)")
//            }
//        }
    }


}

