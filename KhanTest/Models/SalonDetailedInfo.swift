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
        case salon
        case location
    }
    
    enum SalonCodingKeys: CodingKey {
        case id
        case name
        case address
        case workStartTime
        case workEndTime
        case checkRating
        case pictures
        case phoneNumbers
        case location
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
    var location: Location? = nil
    
    private let workStartTime: Date
    private let workEndTime: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        
        let salonContainer = try container.nestedContainer(keyedBy: SalonCodingKeys.self, forKey: .salon)
        id = try salonContainer.decode(Int.self, forKey: .id)
        name = try salonContainer.decode(String.self, forKey: .name)
        address = try salonContainer.decode(String.self, forKey: .address)
        workStartTime = try salonContainer.decode(Date.self, forKey: .workStartTime)
        workEndTime = try salonContainer.decode(Date.self, forKey: .workEndTime)
        rating = try salonContainer.decode(Int.self, forKey: .checkRating)
        picturesUrls = try salonContainer.decode([String].self, forKey: .pictures)
        phoneNumbers = try salonContainer.decode([String].self, forKey: .phoneNumbers)
    }
    
}
