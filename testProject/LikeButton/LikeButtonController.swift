//
//  LikeButtonController.swift
//  testProject
//
//  Created by Артем Оголец on 04.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class LikeButtonController: UIViewController {

    var clickCounter = 0
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        reccomendState()
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = Singleton.shared.name
        likesLabel.text = String(Singleton.shared.likes)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    func reccomendState () {
        if likeButton.isSelected == false {
            likeButton.isSelected = true
            clickCounter += 1
            likesLabel.text = String(Singleton.shared.likes + 1)
            likeLabel.text = "\(clickCounter)"
        } else {
            likeButton.isSelected = false
            clickCounter -= 1
            likesLabel.text = String(Singleton.shared.likes)
            likeLabel.text = "\(clickCounter)"
        }
        return
    }
}
