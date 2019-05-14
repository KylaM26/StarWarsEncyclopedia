//
//  CharacterTVC.swift
//  StarwarsV1
//
//  Created by Kyla Wilson on 4/27/19.
//  Copyright © 2019 Kyla Wilson. All rights reserved.
//

import UIKit

class CharacterTVC: UITableViewController, CharacterTableDelegate {
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        DataService.instance.delegate = self
        DataService.instance.LoadCharactersFromAPI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: characterCellIndetifer)
    }
    
    func GetCharacters() {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let cell = UITableViewCell(style: .default, reuseIdentifier: characterCellIndetifer)

        if let cell = tableView.dequeueReusableCell(withIdentifier: characterCellIndetifer) {
            let character = DataService.instance.characters[indexPath.row]
            
            cell.textLabel?.text = character.name
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.textAlignment = NSTextAlignment.center
            return cell
        }
        return UITableViewCell()

    }

}
