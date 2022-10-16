//
//  AppDelegate.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController(rootViewController: ListViewController())
        self.window?.rootViewController = nav1
        self.window?.makeKeyAndVisible()

        return true
    }

}

