//
//  CommitResponse.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import Foundation

struct CommitResponse: Swift.Decodable {
    
    struct Commit: Swift.Decodable {
        struct Author: Swift.Decodable {
            let name: String
            let email: String
            let date: String
        }
        
        struct Committer: Swift.Decodable {
            let name: String
            let email: String
            let date: String
        }
        
        struct Tree: Swift.Decodable {
            let url: String
            let sha: String
        }
        
        struct Verification: Swift.Decodable {
            let verified: Bool
            let reason: String
            let signature: String?
            let payload: String?
        }
        
        let url: String
        let author: CommitResponse.Commit.Author
        let committer: CommitResponse.Commit.Committer
        let message: String
        let tree: CommitResponse.Commit.Tree
        let comment_count: Int
        let verification: CommitResponse.Commit.Verification
    }
    
    
    let url: String
    let sha: String
    let node_id: String
    let html_url: String
    let comments_url: String
    let commit: CommitResponse.Commit
    
    // TODO: - Complete the rest response
}
