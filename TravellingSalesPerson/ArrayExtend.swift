//
//  ArrayExtend.swift
//  TravellingSalesPerson
//
//  Created by Thomas Haughton on 04/05/2017.
//  Copyright © 2017 Thomas Haughton. All rights reserved.
//

import Foundation

extension Array{
    mutating func shuffle(){
        for _ in 0...100{
            let indexA = Int(arc4random_uniform(UInt32(self.count)))
            let indexB = Int(arc4random_uniform(UInt32(self.count)))
            swap(a: indexA, b: indexB)
        }
    }
    
    mutating func shuffleSameStartEnd(){
        for _ in 0...100{
            let indexA = Int(arc4random_uniform(UInt32(self.count - 2))) + 1
            let indexB = Int(arc4random_uniform(UInt32(self.count - 2))) + 1
            swap(a: indexA, b: indexB)
        }
    }
    
    mutating func swap(a: Int, b: Int){
        let temp = self[a]
        self[a] = self[b]
        self[b] = temp
    }
}
