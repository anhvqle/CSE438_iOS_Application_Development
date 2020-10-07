//
//  ViewController.swift
//  AnhLe-Lab2
//
//  Created by Anh Le on 10/5/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numPlay: UILabel!
    @IBOutlet weak var numFed: UILabel!
    
    @IBOutlet weak var PetView: UIView!
    
    @IBOutlet weak var happinessBar: DisplayView!
    @IBOutlet weak var foodBar: DisplayView!
    
    let animals = ["Dog", "Cat", "Bird", "Bunny", "Fish"]
    
    var currentAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initialize a Dog Animal
        currentAnimal = Animal(animalType: .Dog)
        PetView.backgroundColor = .red
        happinessBar.color = .red
        foodBar.color = .red
        updateDisplay()
    }
    
    @IBAction func play(_ sender: Any) {
        let numPlayed = (currentAnimal?.numPlayed)! + 1
        numPlay.text = "Played: \(numPlayed)"
        currentAnimal?.play()
        updateDisplay()
    }
    
    @IBAction func feed(_ sender: Any) {
        let numFood = (currentAnimal?.numFeed)! + 1
        numFed.text = "Played: \(numFood)"
        currentAnimal?.feed()
        updateDisplay()
    }
    
    func updateDisplay(){
        let happyValue = Double((currentAnimal?.happiness)!)/10
        happinessBar.animateValue(to: CGFloat(happyValue))
        let foodVaue = Double((currentAnimal?.food)!)/10
        foodBar.animateValue(to: CGFloat(foodVaue))
    }
    
}

