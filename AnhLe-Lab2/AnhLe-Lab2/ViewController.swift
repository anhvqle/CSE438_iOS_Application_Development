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
    let animalImages = [UIImage(named: "dog"),
                        UIImage(named: "cat"),
                        UIImage(named: "bird"),
                        UIImage(named: "bunny"),
                        UIImage(named: "fish")]
    
    var currentAnimal: Animal?
    var globalTag = 0
    
    var currentDog = Animal(animalType: .Dog)
    var currentCat = Animal(animalType: .Dog)
    var currentBird = Animal(animalType: .Dog)
    var currentFish = Animal(animalType: .Dog)
    var currentBunny = Animal(animalType: .Dog)
    
    @IBOutlet weak var currentAnimalPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
        //Initialize a Dog Animal
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
        if(sender.tag == 0){
            globalTag = 0
            currentAnimal = currentDog
            PetView.backgroundColor = .red
            happinessBar.color = .red
            foodBar.color = .red
            updateDisplay()
        }
        else if(sender.tag == 1){
            globalTag = 1
            currentAnimal = currentCat
            PetView.backgroundColor = .blue
            happinessBar.color = .blue
            foodBar.color = .blue
            updateDisplay()
        }
        else if(sender.tag == 2){
            globalTag = 2
            currentAnimal = currentBird
            PetView.backgroundColor = .yellow
            happinessBar.color = .yellow
            foodBar.color = .yellow
            updateDisplay()
        }
        else if(sender.tag == 3){
            globalTag = 3
            currentAnimal = currentBunny
            PetView.backgroundColor = .orange
            happinessBar.color = .orange
            foodBar.color = .orange
            updateDisplay()
        }
        else if(sender.tag == 4){
            globalTag = 4
            currentAnimal = currentFish
            PetView.backgroundColor = .purple
            happinessBar.color = .purple
            foodBar.color = .purple
            updateDisplay()
        }
    }
    
    @IBAction func leftArrow(_ sender: UIButton) {
        if(globalTag == 1){
            globalTag = 0
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentDog
            PetView.backgroundColor = .red
            happinessBar.color = .red
            foodBar.color = .red
            updateDisplay()
        }
        else if(globalTag == 2){
            globalTag = 1
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentCat
            PetView.backgroundColor = .blue
            happinessBar.color = .blue
            foodBar.color = .blue
            updateDisplay()
        }
        else if(globalTag == 3){
            globalTag = 2
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentBird
            PetView.backgroundColor = .yellow
            happinessBar.color = .yellow
            foodBar.color = .yellow
            updateDisplay()
        }
        else if(globalTag == 4){
            globalTag = 3
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentBunny
            PetView.backgroundColor = .orange
            happinessBar.color = .orange
            foodBar.color = .orange
            updateDisplay()
        }
        else if(globalTag == 0){
            globalTag = 4
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentFish
            PetView.backgroundColor = .purple
            happinessBar.color = .purple
            foodBar.color = .purple
            updateDisplay()
        }
    }
    
    @IBAction func rightArrow(_ sender: UIButton) {
        if(globalTag == 0){
            globalTag = 1
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentCat
            PetView.backgroundColor = .blue
            happinessBar.color = .blue
            foodBar.color = .blue
            updateDisplay()
        }
        else if(globalTag == 1){
            globalTag = 2
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentBird
            PetView.backgroundColor = .yellow
            happinessBar.color = .yellow
            foodBar.color = .yellow
            updateDisplay()
        }
        else if(globalTag == 2){
            globalTag = 3
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentBunny
            PetView.backgroundColor = .orange
            happinessBar.color = .orange
            foodBar.color = .orange
            updateDisplay()
        }
        else if(globalTag == 3){
            globalTag = 4
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentFish
            PetView.backgroundColor = .purple
            happinessBar.color = .purple
            foodBar.color = .purple
            updateDisplay()
        }
        else if(globalTag == 4){
            globalTag = 0
            currentAnimalPicture.image = animalImages[globalTag]
            currentAnimal = currentDog
            PetView.backgroundColor = .red
            happinessBar.color = .red
            foodBar.color = .red
            updateDisplay()
        }
    }
}
