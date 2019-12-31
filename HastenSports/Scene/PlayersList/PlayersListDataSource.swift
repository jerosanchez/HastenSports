//
//  PlayersListDataSource.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

class PlayersListDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    var playersGroups = [PlayersGroup]()
    
    // MARK: - Implementation
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return playersGroups.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return playersGroups[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersGroups[section].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayersListCell.description(), for: indexPath) as! PlayersListCell
        cell.configure()
        return cell
    }
}
