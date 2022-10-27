//
//  AppDelegate.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window!)
        appCoordinator.start()
        return true
    }
    
}

