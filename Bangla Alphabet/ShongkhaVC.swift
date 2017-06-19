//
//  ShongkhaVC.swift
//  Bangla Alphabet
//
//  Created by Md AfzaL Hossain on 5/24/17.
//  Copyright © 2017 Md AfzaL Hossain. All rights reserved.
//

import UIKit
import AVFoundation

class ShongkhaVC: UIViewController,AVAudioPlayerDelegate {

    @IBOutlet weak var shongkhaImg: UIImageView!
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let path = Bundle.main.url(forResource: "only_math_1", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }

    @IBAction func shongkhaBtn(_ btn: UIButton) {
        let number = btn.tag
        shongkhaImg.image = UIImage(named: "ek_dui_\(number)")
        let path = Bundle.main.url(forResource: "only_math_\(number)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
}
