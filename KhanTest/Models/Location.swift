//
//  Location.swift
//  KhanTest
//
//  Created by Daulet on 18/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

struct Location: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case zoom
        case centerX
        case centerY
    }
    
    let longitude: Double
    let latitude: Double
    let zoom: Float
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        longitude = try container.decode(Double.self, forKey: .centerX)
        latitude = try container.decode(Double.self, forKey: .centerY)
        zoom = try container.decode(Float.self, forKey: .zoom)
    }
    
}
