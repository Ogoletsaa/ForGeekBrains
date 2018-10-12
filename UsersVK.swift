//
//  UsersVK.swift
//  testProject
//
//  Created by Артем Оголец on 10/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation
import SwiftyJSON

class UsersVK {
    var id = 0.0
    var first_name = ""
    var last_name = ""
    var city = ""
    
    init(json: JSON) {
        self.id = json["response"][0]["id"].doubleValue
        self.first_name = json["response"][0]["first_name"].stringValue
        self.last_name = json["response"][0]["last_name"].stringValue
        self.city = json["response"][0]["city"]["title"].stringValue
        
    }
}

extension UsersVK: CustomStringConvertible {
    var description: String {
        return "\(first_name) \(last_name)"
    }
}

//{
//    "response": [{
//    "id": 210700286,
//    "first_name": "Lindsey",
//    "last_name": "Stirling",
//    "city": {
//    "id": 5331,
//    "title": "Los Angeles"
//    },
//    "verified": 1
//    }]
//}
