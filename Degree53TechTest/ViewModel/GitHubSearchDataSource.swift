//
//  GitHubSearchDataSource.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class GitHubDataSource : GenericDataSource<SearchItem>, UITableViewDataSource {
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitHubResultTableViewCell
        let searchResult = self.data.value[indexPath.row]
        cell.repoNameLabel.text = searchResult.fullName
        let url = URL(string: searchResult.owner?.avatarURL ?? "")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.gravitarImageView.image = UIImage(data: data!)
            }
        }
            
        return cell
    }
}
