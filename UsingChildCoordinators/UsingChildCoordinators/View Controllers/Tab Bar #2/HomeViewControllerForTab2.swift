//
//  HomeViewControllerForTab2.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 05/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

//public protocol VC1NavigationDelegate: class {
//    func navigateFromVC1ToNextScene()
//}

class HomeViewControllerForTab2: UIViewController {
    
    weak var coordinator: MainCoordinator2?
    
    private lazy var label: UILabel = { return UILabel(frame: .zero)}()
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Constructors
extension HomeViewControllerForTab2 {
    
    public class func instantiate() -> HomeViewControllerForTab2 {
        let viewController = HomeViewControllerForTab2()
        viewController.title = "OTHER SCENE"
        return viewController
    }
    
}

extension HomeViewControllerForTab2: ViewCodeProtocol {
    
    private func setupView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        view.addSubview(label)
    }
    
    func setupConstraints() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    func setupComplementaryConfiguration() {
        
        label.text = "OTHER SCENE"
        
    }
    
}
