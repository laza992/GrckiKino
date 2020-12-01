//
//  BaseModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import Foundation

struct BaseModel: Codable {
    
    // MARK: - Properties
    
    let content: [DrawingModel]
    let totalPages: Int?
    let totalElements: Int?
    let last: Bool?
    let numberOfElements: Int?
    let first: Bool?
    let size: Int?
    let number: Int?

    // MARK: - Enums
    
    enum CodingKeys: String, CodingKey {

        case content = "content"
        case totalPages = "totalPages"
        case totalElements = "totalElements"
        case last = "last"
        case numberOfElements = "numberOfElements"
        case first = "first"
        case size = "size"
        case number = "number"
    }

    // MARK: - Init
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        content = try container.decode([DrawingModel].self, forKey: .content)
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        totalElements = try container.decodeIfPresent(Int.self, forKey: .totalElements)
        last = try container.decodeIfPresent(Bool.self, forKey: .last)
        numberOfElements = try container.decodeIfPresent(Int.self, forKey: .numberOfElements)
        first = try container.decodeIfPresent(Bool.self, forKey: .first)
        size = try container.decodeIfPresent(Int.self, forKey: .size)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
    }

}

