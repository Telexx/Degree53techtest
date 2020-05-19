//
//  GitHubResultTableViewCell.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import UIKit

class GitHubResultTableViewCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(gravitarImageView)
        self.contentView.addSubview(repoNameLabel)
        setupContraints()
     }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
    }
    
    let gravitarImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
       return img
    }()
    
    let repoNameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    func setupContraints(){
        //Image
        gravitarImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        gravitarImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        repoNameLabel.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:100).isActive = true
        repoNameLabel.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        gravitarImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        gravitarImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
    }
}
