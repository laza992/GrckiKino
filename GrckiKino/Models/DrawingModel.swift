//
//  DrawingModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import Foundation

class DrawingModel: Codable {
    
    // MARK: - Properties
    
    var gameId: Int
    var drawId: Int
    var drawTime: Date
    var drawBreak: Int
    var visualDraw: Int
    var winningNumbers: WinningNumbers?
    
    // MARK: - Enums
    
    enum CodingKeys: String, CodingKey {
        case gameId
        case drawId
        case drawTime
        case drawBreak
        case visualDraw
        case winningNumbers
    }
    
    // MARK: - Init
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        gameId = try container.decode(Int.self, forKey: .gameId)
        drawId = try container.decode(Int.self, forKey: .drawId)
        let timeInterval = try container.decode(TimeInterval.self, forKey: .drawTime)
        drawTime = Date(timeIntervalSince1970: timeInterval)
        visualDraw = try container.decode(Int.self, forKey: .visualDraw)
        drawBreak = try container.decode(Int.self, forKey: .drawBreak)
        winningNumbers = try container.decodeIfPresent(WinningNumbers.self, forKey: .winningNumbers)
    }
}
