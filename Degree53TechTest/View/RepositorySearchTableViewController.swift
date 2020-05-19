//
//  RepositorySearchTableViewController.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import UIKit

class RepositorySearchTableViewController: UITableViewController, UISearchBarDelegate {

    
    var resultSearchController = UISearchController()
    let dataSource = GitHubDataSource()
    lazy var viewModel : GitHubSearchViewModel = {
        let viewModel = GitHubSearchViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Github Search"
            resultSearchController = ({
              let controller = UISearchController(searchResultsController: nil)
              tableView.tableHeaderView = controller.searchBar
              controller.searchBar.sizeToFit()
              return controller
          })()
        self.tableView.register(GitHubResultTableViewCell.self as AnyClass, forCellReuseIdentifier: "cell")
        tableView.dataSource = self.dataSource
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        resultSearchController.searchBar.delegate = self
        self.tableView.rowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = viewModel.dataSource?.data.value[indexPath.row]
        let detailsViewModel = RepositoryDetailsViewModel(searchItem: currentItem!)
        let vc = RepositoryDetailsViewController(viewModel: detailsViewModel)
        self.present(vc, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)

    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchTerm = resultSearchController.searchBar.text!
        self.viewModel.searchRepository(searchTerm: searchTerm)
        self.dismiss(animated: false)
    }
    
    
 
    
}
