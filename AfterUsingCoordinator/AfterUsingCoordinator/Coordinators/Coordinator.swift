//
//  Coordinator.swift
//  AfterUsingCoordinator
//
//  Created by Marcello Chuahy on 02/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit
public protocol Coordinator: class {

    // All coordinators must be initialized with a navigation controller
    init(navigationController: UINavigationController)

    func makeRootViewController()

}
