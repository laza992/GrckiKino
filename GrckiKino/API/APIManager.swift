//
//  APIManager.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import Foundation

class APIManager {
    
    // MARK: - Properties
    
    static let `default` = APIManager()
    
    // MARK: - Methods
    
    func downloadUpcomingDraws(completion: @escaping([DrawingModel]) -> ()) {
        URLSession.shared.dataTask(with: Constants.upcomingURL) { (data , urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Error")
                return
            }
            print("Downloaded")
            
            do {
                let decoder = JSONDecoder()
                let drawingModel = try decoder.decode([DrawingModel].self, from: data)
                completion(drawingModel.sorted(by: { $0.drawTime < $1.drawTime }))
            } catch {
                print("Download Error")
                completion([])
            }
        }.resume()
    }
    
    func downloadDraw(drawID: Int, completion: @escaping(DrawingModel?) -> ()) {
        URLSession.shared.dataTask(with: Constants.getUpcomingDraw(drawID)) { (data , urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Error")
                return
            }
            print("Downloaded")
            
            do {
                let decoder = JSONDecoder()
                let drawingModel = try decoder.decode(DrawingModel.self, from: data)
                completion(drawingModel)
            } catch {
                print("Download Error")
                completion(nil)
            }
        }.resume()
    }
    
    func downloadResults(date: String, completion: @escaping([DrawingModel]) -> ()) {
        URLSession.shared.dataTask(with: Constants.getResultsFor(date)) { (data , urlResponse, error) in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Error")
                return
            }
            print("Downloaded")
            do {
                let decoder = JSONDecoder()
                let drawingModel = try decoder.decode([String: DrawingModel].self, from: data)
                completion(drawingModel.compactMap({ $0.value }))
            } catch {
                print("Download Error")
                completion([])
            }
        }.resume()
    }
}
