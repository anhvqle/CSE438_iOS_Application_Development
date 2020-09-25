//
//  ViewController.swift
//  Project1_UpdateLabel
//
//  Created by Anh Le on 9/16/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for num in 1...5{
            print("\(num*10)")
        }
    }

    @IBAction func sliderMoved(_ sender: Any) {
        label.text = String(slider.value)
    }
    
}

