//
//  PlayersListController.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

final class PlayersListController: UIViewController {
    
    // MARK: - Properties
    
    private let tableView: UITableView
    private let dataSource: PlayersListDataSource
    
    // MARK: - Initialization
    
    init() {
        self.tableView = UITableView()
        self.dataSource = PlayersListDataSource()
        
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        setupView()
    }
    
    // MARK: - Helpers
    
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let displayedController = navigationController?.viewControllers.first
        displayedController?.view.addSubviewForAutolayout(tableView)
        tableView.fillSuperview()
        
        navigationItem.title = "HastenSports"
    }
}
