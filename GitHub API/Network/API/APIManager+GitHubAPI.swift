//
//  APIManager+GitHubAPI.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import Foundation
import Alamofire

extension APIManager {
    struct GitHubAPI {
        private init() { fatalError() }
        
        static func fetchRecentCommits() {
            AF.request("https://api.github.com/repos/yifurong/GitHub_API/commits").responseJSON { response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let json = response.value {
                    print("JSON: \(json)") // serialized json response
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
            }
        }
    }
}
