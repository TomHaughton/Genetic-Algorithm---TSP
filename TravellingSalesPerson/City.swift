//
//  City.swift
//  TravellingSalesPerson
//
//  Created by Thomas Haughton on 04/05/2017.
//  Copyright © 2017 Thomas Haughton. All rights reserved.
//

import Foundation
import SpriteKit

class City:SKSpriteNode{
    
    init(){
        let x = Int(arc4random_uniform(700)) - 350
        let y = Int(arc4random_uniform(700)) - 350
        super.init(texture: nil, color: .red, size: CGSize(width: 10, height: 10))
        position = CGPoint(x: x, y: y)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
