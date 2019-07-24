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
        
        static func fetchRecentCommits(owner: String, repo: String, clousre: @escaping ([CommitResponse], Error?) -> Void) {
            let request = GitHubAPIFetchCommitsRequest(owner: owner, repo: repo)
            
            AF.request(request.path).responseData { (response) in
                if let request = response.request, let httpResponse = response.response {
                    print("Request: \(request)")
                    print("Http Status: \(httpResponse.statusCode)")
                }
                
                if let error = response.error {
                    clousre([], error)
                }
                
                if let data = response.value {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        let prettyJSON = try JSONSerialization.data(withJSONObject: jsonResponse, options: .prettyPrinted)
                        if let jsonString = String(data: prettyJSON, encoding: .utf8) {
                            print("Response: \(jsonString)")
                        }
                    } catch let error {
                        clousre([], error)
                    }
                    
                    do {
                        let commitsResponse = try JSONDecoder().decode([CommitResponse].self, from: data)
                        clousre(commitsResponse, nil)
                    } catch let error {
                        print(error)
                        clousre([], error)
                    }
                }
            }
        }
    }
}
