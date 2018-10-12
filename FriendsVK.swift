//
//  FriendsVK.swift
//  testProject
//
//  Created by Артем Оголец on 10/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation
import SwiftyJSON

class FriendsVK {
    var id = 0.0
    var first_name = ""
    var last_name = ""
    var domain = ""
    var city = ""
    
    init(json: JSON) {
        self.id = json["items"][0]["id"].doubleValue
        self.first_name = json["items"][0]["first_name"].stringValue
        self.last_name = json["items"][0]["last_name"].stringValue
        self.domain = json["items"][0]["domain"].stringValue
        self.city = json["items"][0]["city"]["title"].stringValue
        
    }
}

extension FriendsVK: CustomStringConvertible {
    var description: String {
        return "\(first_name) \(last_name) \(city)"
    }
}

//{
//    "response": {
//        "count": 690,
//        "items": [{
//        "id": 172823,
//        "first_name": "Andrey",
//        "last_name": "Melnik",
//        "domain": "a.melnik",
//        "city": {
//        "id": 2,
//        "title": "Sankt-Peterburg"
//        },
//        "online": 0
//        }, {
//        "id": 66559,
//        "first_name": "Andrey",
//        "last_name": "Mima",
//        "domain": "amima",
//        "city": {
//        "id": 2,
//        "title": "Sankt-Peterburg"
//        },
//        "online": 1
//        }, {
//        "id": 15915916,
//        "first_name": "Andrey",
//        "last_name": "Minchukov",
//        "domain": "starr",
//        "city": {
//        "id": 244,
//        "title": "Vitebsk"
//        },
//        "online": 0
//        }]
//    }
//}
