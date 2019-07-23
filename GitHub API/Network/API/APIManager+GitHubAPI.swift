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
            AF.request("https://api.github.com/repos/yifurong/GitHub_API/commits").responseData { (response) in
                
                if let data = response.value {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        let prettyJSON = try JSONSerialization.data(withJSONObject: jsonResponse, options: .prettyPrinted)
                        if let request = response.request, let httpResponse = response.response, let jsonString = String(data: prettyJSON, encoding: .utf8) {
                            print("Request: \(request)")
                            print("Http Status: \(httpResponse.statusCode)")
                            print("Response: \(jsonString)")
                        }
                    } catch let error {
                        print(error)
                    }
                    
                }
            }
        }
    }
}
