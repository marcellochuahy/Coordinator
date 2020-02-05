//
//  MainCoordinator2.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 05/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class MainCoordinator2: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewControllerForTab2.instantiate()
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
        navigationController.delegate = self
    }
    
    /*
    func startNavigationFlow1() {
        let child = Coordinator1(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func startNavigationFlow2() {
        let child = Coordinator2(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func startNavigationFlow3() {
        let child = Coordinator3(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    */
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}

extension MainCoordinator2: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        //
        // Completar se necessário:
        //
        /*
        if let viewController = fromViewController as? ViewController1A {
            childDidFinish(viewController.coordinator)
        }
        
        if let viewController = fromViewController as? ViewController2A {
            childDidFinish(viewController.coordinator)
        }
        */
        
    }
    
}
