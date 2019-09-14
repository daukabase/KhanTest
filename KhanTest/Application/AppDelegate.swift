//
//  AppDelegate.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import UIKit
import YandexMapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let apiKey = "64a0d2b1-8f40-4fdb-8e16-72b48f255e49"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = UINavigationController(rootViewController: SalonsViewController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = initialViewController
        YMKMapKit.setApiKey(apiKey)
        
        return true
    }
}

