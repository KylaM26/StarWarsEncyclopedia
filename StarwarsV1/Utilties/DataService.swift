//
//  DataService.swift
//  StarwarsV1
//
//  Created by Kyla Wilson on 4/27/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    static let instance = DataService()
    
    let characterCount = 5
    var characters: [Character] = [Character]()
    
    private init() {
        var counter = 0
        while counter < characterCount {
            characters.append(Character())
            counter += 1
        }
    }
    
    func LoadCharactersFromAPI() {

    }
}
