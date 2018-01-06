//
//  CardView.swift
//  ios-tinder-demo
//
//  Created by Eiji Kushida on 2018/01/06.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class CardView: UIView {    
    var countLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        countLabel = UILabel(frame: self.frame)
        countLabel.textAlignment = .center
        self.addSubview(countLabel)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 10.0;
    }
}
