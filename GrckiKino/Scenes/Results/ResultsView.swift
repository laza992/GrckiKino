//
//  ResultsView.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

class ResultsView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Setup Methods
    
    func setup(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.separatorInset = .zero
        tableView.register(UINib(nibName: ResultsTableViewCell.cellID, bundle: nil), forCellReuseIdentifier: ResultsTableViewCell.cellID)
    }

}
