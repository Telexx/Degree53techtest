//
//  Degree53TechTestTests.swift
//  Degree53TechTestTests
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import XCTest
@testable import Degree53TechTest

class Degree53TechTestTests: XCTestCase {

    func testParsingSearchResults(){
        var json = """
{
          "total_count": 40,
          "incomplete_results": false,
          "items": [
            {
              "id": 3081286,
              "node_id": "MDEwOlJlcG9zaXRvcnkzMDgxMjg2",
              "name": "Tetris",
              "full_name": "dtrupenn/Tetris",
              "owner": {
                "login": "dtrupenn",
                "id": 872147,
                "node_id": "MDQ6VXNlcjg3MjE0Nw==",
                "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
                "gravatar_id": "",
                "url": "https://api.github.com/users/dtrupenn",
                "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
                "type": "User"
              },
              "private": false,
              "html_url": "https://github.com/dtrupenn/Tetris",
              "description": "A C implementation of Tetris using Pennsim through LC4",
              "fork": false,
              "url": "https://api.github.com/repos/dtrupenn/Tetris",
              "created_at": "2012-01-01T00:31:50Z",
              "updated_at": "2013-01-05T17:58:47Z",
              "pushed_at": "2012-01-01T00:37:02Z",
              "homepage": "",
              "size": 524,
              "stargazers_count": 1,
              "watchers_count": 1,
              "language": "Assembly",
              "forks_count": 123,
              "open_issues_count":456,
              "master_branch": "master",
              "default_branch": "master",
              "score": 1.0
            }
          ]
        }
"""
        
        let githubSearch = try? newJSONDecoder().decode(GithubSearch.self, from: Data(json.utf8))
        //Test Some Objects In The JSON
        XCTAssertEqual(githubSearch?.items[0].language, "Assembly")
        XCTAssertEqual(githubSearch?.items[0].owner?.login, "dtrupenn")
        testDetailsViewModel(gitHubSearch: githubSearch!)
    }
    
    func testDetailsViewModel(gitHubSearch: GithubSearch){
        var viewModel:RepositoryDetailsViewModel = RepositoryDetailsViewModel(searchItem: gitHubSearch.items[0])
        
        //test labels outputs
        XCTAssertEqual(viewModel.forksLabel, "Number of forks: 123")
        XCTAssertEqual(viewModel.issueLabel, "Number of open issues: 456")
        XCTAssertEqual(viewModel.nameLabel, "dtrupenn/Tetris")
        XCTAssertEqual(viewModel.readMe, "https://github.com/dtrupenn/Tetris/blob/master/README.md")
    }

}
