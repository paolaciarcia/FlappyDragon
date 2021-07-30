//
//  GameViewController.swift
//  FlappyDragon
//
//  Created by Erick Borges on 30/07/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var stage: SKView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage = view as? SKView
        //não vai posicionar os objetos um na frente do outro.
        stage?.ignoresSiblingOrder = true
        
        //método responsável por mostrar uma cena na tela
        presentScene()
    }
    
    func presentScene() {
        let scene = GameScene(size: CGSize(width: view.frame.size.width, height: view.frame.size.height))
        scene.gameViewController = self
        scene.scaleMode = .aspectFill
        stage?.presentScene(scene, transition: .doorsOpenVertical(withDuration: 0.5))
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
