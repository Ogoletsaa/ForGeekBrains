//
//  PhotosVK.swift
//  testProject
//
//  Created by Артем Оголец on 10/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation
import SwiftyJSON

class PhotosVK {
    var id = 0.0
    var photo_604 = ""
    var date = 0.0
    
    init(json: JSON) {
        self.id = json["items"][0]["id"].doubleValue
        self.photo_604 = json["items"][0]["photo_604"].stringValue
        self.date = json["items"][0]["date"].doubleValue
        
    }
}

extension PhotosVK: CustomStringConvertible {
    var description: String {
        return "\(id) \(photo_604) \(date)"
    }
}

//{
//    "response": {
//        "count": 20,
//        "items": [{
//        "id": 247648259,
//        "album_id": -7,
//        "owner_id": -1,
//        "user_id": 100,
//        "photo_75": "https://pp.vk.me/...1621/s_f15991c2.jpg",
//        "photo_130": "https://pp.vk.me/...1621/m_4228adaf.jpg",
//        "photo_604": "https://pp.vk.me/...1621/x_46426f27.jpg",
//        "text": "",
//        "date": 1302516221,
//        "post_id": 330167
//        }, {
//        "id": 248743686,
//        "album_id": -7,
//        "owner_id": -1,
//        "user_id": 100,
//        "photo_75": "https://pp.vk.me/...2/-5/s_80529ba4.jpg",
//        "photo_130": "https://pp.vk.me/...2/-5/m_5fe2d21f.jpg",
//        "photo_604": "https://pp.vk.me/...2/-5/x_06bffe46.jpg",
//        "text": "",
//        "date": 1302712950,
//        "post_id": 330293
//        }]
//    }
//}
