//
//  ViewController.swift
//  testProject
//
//  Created by Артем Оголец on 06.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class NamesController: UITableViewController, UISearchBarDelegate {
    
    let cellID = "cellID"
    
    var names = [
        ["Aquaman","Ant-Man"],
        ["Batman","Black Panther"],
        ["Captain Cold","Captain America"],
        ["Deadpool","Dr. Strange","Daredevil"]
    ]

    var convertedNames: [String] = []
    var filteredNames: [String] = []
    var searching = false
  
    @objc func handleShowIndexPath() {
        print ("Attempting reload animation of IndexPath...")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.convertedNames = self.names.flatMap({$0})
        self.filteredNames = self.names.flatMap({$0})
        
        searchBar()
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //NavigationTopBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Contact", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    // Search bar
    fileprivate func searchBar(){
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        tableView.tableHeaderView = searchBar
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredNames = convertedNames.filter({ $0.prefix(searchText.count ) == searchText})
        searching = true
        tableView.reloadData()
        
    }
    
    // Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    // Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredNames.count
        } else {
            return convertedNames.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if searching {
            cell.textLabel?.text = filteredNames[indexPath.row]
        } else {
            cell.textLabel?.text = convertedNames[indexPath.row]
            
        }
        return cell
    }
    
//MARK:- Helpers
    func count () -> Int {
        let firstLetters = Array(Set(convertedNames.map { String($0.first!) } ) )
        return firstLetters.count
    }
    
    
}
