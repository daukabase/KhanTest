//
//  Date.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

extension Date {
    
    func string(with formatter: DateFormatter) -> String {
        return formatter.string(from: self)
    }
    
}
