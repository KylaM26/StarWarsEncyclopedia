//
//  DataService.swift
//  StarwarsV1
//
//  Created by Kyla Wilson on 4/27/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import Foundation
import Alamofire

@objc protocol CharacterTableDelegate: class {
    @objc optional func GetCharacters()
}

class DataService {
    static let instance = DataService()
    var characters = [Character]()
    weak var delegate: CharacterTableDelegate?
    
    
    func LoadCharactersFromAPI() {
        for page in 1..<10 {
            let peopleURL = "/people/?page=\(page)"
            Alamofire.request(rootURL + peopleURL).responseJSON { (response) in
                if let json = response.result.value as? Dictionary<String,Any>{
                    // Getting the next page of characters because there are 87 characters total,
                    // however, some characters are on the next page so I have to find a way to
                    // load the next page (10 characters per page???)
                    
                    if let results = json["results"] as? [Dictionary<String, Any>] {
                        let resultCount = results.count
                        for char in 0..<resultCount {
                            let character = Character()
                            if let name = results[char]["name"] as? String {
                                character.name = name
                            }
                            self.characters.append(character)
                        }
                    }
                }
                self.delegate?.GetCharacters?()
            }
        }
    }

}
