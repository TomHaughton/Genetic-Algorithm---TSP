//
//  GameScene.swift
//  TravellingSalesPerson
//
//  Created by Thomas Haughton on 04/05/2017.
//  Copyright © 2017 Thomas Haughton. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var cities: [City] = []
    var numberOfCities = 10
    var order: [Int] = []
    var population: [[Int]] = []
    var populationSize = 1000
    var fitness:[CGFloat] = []
    
    //Distances
    var recordDistance = CGFloat.infinity
    var bestEver: [Int] = []
    
    override func didMove(to view: SKView) {
        for i in 0...numberOfCities - 1{
            cities.append(City())
            addChild(cities[i])
            order.append(i)
        }
        
        for _ in 0...populationSize - 1{
            population.append(order)
            order.shuffle()
        }
        
        for i in 0...population.count - 1 {
            let d = calcDistance(points: cities, order: population[i])
            if d < recordDistance{
                recordDistance = d
                bestEver = population[i]
            }
            fitness.append(d)
        }
        
        calcFitness()
        normaliseFitness()
        nextGeneration()
        draw()
    }
    
    func draw(){
        enumerateChildNodes(withName: "line"){ node, _ in
            let line = node
            line.removeFromParent()
        }
        
        for i in 0...numberOfCities - 2{
            let n = bestEver[i]
            let n2 = bestEver[i + 1]
            let path = CGMutablePath()
            path.move(to: cities[n].position)
            path.addLine(to: cities[n2].position)
            let shape = SKShapeNode()
            shape.path = path
            shape.strokeColor = .white
            shape.lineWidth = 2
            shape.name = "line"
            addChild(shape)
        }
    }
    
    func calcDistance(points: [SKNode], order: [Int]) -> CGFloat{
        var distance: CGFloat = 0
        for i in 0...numberOfCities - 2{
            let n = order[i]
            let n2 = order[i + 1]
            distance += points[n].position.distance(to: points[n2].position)
        }
        return distance
    }
    
    func calcFitness(){
        for i in 0...population.count - 1 {
            let d = calcDistance(points: cities, order: population[i])
            if d < recordDistance{
                recordDistance = d
                bestEver = population[i]
            }
            fitness[i] = 1/(d + 1)
        }
    }
    
    func normaliseFitness(){
        var sum:CGFloat = 0
        for i in 0...fitness.count - 1 {
            sum += fitness[i]
        }
        
        for i in 0...fitness.count - 1 {
            fitness[i] += fitness[i] / sum
        }
    }
    
    func nextGeneration(){
        var newPopulation: [[Int]] = []
        for _ in 0...population.count - 1 {
            var order = pickOne(list: population, prob: fitness)
            mutate(order: &order, mutationRate: 0.01)
            newPopulation.append(order)
        }
        population = newPopulation
    }
    
    func pickOne(list:[[Int]], prob: [CGFloat]) -> [Int]{
        var index = 0
        var r = CGFloat(arc4random_uniform(99) + 1)
        r = r / 100
        
        while r > 0{
            r = r - prob[index]
            index += 1
        }
        index -= 1
        return list[index]
    }
    
    func mutate(order: inout [Int], mutationRate: CGFloat){
        let indexA = Int(arc4random_uniform(UInt32(order.count)))
        let indexB = Int(arc4random_uniform(UInt32(order.count)))
        order.swap(a: indexA, b: indexB)
    }
    
    override func update(_ currentTime: TimeInterval) {
        for i in 0...population.count - 1 {
            let d = calcDistance(points: cities, order: population[i])
            if d < recordDistance{
                recordDistance = d
                bestEver = population[i]
            }
        }
        
        calcFitness()
        normaliseFitness()
        nextGeneration()
        draw()
    }
}
