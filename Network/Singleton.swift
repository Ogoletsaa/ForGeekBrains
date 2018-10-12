//
//  Singleton.swift
//  testProject
//
//  Created by Артем Оголец on 29/09/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation

class Singleton {
    private init()  { }
    
    static var shared = Singleton ()
    
    var token = ""
    var userId = Int()
    var likes = 0
    var name = ""
   
}
