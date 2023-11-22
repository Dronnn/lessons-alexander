//
//  AppDelegate.swift
//  alex-money
//
//  Created by andrew mayer on 07.11.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow()
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()

        return true
    }

}

