//
//  VC3.swift
//  AfterUsingCoordinator
//
//  Created by Marcello Chuahy on 02/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

public protocol VC3NavigationDelegate: class {
    func navigateFromVC3ToPreviousScene(currentViewController: UIViewController)
    func navigateFromVC3ToFirstScene(currentViewController: UIViewController)
}

class VC3: UIViewController {
    
    weak var delegate: VC3NavigationDelegate?
    private lazy var button1: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button2: UIButton = { return UIButton(frame: .zero)}()
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC3"
    }
 
    // MARK: - Actions
    
    @objc private func button1WasPressed(_ sender: AnyObject) {
        delegate?.navigateFromVC3ToPreviousScene(currentViewController: self)
    }
    
    @objc private func button2WasPressed(_ sender: AnyObject) {
        delegate?.navigateFromVC3ToFirstScene(currentViewController: self)
    }
    
}

// MARK: - Constructors
extension VC3 {
    
    public class func instantiate(delegate: VC3NavigationDelegate?) -> VC3 {
        let viewController = VC3()
        viewController.delegate = delegate
        viewController.title = "VC3"
        return viewController
    }
}

extension VC3: ViewCodeProtocol {
    
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
        
        button1.setTitle("◀️ popViewController", for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button1.titleLabel?.textColor = .white
        button1.backgroundColor = .red
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(button1WasPressed(_:)), for: .touchUpInside)
        
        button2.setTitle("⏪ popToRootViewController", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button2.titleLabel?.textColor = .white
        button2.backgroundColor = .red
        button2.layer.cornerRadius = 8
        button2.addTarget(self, action: #selector(button2WasPressed(_:)), for: .touchUpInside)
        
    }
    
}


