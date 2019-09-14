//
//  UIStoryboard.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit

extension UIStoryboard {

    /// Instant Initial View Controller of the same storyboard name
    static func instantiate<ViewController: UIViewController>(ofType: ViewController.Type) -> ViewController? {
        let storyboard = UIStoryboard(name: String(describing: ViewController.self), bundle: Bundle.main)
        return storyboard.instantiateInitialViewController() as? ViewController
    }

}
