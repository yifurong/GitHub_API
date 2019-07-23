//
//  HomeViewController.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        APIManager.GitHubAPI.fetchRecentCommits { (response) in
            print(response)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CommitDetailCell! = tableView.dequeueReusableCell(withIdentifier: CommitDetailCell.identifier) as? CommitDetailCell
        if cell == .none {
            cell = CommitDetailCell(style: .default, reuseIdentifier: CommitDetailCell.identifier)
            cell.selectionStyle = .none
        }
        
        cell.setup(with: "Some Person", hash: "xxxxxxxxxxxxxx", message: "Commit Message")
        
        return cell
    }
}
