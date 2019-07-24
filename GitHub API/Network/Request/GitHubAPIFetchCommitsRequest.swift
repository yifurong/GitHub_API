//
//  GitHubAPIFetchCommitsRequest.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import Foundation

class GitHubAPIFetchCommitsRequest {
    private let owner: String
    private let repo: String
    
    var path: String {
        return "https://api.github.com/repos/\(self.owner)/\(self.repo)/commits"
    }
    
    init(owner: String, repo: String) {
        self.owner = owner
        self.repo = repo
    }
}
