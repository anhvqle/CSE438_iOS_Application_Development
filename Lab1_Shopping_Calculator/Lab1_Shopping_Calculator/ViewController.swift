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
    
    var cursor = 1;
    
    @IBAction func selectPrice(_ sender: Any) {
//        print("Here")
        cursor = 1;
    }
    
    @IBAction func selectDiscount(_ sender: Any) {
        cursor = 2;
    }
    
    @IBAction func selectTax(_ sender: Any) {
        cursor = 3;
    }
    
    
    @IBAction func change_inputs(_ sender: Any) {
        print(sender)
        let displayText = "$\(String(format: "%.2f", convertToDouble(text:price_input.text) * (1 - convertToDouble(text:discount_input.text)/100) * (convertToDouble(text:sale_input.text)/100 + 1)))"
        final_price.text = displayText
    }
    
    @IBAction func calculator(_ sender: UIButton) {
        if(cursor == 1){
            if(sender.tag == 11){
                price_input.text = ""
            }
            else if(sender.tag == 12){
                if(price_input.text!.count >= 1){
                    price_input.text?.removeLast()
                }
            }
            else if(sender.tag == 13){
    //            print("here")
                price_input.text = price_input.text! + "."
            }
            else{
                price_input.text = price_input.text! + String(sender.tag)
            }
            
            let displayText = "$\(String(format: "%.2f", convertToDouble(text:price_input.text) * (1 - convertToDouble(text:discount_input.text)/100) * (convertToDouble(text:sale_input.text)/100 + 1)))"
            final_price.text = displayText
        }
        else if(cursor == 2){
//            if(discount_input.text!.count < 2){
            if(sender.tag == 11){
                discount_input.text = ""
            }
            else if(sender.tag == 12){
                if(discount_input.text!.count >= 1){
                    discount_input.text?.removeLast()
                }
            }
            else if(sender.tag == 13){
                discount_input.text = discount_input.text! + "."
            }
            else{
                discount_input.text = discount_input.text! + String(sender.tag)
            }
//            }
            
            let displayText = "$\(String(format: "%.2f", convertToDouble(text:price_input.text) * (1 - convertToDouble(text:discount_input.text)/100) * (convertToDouble(text:sale_input.text)/100 + 1)))"
            final_price.text = displayText
        }
            
        else if(cursor == 3){
            if(sender.tag == 11){
                sale_input.text = ""
            }
            else if(sender.tag == 12){
                if(sale_input.text!.count >= 1){
                    sale_input.text?.removeLast()
                }
            }
            else if(sender.tag == 13){
    //            print("here")
                sale_input.text = sale_input.text! + "."
            }
            else{
                sale_input.text = sale_input.text! + String(sender.tag)
            }
            
            let displayText = "$\(String(format: "%.2f", convertToDouble(text:price_input.text) * (1 - convertToDouble(text:discount_input.text)/100) * (convertToDouble(text:sale_input.text)/100 + 1)))"
            final_price.text = displayText
        }
        
    }
    
    func convertToDouble(text:String?) -> Double{
        if var num = Double(text!){
            if(cursor == 2 && num > 100){
                num = 100
                discount_input.text = "100"
            }
            return num
        }
        if(text! != ""){
            final_price.text = "00.00"
            price_input.text = ""
            discount_input.text = ""
            sale_input.text = ""
        }
        return 0.0
    }
    
}

