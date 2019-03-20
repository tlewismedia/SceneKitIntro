//
//  GameViewController.swift
//  SceneKitIntro
//
//  Created by Tom Lewis on 3/19/19.
//  Copyright © 2019 Tom Lewis. All rights reserved.
//

import UIKit
import SceneKit

var scnView: SCNView!
var scnScene: SCNScene!
var cameraNode: SCNNode!

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupScene()
        setupCamera()
        spawnShape()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setUpView() {
        scnView = self.view as! SCNView
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
        scnScene.background.contents = "courseArt.scnassets/background.png"
    }
    
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func spawnShape() {
        var geometry:SCNGeometry
        
        switch ShapeType.random() {
        default:
            geometry = SCNCone(topRadius: 0.25, bottomRadius: 0.5, height: 1.0)
            let geometryNode = SCNNode(geometry: geometry)
            scnScene.rootNode.addChildNode(geometryNode)
        }
    }

}
