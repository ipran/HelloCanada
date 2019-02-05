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

        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let homeViewController = HomeViewController()
        navigationController.viewControllers = [homeViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    /**
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    **/

}

