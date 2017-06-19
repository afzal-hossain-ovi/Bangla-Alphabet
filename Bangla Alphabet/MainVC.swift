//
//  ViewController.swift
//  Bangla Alphabet
//
//  Created by Md AfzaL Hossain on 3/26/17.
//  Copyright © 2017 Md AfzaL Hossain. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController,AVAudioPlayerDelegate {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shorborno(_ sender: Any) {
        performSegue(withIdentifier: "toShorbornoAlphabetsVC", sender: nil)
        let path = Bundle.main.url(forResource: "shorborno", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
   
    @IBAction func banjonborno(_ sender: Any) {
        performSegue(withIdentifier: "toBanjonbornoAlphabetsVC", sender: nil)
        let path = Bundle.main.url(forResource: "banjonborno", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
    

    @IBAction func shongkha(_ sender: Any) {
        performSegue(withIdentifier: "toShongkhaVC", sender: nil)
    }
    
    @IBAction func practiceAlphabets(_ sender: Any) {
        performSegue(withIdentifier: "toDrawingVC", sender: nil)
        let path = Bundle.main.url(forResource: "esholikhi", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }

}

