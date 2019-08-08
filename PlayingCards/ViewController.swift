//
//  ViewController.swift
//  PlayingCards
//
//  Created by Sukhjinder Singh on 8/3/19.
//  Copyright © 2019 Sukhjinder Singh. All rights reserved.
//

import UIKit

struct Constants {
    static var flipCardAnimationDuration: TimeInterval = 0.6
    static var matchCardAnimationDuration: TimeInterval = 0.6
    static var matchCardAnimationScaleUp: CGFloat = 3.0
    static var matchCardAnimationScaleDown: CGFloat = 0.1
    static var behaviorResistance: CGFloat = 0
    static var behaviorElasticity: CGFloat = 1.0
    static var behaviorPushMagnitudeMinimum: CGFloat = 0.5
    static var behaviorPushMagnitudeRandomFactor: CGFloat = 1.0
    static var cardsPerMainViewWidth: CGFloat = 5
}


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

