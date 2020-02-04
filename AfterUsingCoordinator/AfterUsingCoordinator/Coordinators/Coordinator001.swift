//
//  AppDelegateCoordinator.swift
//  AfterUsingCoordinator
//
//  Created by Marcello Chuahy on 02/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

public class Coordinator001: Coordinator {

    unowned let navigationController: UINavigationController
    
    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Instance Properties - ViewControllers

    private lazy var vc1 = VC1.instantiate(delegate: self)
    
    private lazy var vc2s = [
        VC2.instantiate(delegate: self, title: "VC2 A", labelText: "🟠🔵🔵🔵", buttonText: "▶️ pushViewController VC2-B"),
        VC2.instantiate(delegate: self, title: "VC2 B", labelText: "🔵🟠🔵🔵", buttonText: "▶️ pushViewController VC2-C"),
        VC2.instantiate(delegate: self, title: "VC2 C", labelText: "🔵🔵🟠🔵", buttonText: "▶️ pushViewController VC2-D"),
        VC2.instantiate(delegate: self, title: "VC2 D", labelText: "🔵🔵🔵🟠", buttonText: "▶️ pushViewController VC3")
    ]
    
    private lazy var vc3 = VC3.instantiate(delegate: self)

    // MARK: - Methods
    public func start() {
        self.navigationController.viewControllers = [vc1]
    }

}

// MARK: - VC1Delegate
extension Coordinator001: VC1NavigationDelegate {
    
    public func navigateFromVC1ToNextScene() {
        let nextViewController = vc2s.first!
        navigationController.pushViewController(nextViewController, animated: true)
    }
    
}

// MARK: - VC2Delegate
extension Coordinator001: VC2NavigationDelegate {
    
    public func navigateFromVC2ToNextScene(currentViewController: UIViewController) {
        
        if let nextViewController = checkIfNextViewControllerIsThereAt(viewControllers: vc2s, currentViewController: currentViewController) {
            navigationController.pushViewController(nextViewController, animated: true)
        }
        else {
            navigationController.pushViewController(vc3, animated: true)
        }
        
    }

    public func navigateFromVC2ToPreviousScene(currentViewController: UIViewController) {
        navigationController.popViewController(animated: true)
    }
    
    func checkIfNextViewControllerIsThereAt(viewControllers: [UIViewController], currentViewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(where: { $0 === currentViewController }), index < viewControllers.count - 1 else {
            return nil
        }
        return viewControllers[index + 1]
    }

}

extension Coordinator001: VC3NavigationDelegate {
    
    public func navigateFromVC3ToPreviousScene(currentViewController: UIViewController) {
        navigationController.popViewController(animated: true)
    }
    
    public func navigateFromVC3ToFirstScene(currentViewController: UIViewController) {
        navigationController.popToRootViewController(animated: true)
    }
    
}
