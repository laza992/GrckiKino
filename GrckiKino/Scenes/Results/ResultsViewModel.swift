//
//  ResultsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import Foundation

protocol ResultsViewModelProtocol {
    func getDrawsCount() -> Int
    func getDrawsFor(indexPath: IndexPath) -> DrawingModel
    func getResults(completion: @escaping() -> ())
}

final class ResultsViewModel: ResultsViewModelProtocol {
    
    // MARK: - Properties
    
    var drawModel: [DrawingModel] = []
    let today = Calendar.current.startOfDay(for: Date())
    
    // MARK: - Methods
    
    func getDrawsCount() -> Int {
        return drawModel.count
    }
    
    func getDrawsFor(indexPath: IndexPath) -> DrawingModel {
        return drawModel[indexPath.row]
    }
    
    // MARK: - Web Services
    
    func getResults(completion: @escaping() -> ()) {
        let todayString = Constants.dateFormatter.string(from: today)
        
        APIManager.default.downloadResults(date: todayString) { (draw) in
            self.drawModel = draw
            completion()
        }
    }
}
