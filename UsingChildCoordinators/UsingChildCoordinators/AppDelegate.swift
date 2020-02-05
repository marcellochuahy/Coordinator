//
//  AppDelegate.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // ⚠️ Descomentar caso não esteja usando Tab Bar Navigation
    // var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        setupForTabBarController()
        return true
    }
    
}

extension AppDelegate {
    
    func setupForNavigationViewController() {
        
        // ⚠️ Descomentar caso não esteja usando Tab Bar Navigation
        // let navController = UINavigationController()
        // coordinator = MainCoordinator(navigationController: navController)
        // coordinator?.start()
        // window = UIWindow(frame: UIScreen.main.bounds)
        // window?.rootViewController = navController
        // window?.makeKeyAndVisible()
        
    }
    
    func setupForTabBarController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
    }
    
}
