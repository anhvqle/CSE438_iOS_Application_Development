//
//  ViewController.swift
//  AnhLe-Studio1
//
//  Created by Anh Le on 9/16/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderMoved(_ sender: Any) {
        picture.alpha = CGFloat(slider.value)
    }
    
}

