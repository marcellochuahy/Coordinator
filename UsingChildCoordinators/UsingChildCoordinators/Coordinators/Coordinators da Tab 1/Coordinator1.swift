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
        let viewController = ViewController1A.instantiate(delegate: self)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

}


extension Coordinator1: ViewController1ADelegate {

    func send(id: String) {
        navigateToDetailVC(withID: id)
    }
    
    private func navigateToDetailVC(withID id: String) {
        let viewController = ViewController1B.instantiate(id: id)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    

    
    
    
    
}
