//
//  AppDelegate.swift
//  GolfZone
//
//  Created by Dang Nguyen on 21/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        UserListRouter().showScreen()
        return true
    }
}

