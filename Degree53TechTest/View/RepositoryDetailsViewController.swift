//
//  RepositoryDetailsViewController.swift
//  Degree53TechTest
//
//  Created by Alec Henderson on 19/05/2020.
//  Copyright © 2020 Alec Henderson. All rights reserved.
//

import UIKit
import WebKit

class RepositoryDetailsViewController: UIViewController, UIWebViewDelegate {

  private let viewModel: RepositoryDetailsViewModel
  private let contentView:UIView = {
      let view = UIView()
      view.backgroundColor = .white
      return view
    }()
    
    init(viewModel: RepositoryDetailsViewModel) {
          self.viewModel = viewModel
          super.init(nibName: nil, bundle: nil)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = viewModel.nameLabel
        setupViews()
    }
    
    func setupViews(){
        //Name Label
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameLabel.text = viewModel.nameLabel
        
         //Number of forks
         let forkLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
         forkLabel.textAlignment = .left
        forkLabel.text = viewModel.forksLabel
        
        //Number of issues
        let issuesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
        issuesLabel.textAlignment = .left
        issuesLabel.text = viewModel.issueLabel
        
        let readMeView:UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height - 300))
            
            
        readMeView.delegate = self

        //1. Load web site into my web view
        let myURL = URL(string: viewModel.readMe)
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        readMeView.loadRequest(myURLRequest)




        
        //StackView
        let stackView = UIStackView(arrangedSubviews: [nameLabel,forkLabel,issuesLabel, readMeView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        stackView.alignment = .fill
        view.addSubview(stackView)
        view.addSubview(readMeView)
        stackView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/4)
        readMeView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 3/4)
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        readMeView.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        readMeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        readMeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        readMeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    
    

}
