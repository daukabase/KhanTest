//
//  Constants.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

// TODO: make api encrypted https

enum URLs {
    static let salonURL = "http://zp.jgroup.kz/rest/v1/salon/"
    static let mainURL = "http://zp.jgroup.kz/"
    
    static var main: URL? {
        return URL(string: mainURL)
    }
    
    static var salon: URL? {
        return URL(string: salonURL)
    }
}

typealias JSON = [String: Any]
