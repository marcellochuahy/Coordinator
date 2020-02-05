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
    
    weak var coordinator: MainCoordinator?
    
    private lazy var button1: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button2: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button3: UIButton = { return UIButton(frame: .zero)}()
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc func button1WasTapped(_ sender: Any) {
        coordinator?.startNavigationFlow1()
    }
    
    @objc func button2WasTapped(_ sender: Any) {
        coordinator?.startNavigationFlow2()
    }
    
    @objc func button3WasTapped(_ sender: Any) {
        coordinator?.startNavigationFlow3()
    }
 
}

// MARK: - Constructors
extension HomeViewController {

    public class func instantiate() -> HomeViewController {
        let viewController = HomeViewController()
        viewController.title = "Dashboard"
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
        view.addSubview(button3)
    }
    
    func setupConstraints() {
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -16),
            button1.heightAnchor.constraint(equalToConstant: 64),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button2.heightAnchor.constraint(equalToConstant: 64),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 16),
            button3.heightAnchor.constraint(equalToConstant: 64),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
        ])
        
    }
    
    func setupComplementaryConfiguration() {
        
        button1.setTitle("Pagamentos A VENCER >", for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button1.titleLabel?.textColor = .white
        button1.backgroundColor = .red
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(button1WasTapped(_:)), for: .touchUpInside)
        
        button2.setTitle("Pagamentos a VENCIDOS >", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button2.titleLabel?.textColor = .white
        button2.backgroundColor = .green
        button2.layer.cornerRadius = 8
        button2.addTarget(self, action: #selector(button2WasTapped(_:)), for: .touchUpInside)
        
        button3.setTitle("Pagamentos EXCLUÍDOS >", for: .normal)
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button3.titleLabel?.textColor = .white
        button3.backgroundColor = .blue
        button3.layer.cornerRadius = 8
        button3.addTarget(self, action: #selector(button3WasTapped(_:)), for: .touchUpInside)
        
    }
    
}


