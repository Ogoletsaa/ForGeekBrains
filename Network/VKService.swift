//
//  VKService.swift
//  testProject
//
//  Created by Артем Оголец on 10/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class VKService {
    
    let baseUrl = "https://api.vk.com"
    
    var request: URLRequest? = nil
    
    init () {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "oauth.vk.com"
    urlComponents.path = "/authorize"
    urlComponents.queryItems = [
    URLQueryItem(name: "client_id", value: "6713102"),
    URLQueryItem(name: "display", value: "mobile"),
    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
    URLQueryItem(name: "scope", value: "262150"),
    URLQueryItem(name: "response_type", value: "token"),
    URLQueryItem(name: "v", value: "5.68")
    ]
    
    self.request = URLRequest(url: urlComponents.url!)
    }
    
//MARK: - Functions
    
    public func loadUserGroupsAlamofire () {
        
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": Singleton.shared.token,
            "extended" : "1",
            "v": "5.58"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON
            { (response) in
                switch response.result {
                case.failure(let error):
                    print(error.localizedDescription)
                case.success(let value):
                    let json = JSON(value)
                    let VKGroups = json.arrayValue.map { UsersVK(json: $0) }
                    
                    for groups in VKGroups {
                        print(groups)
                    }
                }
        }
    }
    
    public func loadUserFriendsAlamofire () {
        
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": Singleton.shared.token,
            "order" : "hints",
            "v": "5.58"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON
            { (response) in
                switch response.result {
                case.failure(let error):
                    print(error.localizedDescription)
                case.success(let value):
                    let json = JSON(value)
                    let friends = json["response"].arrayValue.map {FriendsVK(json: $0)}
                    
                    for friend in friends {
                        print(friend)
                    }
                    
                    
                }
        }
    }
    
    public func loadUserPhotosAlamofire () {
        
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": Singleton.shared.token,
            "album_id" : "wall",
            "extended": "1",
            "offset" : "0",
            "v": "5.85"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON
            { (response) in
                switch response.result {
                case.failure(let error):
                    print(error.localizedDescription)
                case.success(let value):
                    print(value)
                }
        }
    }
    
    public func searchGroupsAlamofire (value: String) {
        
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": Singleton.shared.token,
            "q" : value,
            "v": "5.85"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON
            { (response) in
                switch response.result {
                case.failure(let error):
                    print(error.localizedDescription)
                case.success(let value):
                    print(value)
                }
        }
    }    
}

