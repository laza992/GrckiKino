//
//  ResultsViewController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

class ResultsViewController: BaseViewController {

    // MARK: - Properties
    
    private var customView: ResultsView!{
        loadViewIfNeeded()
        return view as? ResultsView
    }
    var viewModel: ResultsViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getResults()
        customView.setup(delegate: self, dataSource: self)
    }
}

// MARK: - Web Services

extension ResultsViewController {
    
    private func getResults() {
        showProgressHUD()
        
        viewModel.getResults {
            DispatchQueue.main.async {
                self.hideProgressHUD()
                self.customView.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDrawsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.cellID, for: indexPath) as! ResultsTableViewCell
        cell.setup(viewModel.getDrawsFor(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
