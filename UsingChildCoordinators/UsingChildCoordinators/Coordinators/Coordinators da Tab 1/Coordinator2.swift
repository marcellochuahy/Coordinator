//
//  Coordinator2.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class Coordinator2: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ReusableViewController.instantiate(title: "Pagamentos Vencidos", labelText: "Por simplicidade, não foi criado um fluxo de navegação a partir dessa scene. Para verificar um exemplo com fluxo de navegação volte e escolha a opção \"Pagamentos A Vencer\"")
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
