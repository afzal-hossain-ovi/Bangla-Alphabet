//
//  ShowBanjonBornoVC.swift
//  Bangla Alphabet
//
//  Created by Md AfzaL Hossain on 3/26/17.
//  Copyright © 2017 Md AfzaL Hossain. All rights reserved.
//

import UIKit
import AVFoundation

class ShowBanjonBornoVC: UIViewController,AVAudioPlayerDelegate {
    
    var player = AVAudioPlayer()
    
    var btnTagId = 0

    @IBOutlet weak var letterImg: UIImageView!
    @IBOutlet weak var wordImg: UIImageView!
    @IBOutlet weak var bornoPicImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        letterImg.image = UIImage(named: "letter_b\(btnTagId).png")
        wordImg.image = UIImage(named: "word_b\(btnTagId).png")
        bornoPicImg.image = UIImage(named: "pic_b\(btnTagId).png")
        
        let path = Bundle.main.url(forResource: "b\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
        
        wordImg.isUserInteractionEnabled = true
        bornoPicImg.isUserInteractionEnabled = true
        
        let wordRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShowShorbornoVC.wordImgTapped))
        let bornoRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShowShorbornoVC.bornoImgTapped))
        
        wordImg.addGestureRecognizer(wordRecognizer)
        bornoPicImg.addGestureRecognizer(bornoRecognizer)
    }
    
    func wordImgTapped() {
        let path = Bundle.main.url(forResource: "word_b\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
    func bornoImgTapped() {
        let path = Bundle.main.url(forResource: "word_b\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func nextBorno(_ sender: Any) {
        letterImg.image = UIImage(named: "letter_b\(btnTagId + 1).png")
        wordImg.image = UIImage(named: "word_b\(btnTagId + 1).png")
        bornoPicImg.image = UIImage(named: "pic_b\(btnTagId + 1).png")
        let path = Bundle.main.url(forResource: "b\(btnTagId + 1)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
        btnTagId += 1
        if btnTagId == 39 {
            btnTagId = 0
        }
    }
    
    
    @IBAction func prevBorno(_ sender: Any) {
        letterImg.image = UIImage(named: "letter_b\(btnTagId - 1).png")
        wordImg.image = UIImage(named: "word_b\(btnTagId - 1).png")
        bornoPicImg.image = UIImage(named: "pic_b\(btnTagId - 1).png")
        let path = Bundle.main.url(forResource: "b\(btnTagId - 1)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
        btnTagId -= 1
        if btnTagId == 1 {
            btnTagId = 40
        }
    }
    @IBAction func soundBtn(_ sender: Any) {
        let path = Bundle.main.url(forResource: "b\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }

}
