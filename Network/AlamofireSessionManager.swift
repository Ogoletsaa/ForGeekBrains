//
//  AlamofireSessionManager.swift
//  testProject
//
//  Created by Артем Оголец on 05/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//


import Foundation
import Alamofire

class AlamofireSessionManager {
    
    public static let sharedManager: SessionManager = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = 40
        config.timeoutIntervalForResource = 40
        
        let manager = Alamofire.SessionManager(configuration: config)
        
        return manager
    }()

}
