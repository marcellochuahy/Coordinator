//
//  VC1.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

//public protocol VC1NavigationDelegate: class {
//    func navigateFromVC1ToNextScene()
//}

class HomeViewController: UIViewController {
    
    weak var coordinator: MainCoordinator? // weak var delegate: VC1NavigationDelegate?
    
    private lazy var button1: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button2: UIButton = { return UIButton(frame: .zero)}()
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC1"
    }
    
    // MARK: - Actions
    
//    @objc private func button1WasPressed(_ sender: AnyObject) {
//        delegate?.navigateFromVC1ToNextScene()
//    }
    
    @objc func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @objc func createAccount(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

// MARK: - Constructors
extension HomeViewController {
    
//    public class func instantiate(delegate: VC1NavigationDelegate?) -> ViewController {
//        let viewController = ViewController()
//        viewController.delegate = delegate
//        viewController.title = "VC1"
//        return viewController
//    }
    
    public class func instantiate() -> HomeViewController {
        let viewController = HomeViewController()
        //viewController.delegate = delegate
        viewController.title = "VC1"
        return viewController
    }
    
}

extension HomeViewController: ViewCodeProtocol {
    
    private func setupView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        view.addSubview(button1)
        view.addSubview(button2)
    }
    
    func setupConstraints() {
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            button1.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -16),
            button1.heightAnchor.constraint(equalToConstant: 64),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button2.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 16),
            button2.heightAnchor.constraint(equalToConstant: 64),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
        ])
        
    }
    
    func setupComplementaryConfiguration() {
        
        button1.setTitle("Create Account", for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button1.titleLabel?.textColor = .white
        button1.backgroundColor = .green
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(createAccount(_:)), for: .touchUpInside)
        
        button2.setTitle("Buy", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button2.titleLabel?.textColor = .white
        button2.backgroundColor = .red
        button2.layer.cornerRadius = 8
        button2.addTarget(self, action: #selector(buyTapped(_:)), for: .touchUpInside)
        
    }
    
}


