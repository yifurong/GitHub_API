//
//  AppDelegate.swift
//  GitHub API
//
//  Created by YIFU RONG on 7/23/19.
//  Copyright © 2019 Yifu Rong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        
        return true
    }
    
}

