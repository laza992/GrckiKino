//
//  UpcomingRoundsView.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class UpcomingRoundsView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Setup Methods
    
    func setup(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.register(UINib(nibName: UpcomingRoundsTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: UpcomingRoundsTableViewCell.cellID)
    }
}
