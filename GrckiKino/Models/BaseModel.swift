//
//  BaseModel.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import Foundation

struct Json4Swift_Base : Codable {
    let content : [DrawingModel]?

    enum CodingKeys: String, CodingKey {

        case content = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        content = try values.decodeIfPresent([DrawingModel].self, forKey: .content)
    }

}
