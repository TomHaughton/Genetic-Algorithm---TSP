//
//  ViewController.swift
//  TravellingSalesPerson
//
//  Created by Thomas Haughton on 04/05/2017.
//  Copyright © 2017 Thomas Haughton. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
//            if let scene = SKScene(fileNamed: "GameScene") {
            if let scene = SKScene(fileNamed: "SetStartEnd") {
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
//            view.frameInterval = 100
        }
    }
}

