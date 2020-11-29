//
//  WinningNumbersModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import Foundation

struct WinningNumbers: Codable {
    
    // MARK: - Properties
    
    var list : [Int]?
    var bonus : [Int]?
    
    // MARK: - Enums
    
    enum CodingKeys: String, CodingKey {
        case list
        case bonus
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        list = try values.decodeIfPresent([Int].self, forKey: .list)
        bonus = try values.decodeIfPresent([Int].self, forKey: .bonus)
    }
}

