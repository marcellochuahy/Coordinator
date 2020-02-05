//
//  MainTabBarController.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let main = MainCoordinator(navigationController: UINavigationController())
    let main2 = MainCoordinator2(navigationController: UINavigationController())
    
//    let tab1 = HomeViewController()
//    let tab2 = HomeViewControllerForTab2()
    // ...
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        guard let tab1NavigationController = tab1.navigationController,
//              let tab2NavigationController = tab2.navigationController
//              // ...
//              else { return }
        
        main.start()
        main2.start()
        
        viewControllers = [main.navigationController, main2.navigationController]

    }
    
}
