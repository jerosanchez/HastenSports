//
//  PlayersListController.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

protocol PlayersListNavigationLogic {
    func navigateToPlayerDetail(player: Player)
}

class PlayersListController: UIViewController {
    
    // MARK: - Properties
    
    var navigator: PlayersListNavigationLogic?
    
    private(set) var tableView: UITableView
    private let dataSource: PlayersListDataSource
    private let viewModel: PlayersListViewModel
    
    private(set) var spinnerView = UIActivityIndicatorView(style: .gray)
    
    // MARK: - Initialization
    
    init(dataSource: PlayersListDataSource, viewModel: PlayersListViewModel) {
        self.tableView = UITableView()
        self.dataSource = dataSource
        self.viewModel = viewModel
        
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
    
    private func bindAndFire() {
        viewModel.playersGroups.bind { playersGroups in
            self.spinnerView.stopAnimating()
            self.tableView.isHidden = false
            
            self.dataSource.playersGroups = playersGroups
            self.tableView.reloadData()
        }
        viewModel.loadError.bind { error in
            self.spinnerView.stopAnimating()
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let playersGroup = dataSource.playersGroups[indexPath.section]
        let player = playersGroup.players[indexPath.row]
        navigator?.navigateToPlayerDetail(player: player)
    }
}
