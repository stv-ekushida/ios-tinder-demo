//
//  ViewController.swift
//  ios-tinder-demo
//
//  Created by Eiji Kushida on 2018/01/06.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift
import Cartography

final class ViewController: UIViewController {
    
    private let swipeableView = ZLSwipeableView()
    private var loadCardsFromXib = false
    private var cardIndex = 1
    
    //MARK: - LifeCycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.clipsToBounds = true
        view.addSubview(swipeableView)

        swipeableView.didTap = {_, location in
            self.swipeableView.swipeTopView(inDirection: .Right)
        }
        constrain(swipeableView, view) {
            $0.left == $1.left + 50
            $0.right == $1.right - 50
            $0.top == $1.top + 120
            $0.bottom == $1.bottom - 100
        }
    }
    
    //MARK: - Private
    private func nextCardView() -> UIView? {
        let cardView = CardView(frame: swipeableView.bounds)
        cardView.backgroundColor = UIColor.white
        cardView.countLabel.text = "\(cardIndex)"
        cardIndex += 1
        
        if loadCardsFromXib {
            let contentView = loadCards()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.backgroundColor = cardView.backgroundColor
            cardView.addSubview(contentView)
            constrain(contentView, cardView) {
                $0.left == $1.left
                $0.top == $1.top
                $0.width == cardView.bounds.width
                $0.height == cardView.bounds.height
            }

        }
        return cardView
    }
    
    private func loadCards() -> UIView {
        return Bundle.main.loadNibNamed("CardContentView", owner: self, options: nil)?.first! as! UIView
    }
}
