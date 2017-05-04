//
//  Utils.swift
//  TravellingSalesPerson
//
//  Created by Thomas Haughton on 04/05/2017.
//  Copyright © 2017 Thomas Haughton. All rights reserved.
//

import Foundation

//func distance(left: CGPoint, right:CGPoint) -> CGFloat{
//    let xDiff = left.x - right.x
//    let yDiff = left.y - right.y
//    return sqrt(pow(xDiff, 2) + pow(yDiff, 2))
//}

extension CGPoint{
    func distance(to point:CGPoint) -> CGFloat{
        let xDiff = x - point.x
        let yDiff = y - point.y
        return sqrt(pow(xDiff, 2) + pow(yDiff, 2))
    }
}
