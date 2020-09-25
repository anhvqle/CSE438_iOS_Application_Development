//
//  ViewController.swift
//  Lab1_Shopping_Calculator
//
//  Created by Anh Le on 9/21/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var price_input: UITextField!
    @IBOutlet weak var discount_input: UITextField!
    @IBOutlet weak var sale_input: UITextField!
    @IBOutlet weak var final_price: UILabel!
    @IBOutlet weak var one: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change_inputs(_ sender: Any) {
        let displayText = "$\(String(format: "%.2f", convertToDouble(text:price_input.text) * (1 - convertToDouble(text:discount_input.text)/100) * (convertToDouble(text:sale_input.text)/100 + 1)))"
        final_price.text = displayText
    }
    
//    @IBAction func numbers(_ sender: UIButton) {
////        print(String(sender.tag))
//        price_input.text = price_input.text! + String(sender.tag);
//    }
    @IBAction func calculator(_ sender: UIButton) {
        if(sender.tag == 11){
            price_input.text = ""
        }
        else if(sender.tag == 12){
            if(price_input.text!.count >= 1){
                price_input.text?.removeLast()
            }
        }
        else if(sender.tag == 13){
            print("here")
            price_input.text = price_input.text! + "."
        }
        else{
            price_input.text = price_input.text! + String(sender.tag)
        }
        
        let displayText = "$\(String(format: "%.2f", convertToDouble(text:price_input.text) * (1 - convertToDouble(text:discount_input.text)/100) * (convertToDouble(text:sale_input.text)/100 + 1)))"
        final_price.text = displayText
    }
    
    func convertToDouble(text:String?) -> Double{
        if let num = Double(text!){
            return num
        }
        return 0.0
    }
    
}

