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
    
    let animalImages = [UIImage(named: "dog"),
                        UIImage(named: "cat"),
                        UIImage(named: "bird"),
                        UIImage(named: "bunny"),
                        UIImage(named: "fish")]
    
    var currentAnimal: Animal?
    var globalTag = 0
    
    var currentDog = Animal()
    var currentCat = Animal()
    var currentBird = Animal()
    var currentFish = Animal()
    var currentBunny = Animal()
    var animals: [Animal]?
    var colors: [UIColor] = [.red, .blue, .yellow, .orange, .purple]
    
    @IBOutlet weak var currentAnimalPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
        animals = [currentDog, currentCat, currentBird, currentBunny, currentFish]
        currentAnimal = currentDog
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
        numFed.text = "Fed: \(numFood)"
        currentAnimal?.feed()
        updateDisplay()
    }
    
    func updateDisplay(){
        let numPlayed = (currentAnimal?.numPlayed)!
        numPlay.text = "Played: \(numPlayed)"
        let numFood = (currentAnimal?.numFeed)!
        numFed.text = "Fed: \(numFood)"
        
        let happyValue = Double((currentAnimal?.happiness)!)/10
        happinessBar.animateValue(to: CGFloat(happyValue))
        let foodVaue = Double((currentAnimal?.food)!)/10
        foodBar.animateValue(to: CGFloat(foodVaue))
    }
    
    @IBAction func changeAnimal(_ sender: UIButton) {
        currentAnimalPicture.image = animalImages[sender.tag]
        globalTag = sender.tag
        currentAnimal = animals![sender.tag]
        PetView.backgroundColor = colors[sender.tag]
        happinessBar.color = colors[sender.tag]
        foodBar.color = colors[sender.tag]
        updateDisplay()
    }
    
    func arrayButtons(_ tagNum: Int){
        currentAnimalPicture.image = animalImages[tagNum]
        currentAnimal = animals![tagNum]
        PetView.backgroundColor = colors[tagNum]
        happinessBar.color = colors[tagNum]
        foodBar.color = colors[tagNum]
    }
    
    @IBAction func leftArrow(_ sender: UIButton) {
        if(globalTag == 1){
            globalTag = 0
        }
        else if(globalTag == 2){
            globalTag = 1
        }
        else if(globalTag == 3){
            globalTag = 2
        }
        else if(globalTag == 4){
            globalTag = 3
        }
        else if(globalTag == 0){
            globalTag = 4
        }
        arrayButtons(globalTag)
        updateDisplay()
    }
    
    @IBAction func rightArrow(_ sender: UIButton) {
        if(globalTag == 0){
            globalTag = 1
        }
        else if(globalTag == 1){
            globalTag = 2
        }
        else if(globalTag == 2){
            globalTag = 3
        }
        else if(globalTag == 3){
            globalTag = 4
        }
        else if(globalTag == 4){
            globalTag = 0
        }
        arrayButtons(globalTag)
        updateDisplay()
    }
}
