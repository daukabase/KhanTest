//
//  SalonDetailedInfo.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

struct SalonDetailedInfo: Decodable {
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case address
        case workStartTime
        case workEndTime
        case checkRating
        case pictures
        case phoneNumbers
    }
    
    var worktime: String {
        return "\(workStartTime.string(with: .HHmm)) - \(workEndTime.string(with: .HHmm))"
    }
    var addressText: String? {
        return address.htmlStyled?.string
    }
    let id: Int
    let name: String
    let address: String
    let rating: Int
    let picturesUrls: [String]
    let phoneNumbers: [String]
    private let workStartTime: Date
    private let workEndTime: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        workStartTime = try container.decode(Date.self, forKey: .workStartTime)
        workEndTime = try container.decode(Date.self, forKey: .workEndTime)
        rating = try container.decode(Int.self, forKey: .checkRating)
        picturesUrls = try container.decode([String].self, forKey: .pictures)
        phoneNumbers = try container.decode([String].self, forKey: .phoneNumbers)
    }
    
}
