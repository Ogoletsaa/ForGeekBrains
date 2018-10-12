//
//  GroupCell.swift
//  testProject
//
//  Created by Артем Оголец on 02.09.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit

class ProfilesCell: UICollectionViewCell {
    
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    var menu: Menu? {
        didSet {
            name.text = menu?.name
            if let image = menu?.imageName {
            icon.image = UIImage(named: image)
            }
        }
    }
}


