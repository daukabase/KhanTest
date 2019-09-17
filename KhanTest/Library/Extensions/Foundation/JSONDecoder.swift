//
//  JSONDecode.swift
//  KhanTest
//
//  Created by Daulet on 17/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

extension JSONDecoder {
    
    convenience init(formatter: DateFormatter) {
        self.init()
        dateDecodingStrategy = .formatted(formatter)
    }
    
}
