//
//  VKLoginViewController.swift
//  testProject
//
//  Created by Артем Оголец on 05/10/2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.

import UIKit
import WebKit
import Alamofire

class VKLoginViewController: UIViewController {
    
    let vkService = VKService()
    let friends = [FriendsVK]()

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(vkService.request!)
    }

}

extension VKLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"], let userId = Int(params["user_id"]!) else {
            decisionHandler(.cancel)
            return
        }
        
        print(token, userId)
        
        for element in friends {
            print(element)
        }
        
        Singleton.shared.token = token
        Singleton.shared.userId = userId
        
        vkService.loadUserGroupsAlamofire()
        //vkService.searchGroupsAlamofire (value: "Sakhalin")
        vkService.loadUserFriendsAlamofire()
        //vkService.loadUserPhotosAlamofire ()
        

        decisionHandler(.cancel)
    }

}
