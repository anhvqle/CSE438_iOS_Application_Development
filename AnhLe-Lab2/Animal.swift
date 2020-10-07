//
//  Animal.swift
//  AnhLe-Lab2
//
//  Created by Anh Le on 10/6/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import Foundation
class Animal{
    private (set) var happiness: Int = 0
    private (set) var food: Int = 0
    private (set) var numPlayed: Int = 0
    private (set) var numFeed: Int = 0
    var name: AnimalNames?
    
    enum AnimalNames{
        case Dog
        case Cat
        case Bird
        case Bunny
        case Fish
    }
    
    func play(){
        numPlayed += 1
        if(food > 0){
            happiness += 1
            food -= 1
        }
        if(food < 0){
            food = 0
        }
        if(happiness > 10){
            happiness = 10
        }
    }
    
    func feed(){
        numFeed += 1
        if(food <= 10){
            food += 1
        }
        if(food > 10){
            food = 10
        }
    }
    
    init(animalType: AnimalNames){
        name = animalType
        happiness = 0
        food = 0
    }
}

