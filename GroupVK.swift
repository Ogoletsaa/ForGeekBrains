//
//  GroupVK.swift
//  testProject
//
//  Created by Артем Оголец on 10/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation
import SwiftyJSON

class GroupVK {
    var id = 0.0
    var photo_200 = ""
    var name = ""
    
    init(json: JSON) {
        self.id = json["response"][0]["id"].doubleValue
        self.photo_200 = json["response"][0]["photo_604"].stringValue
        self.name = json["response"][0]["name"].stringValue
        
    }
}

extension GroupVK: CustomStringConvertible {
    var description: String {
        return "\(photo_200) \(id)"
    }
}

//{
//    "response": {
//        "count": 190,
//        "items": [{
//        "id": 28261334,
//        "name": "TJ",
//        "screen_name": "tj",
//        "is_closed": 0,
//        "type": "page",
//        "is_admin": 0,
//        "is_member": 1,
//        "photo_50": "https://pp.vk.me/...f2c/06crfCSL1KY.jpg",
//        "photo_100": "https://pp.vk.me/...f2b/PI7kwl3zvtQ.jpg",
//        "photo_200": "https://pp.vk.me/...f2a/-XlzvdumPwQ.jpg"
//        }]
//    }
//}
