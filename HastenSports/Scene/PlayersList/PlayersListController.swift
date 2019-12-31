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
    private let viewModel: PlayersListViewModel
    
    // MARK: - Initialization
    
    init() {
        self.tableView = UITableView()
        self.dataSource = PlayersListDataSource()
        let networkingService = NetworkingService()
        let repository = HastenSportsRemoteRepository(networkingService: networkingService)
        self.viewModel = PlayersListViewModel(repository: repository)
        
        super.init(nibName: nil, bundle: nil)
        
        self.tableView.dataSource = dataSource
        self.tableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        setupView()
        bindAndFire()
    }
    
    // MARK: - Helpers
    
    private func registerCells() {
        tableView.register(PlayersListCell.self, forCellReuseIdentifier: PlayersListCell.description())
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let displayedController = navigationController?.viewControllers.first
        displayedController?.view.addSubviewForAutolayout(tableView)
        tableView.fillSuperview()
        
        navigationItem.title = "HastenSports"
    }
    
    private func bindAndFire() {
        viewModel.playersGroups.bind { playersGroups in
            self.dataSource.playersGroups = playersGroups
            self.tableView.reloadData()
        }
        viewModel.loadError.bind { error in
            if let error = error {
                print("Loading error: \(error.localizedDescription)")
            }
        }
        viewModel.loadPlayers()
    }
}

// MARK: - Delegates

extension PlayersListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
