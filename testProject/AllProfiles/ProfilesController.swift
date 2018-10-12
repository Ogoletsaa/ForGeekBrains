//
//  GroupsController.swift
//  testProject
//
//  Created by Артем Оголец on 02.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class ProfilesController: UICollectionViewController {
    
    var contactsMenuArray: [Menu] = {
        var deadpool = Menu ()
        deadpool.name = "Wade Willson"
        deadpool.imageName = "Deadpool"
        
        var batman = Menu ()
        batman.name = "Bruce Wayne"
        batman.imageName = "Batman"
        
        var superman = Menu ()
        superman.name = "Clark Kent "
        superman.imageName = "Superman"
        
        var spiderman = Menu ()
        spiderman.name = "Peter Parker"
        spiderman.imageName = "Spiderman"
        
        var ironman = Menu ()
        ironman.name = "Tony Stark"
        ironman.imageName = "Ironman"
        return [deadpool, batman, superman, spiderman, ironman]
    } ()
    
    //MARK: - Outlets and actions
    @IBOutlet var cvController: UICollectionView!
    
    //MARK: functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let vc = segue.destination as? ProfilePhotoes {
                let menu = sender as? Menu
                vc.menu = menu
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        // super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return contactsMenuArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllGroupsCell" , for: indexPath) as! ProfilesCell
    
        // Configure the cell
        cell.menu = contactsMenuArray[indexPath.row]
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = contactsMenuArray[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: menu)
    }
    
}
