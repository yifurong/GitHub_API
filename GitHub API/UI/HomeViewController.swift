//
//  HomeViewController.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var commits: [CommitResponse] = []
    
    private let tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.view.addSubview(view: self.tableView) { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadCommits(owner: "yifurong", repo: "GitHub_API")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let commit = self.commits[indexPath.row]
        
        var cell: CommitDetailCell! = tableView.dequeueReusableCell(withIdentifier: CommitDetailCell.identifier) as? CommitDetailCell
        if cell == .none {
            cell = CommitDetailCell(style: .default, reuseIdentifier: CommitDetailCell.identifier)
            cell.selectionStyle = .none
        }
        
        cell.setup(with: commit)
        
        return cell
    }
    
    private func loadCommits(owner: String, repo: String) {
        APIManager.GitHubAPI.fetchRecentCommits(owner: owner, repo: repo) { (response, error) in
            guard error == nil else {
                let controller = UIAlertController(title: "Oops!", message: "Invalid owner or repo", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(action)
                self.present(controller, animated: true, completion: nil)
                return
            }
            self.commits = response
            self.tableView.reloadData()
        }
    }
}
