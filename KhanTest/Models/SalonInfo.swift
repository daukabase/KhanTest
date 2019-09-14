//
//  SalonInfo.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

struct SalonInfo: Decodable {
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case checkRating
        case pictureUrl
    }
    
    let id: Int
    let name: String
    let rating: Int
    let pictureUrl: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        rating = try container.decode(Int.self, forKey: .checkRating)
        pictureUrl = try container.decodeIfPresent(String.self, forKey: .pictureUrl)
    }
    
}
