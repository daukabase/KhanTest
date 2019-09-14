//
//  UIColor+.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let blackText = "262626".hexColor
    static let purple = "AB1F73".hexColor
    static let grayText = "999999".hexColor
    static let grayBackground = "46433D".hexColor
    
    static var randomColor: UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 0.5)
    }
    
}
