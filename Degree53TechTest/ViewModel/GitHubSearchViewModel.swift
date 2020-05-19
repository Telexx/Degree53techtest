//
//  GitHubService.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import Foundation
import Alamofire

public class GitHubService{
    
    typealias CompletionHandler = (_ success: GithubSearch) -> Void
    
    func searchRepository(searchTerm:String, CompletionHandler: @escaping CompletionHandler){
        
        var url = "https://api.github.com/search/repositories?q=\(searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")"
        print(url)
        Alamofire.request(url).responseGithubSearch { response in
             if let githubSearch = response.result.value {
                CompletionHandler(githubSearch)
            }
        }
    }
}

