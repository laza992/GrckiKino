//
//  UpcomingRoundsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import Foundation

protocol UpcomingRoundsViewModelProtocol {
    func getDrawsCount() -> Int
    func getDrawsFor(indexPath: IndexPath) -> DrawingModel
    
    func getUpcomingDraws(completion: @escaping() -> ())
}

final class UpcomingRoundsViewModel: UpcomingRoundsViewModelProtocol {
    // MARK: - Properties
    
    var upcomingDraws: [DrawingModel] = []
    
    // MARK: - Methods
    
    func getDrawsCount() -> Int {
        return upcomingDraws.count
    }
    
    func getDrawsFor(indexPath: IndexPath) -> DrawingModel {
        return upcomingDraws[indexPath.row]
    }
    
    // MARK: - Web Services
    
    func getUpcomingDraws(completion: @escaping() -> ()) {
        APIManager.default.downloadUpcomingDraws { (draws) in
            self.upcomingDraws = draws
            completion()
        }
    }
}
