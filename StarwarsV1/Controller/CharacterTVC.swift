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
        title = String("Characters")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.instance.delegate = self
        DataService.instance.LoadCharactersFromAPI()
        CreateSearchbar()
        StyleTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: characterCellIndetifer)
    }
    
    func GetCharacters() {
        tableView.reloadData()
        print(DataService.instance.characters.count)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: characterCellIndetifer) {
            let character = DataService.instance.characters[indexPath.row]
            
            cell.textLabel?.text = character.name
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.textAlignment = NSTextAlignment.center
            
            let color = UIColor(red: 0.9, green: 0.7, blue: CGFloat(0.1 * (Double(indexPath.row) * 0.08)), alpha: 1.0)
            cell.backgroundColor = color
            cell.selectionStyle = .none

            return cell
        }
        return UITableViewCell()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterVC = CharacterVC()
        characterVC.view.backgroundColor = UIColor.white
        
        characterVC.character = DataService.instance.characters[indexPath.row]
        navigationController?.pushViewController(characterVC, animated: true)
        title = characterVC.character?.name
    }
    
    func CreateSearchbar() {
        let searchBar = UISearchBar()
        view.addSubview(searchBar)
    }
    
    func StyleTableView() {
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.white
    }
    

}
