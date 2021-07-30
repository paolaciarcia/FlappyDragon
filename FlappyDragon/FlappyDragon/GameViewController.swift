//
//  GameViewController.swift
//  FlappyDragon
//
//  Created by Erick Borges on 30/07/21.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var stage: SKView?
    var musicPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = view as? SKView {
            stage = view
            //não vai posicionar os objetos um na frente do outro.
            stage?.ignoresSiblingOrder = true
            
            //método responsável por mostrar uma cena na tela
            presentScene()
            playMusic()
        } 
    }
    
    func presentScene() {
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.gameViewController = self
        scene.scaleMode = .aspectFill
        stage?.presentScene(scene, transition: .doorsOpenVertical(withDuration: 0.5))
    }
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "music", withExtension: "m4a") {
            musicPlayer = try? AVAudioPlayer(contentsOf: musicURL)
            musicPlayer?.numberOfLoops = -1
            musicPlayer?.volume = 0.4
            musicPlayer?.play()
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
