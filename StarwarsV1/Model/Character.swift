//
//  Character.swift
//  StarwarsV1
//
//  Created by Kyla Wilson on 4/27/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import Foundation

class Character {
    var name: String?
    var height: String?
    var mass: String?
    var birthYear:String?
    var homeworld: String?
    var films: String?
    
    init() {
        self.name = "Loading.."
        self.height = ""
        self.mass = ""
        self.birthYear = ""
        self.homeworld = ""
        self.films = ""
    }
    
    init(name: String) {
        self.name = name
        self.height = ""
        self.mass = ""
        self.birthYear = ""
        self.homeworld = ""
        self.films = ""
    }
    
    init(name: String, height: String, mass:String, birthYear: String, homeworld: String, films:String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.birthYear = birthYear
        self.homeworld = homeworld
        self.films = films
    }
}
