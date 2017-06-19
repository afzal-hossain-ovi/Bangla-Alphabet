//
//  ShowShorbornoVC.swift
//  Bangla Alphabet
//
//  Created by Md AfzaL Hossain on 3/26/17.
//  Copyright © 2017 Md AfzaL Hossain. All rights reserved.
//

import UIKit
import AVFoundation

class ShowShorbornoVC: UIViewController,AVAudioPlayerDelegate {
    
    var player = AVAudioPlayer()
    
    var btnTagId = 0
    
    @IBOutlet weak var letterImg: UIImageView!
    @IBOutlet weak var wordImg: UIImageView!
    @IBOutlet weak var bornoPicimg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        letterImg.image = UIImage(named: "letter_s\(btnTagId).png")
        wordImg.image = UIImage(named: "word_s\(btnTagId).png")
        bornoPicimg.image = UIImage(named: "pic_s\(btnTagId).png")
        
        let path = Bundle.main.url(forResource: "s\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
        
        wordImg.isUserInteractionEnabled = true
        bornoPicimg.isUserInteractionEnabled = true
        
        let wordRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShowShorbornoVC.wordImgTapped))
        let bornoRecognizer = UITapGestureRecognizer(target: self, action: #selector(ShowShorbornoVC.bornoImgTapped))
        
        wordImg.addGestureRecognizer(wordRecognizer)
        bornoPicimg.addGestureRecognizer(bornoRecognizer)

    }
    
    func wordImgTapped() {
        let path = Bundle.main.url(forResource: "word_s\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
    func bornoImgTapped() {
        let path = Bundle.main.url(forResource: "word_s\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
    
   @IBAction func nextBorno() {
        letterImg.image = UIImage(named: "letter_s\(btnTagId + 1).png")
        wordImg.image = UIImage(named: "word_s\(btnTagId + 1).png")
        bornoPicimg.image = UIImage(named: "pic_s\(btnTagId + 1).png")
    let path = Bundle.main.url(forResource: "s\(btnTagId + 1)", withExtension: "mp3")
    do {
        player = try AVAudioPlayer(contentsOf: path!)
        player.play()
    }catch {
        print(error.localizedDescription)
    }
        btnTagId += 1
        print(btnTagId)
        if btnTagId == 11 {
            btnTagId = 0
        }
    
    }
    
    @IBAction func prevBorno() {
        letterImg.image = UIImage(named: "letter_s\(btnTagId - 1).png")
        wordImg.image = UIImage(named: "word_s\(btnTagId - 1).png")
        bornoPicimg.image = UIImage(named: "pic_s\(btnTagId - 1).png")
        let path = Bundle.main.url(forResource: "s\(btnTagId - 1)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
        btnTagId -= 1
        if btnTagId == 1 {
            btnTagId = 12
        }
    }

    @IBAction func soundBtn(_ sender: Any) {
        let path = Bundle.main.url(forResource: "s\(btnTagId)", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: path!)
            player.play()
        }catch {
            print(error.localizedDescription)
        }
    }
    
}
