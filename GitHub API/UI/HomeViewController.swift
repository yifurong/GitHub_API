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
    
    private let ownerTextField = UITextField()
    private let repoTextField = UITextField()
    private let retrieveButton = UIButton()
    private let tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = .white
        self.edgesForExtendedLayout = []
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.keyboardDismissMode = .onDrag
        
        self.ownerTextField.placeholder = "yifurong"
        self.repoTextField.placeholder = "GitHub_API"
        [self.ownerTextField, self.repoTextField].forEach({
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        })
        
        self.retrieveButton.setTitle("Retrieve", for: .normal)
        self.retrieveButton.addTarget(self, action: #selector(retrieveClicked(_:)), for: .touchUpInside)
        self.retrieveButton.setTitleColor(.black, for: .normal)
        
        self.view.addSubview(view: self.ownerTextField) { (make) in
            make.top.left.equalToSuperview().offset(10.0)
            make.width.equalToSuperview().multipliedBy(0.25)
            make.height.equalTo(25.0)
        }
        
        self.view.addSubview(view: self.repoTextField) { (make) in
            make.top.width.height.equalTo(self.ownerTextField)
            make.left.equalTo(self.ownerTextField.snp.right).offset(15.0)
        }
        
        self.view.addSubview(view: self.retrieveButton) { (make) in
            make.top.width.height.equalTo(self.ownerTextField)
            make.left.equalTo(self.repoTextField.snp.right).offset(15.0)
            make.right.equalToSuperview().offset(-10.0)
        }
        
        self.view.addSubview(view: self.tableView) { (make) in
            make.top.equalTo(self.ownerTextField.snp.bottom).offset(10.0)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
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
                self.commits = []
                self.tableView.reloadData()
                
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
    
    @objc func retrieveClicked(_ sender: UIButton) {
        let owner: String! = self.ownerTextField.text?.isEmpty ?? true ? self.ownerTextField.placeholder : self.ownerTextField.text
        let repo: String! = self.repoTextField.text?.isEmpty ?? true ? self.repoTextField.placeholder : self.repoTextField.text
        
        self.loadCommits(owner: owner, repo: repo)
    }
}
