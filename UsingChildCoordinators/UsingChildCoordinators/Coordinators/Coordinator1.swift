//
//  Coordinator1.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class Coordinator1: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ViewController1A.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func send(id: String) {
        navigateToDetailVC(withID: id)
    }
    
    public func navigateToDetailVC(withID id: String) {
        
        let viewController = ViewController1B.instantiate(id: id)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

}
