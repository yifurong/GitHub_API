//
//  CommitDetailCell.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import UIKit

class CommitDetailCell: UITableViewCell {
    
    static let identifier = "CommitDetailCell"
    
    private let authorNameLabel = UILabel()
    private let commitHashLabel = UILabel()
    private let commitMessageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.contentView.addSubview(view: self.authorNameLabel) { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.right.equalToSuperview().inset(15.0)
        }
        
        self.contentView.addSubview(view: self.commitHashLabel) { (make) in
            make.top.equalTo(self.authorNameLabel.snp.bottom).offset(10.0)
            make.left.right.equalTo(self.authorNameLabel)
        }
        
        self.contentView.addSubview(view: self.commitMessageLabel) { (make) in
            make.top.equalTo(self.commitHashLabel.snp.bottom).offset(10.0)
            make.left.right.equalTo(self.authorNameLabel)
            make.bottom.equalToSuperview().offset(-10.0)
        }
    }
    
    func setup(with name: String, hash: String, message: String) {
        self.authorNameLabel.text = name
        self.commitHashLabel.text = hash
        self.commitMessageLabel.text = message
    }
}
