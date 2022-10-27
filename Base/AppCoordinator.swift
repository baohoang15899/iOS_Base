//
//  AppCoordinator.swift
//  Base
//
//  Created by BaoHoang on 14/10/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private var exampleCoordinator: HomeCoordinator?
    private let navigationController: UINavigationController
   
    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        self.exampleCoordinator = HomeCoordinator(navigator: navigationController)
        self.navigationController = navigationController
    }
    
    func start() {
        window.rootViewController = self.navigationController
        exampleCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
