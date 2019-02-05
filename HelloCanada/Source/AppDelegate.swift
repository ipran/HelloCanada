//
//  AppDelegate.swift
//  HelloCanada
//
//  Created by Pranil on 2/2/19.
//  Copyright © 2019 pranil. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Prepare Window
        window = UIWindow(frame: UIScreen.main.bounds)
        // Prepare Initial Controller
        let homeViewController = HomeViewController()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [homeViewController]
        // Present
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

