//
//  ShorbornoAlphabetVC.swift
//  Bangla Alphabet
//
//  Created by Md AfzaL Hossain on 3/26/17.
//  Copyright © 2017 Md AfzaL Hossain. All rights reserved.
//

import UIKit

class ShorbornoAlphabetsVC: UIViewController {

    var btnTagId = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   @IBAction func btnPressed(btn: UIButton) {
        btnTagId = btn.tag
        performSegue(withIdentifier: "toShowShorbornoVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showShorbornoVC = segue.destination as? ShowShorbornoVC {
            showShorbornoVC.btnTagId = btnTagId
        }
    }


}
