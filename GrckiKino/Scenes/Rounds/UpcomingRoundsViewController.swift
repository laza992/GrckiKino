//
//  UpcomingRoundsViewController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class UpcomingRoundsViewController: BaseViewController {

    private var customView: UpcomingRoundsView!{
        loadViewIfNeeded()
        return view as? UpcomingRoundsView
    }
    lazy var flowController = MainFlowController(currentViewController: self)
    var viewModel: UpcomingRoundsViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView.setup(delegate: self, dataSource: self)
        getUpcomingDraws()
    }
    
}

// MARK: - Web Services

extension UpcomingRoundsViewController {
    
    private func getUpcomingDraws() {
        showProgressHUD()
        
        viewModel.getUpcomingDraws {
            DispatchQueue.main.async {
                self.hideProgressHUD()
                self.customView.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource 

extension UpcomingRoundsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDrawsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingRoundsTableViewCell.cellID, for: indexPath) as! UpcomingRoundsTableViewCell
        cell.setup(viewModel.getDrawsFor(indexPath: indexPath), indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let drawModel = viewModel.getDrawsFor(indexPath: indexPath)
        flowController.goToMainTabBar(drawID: drawModel.drawId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
}
