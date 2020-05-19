//
//  RepositoryDetailsViewModel.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import Foundation
import Alamofire
class RepositoryDetailsViewModel{
    private let searchItem: SearchItem
    var nameLabel:String = String()
    var readMe:String = String()
    var forksLabel:String = String()
    var issueLabel:String = String()
    
     init(searchItem: SearchItem) {
        self.searchItem = searchItem
        self.nameLabel = searchItem.fullName!
        self.forksLabel = "Number of forks: \(searchItem.forksCount ?? 0)"
        self.issueLabel = "Number of open issues: \(searchItem.openIssuesCount ?? 0)"
        self.readMe = "https://github.com/\(searchItem.owner?.login ?? "")/\(searchItem.name ?? "")/blob/master/README.md"
      //  self.readMe = getReadMe(owner: (searchItem.owner?.login)!, repo: searchItem.name!)
     }
    

}
