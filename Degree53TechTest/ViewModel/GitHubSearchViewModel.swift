//
//  GitHubService.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import Foundation
import Alamofire


public class GitHubSearchViewModel{
    
    weak var dataSource : GenericDataSource<SearchItem>?
    
    init(dataSource : GenericDataSource<SearchItem>?) {
           self.dataSource = dataSource
       }

    func searchRepository(searchTerm:String){
        let url = "https://api.github.com/search/repositories?q=\(searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")"
        print(url)
        Alamofire.request(url).responseGithubSearch { response in
             if let githubSearch = response.result.value {
                self.dataSource?.data.value = githubSearch.items
            }
        }
    }
}

