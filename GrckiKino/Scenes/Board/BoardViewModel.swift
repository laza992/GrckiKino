//
//  BoardViewModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import Foundation

protocol BoardViewModelProtocol {
    var drawModel: DrawingModel? { get set }
    var selectedNumber: Int { get set }
    var selectedNumbers: [Int] { get set }
    var selectionNumberArray: [Int] { get set }
    
    func getDraw(completion: @escaping() -> ())
    
    func getNumbersCount() -> Int
    func getNumberFor(row: Int) -> Int
    
    func getOddsCount() -> Int
    func getOddFor(indexPath: IndexPath) -> String
    
    func getSelectionNumbersCount() -> Int
    func getSelectionNumberFor(indexPath: IndexPath) -> Int
}

final class BoardViewModel: BoardViewModelProtocol {
    
    // MARK: - Properties
    
    var drawModel: DrawingModel?
    var drawID: Int
    var numberArray = [Int](1...15)
    var selectionNumberArray: [Int] = [Int](1...80)
    var selectedNumber: Int = 1
    var selectedNumbers: [Int] = []
    var oddsArray = Constants.oddsArray
    
    // MARK: - Init
    
    init(_ drawID: Int) {
        self.drawID = drawID
    }
    
    // MARK: - Methods
    
    func getNumbersCount() -> Int {
        return numberArray.count
    }
    
    func getNumberFor(row: Int) -> Int {
        return numberArray[row]
    }
    
    func getSelectionNumbersCount() -> Int {
        return selectionNumberArray.count
    }
    
    func getSelectionNumberFor(indexPath: IndexPath) -> Int {
        return selectionNumberArray[indexPath.row]
    }
    
    func getOddsCount() -> Int {
        return oddsArray.count
    }
    
    func getOddFor(indexPath: IndexPath) -> String {
        return "\(oddsArray[indexPath.row])"
    }
    
    // MARK: - Web Services
    
    func getDraw(completion: @escaping() -> ()) {
        APIManager.default.downloadDraw(drawID: drawID) { (draw) in
            self.drawModel = draw
            completion()
        }
    }
}
