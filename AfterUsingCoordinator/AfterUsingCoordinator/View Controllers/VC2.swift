//
//  VC2.swift
//  AfterUsingCoordinator
//
//  Created by Marcello Chuahy on 02/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

public protocol VC2NavigationDelegate: class {
    func navigateFromVC2ToNextScene(currentViewController: UIViewController)
    func navigateFromVC2ToPreviousScene(currentViewController: UIViewController)
}

class VC2: UIViewController {
    
    weak var delegate: VC2NavigationDelegate?
    
    private var button1: UIButton!
    private var button2: UIButton!
    
    private var buttonText: String!
    
    override func loadView() {
        setupView()
        setupButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = title
    }
    
    private func setupView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }
    
    private func setupButtons() {
        
        button1 = UIButton()
        button2 = UIButton()
        
        view.addSubview(button1)
        view.addSubview(button2)
        
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
        
        button1.setTitle(buttonText, for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button1.titleLabel?.textColor = .white
        button1.backgroundColor = .green
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(button1WasPressed(_:)), for: .touchUpInside)
        
        button2.setTitle("◀️ popViewController", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button2.titleLabel?.textColor = .white
        button2.backgroundColor = .red
        button2.layer.cornerRadius = 8
        button2.addTarget(self, action: #selector(button2WasPressed(_:)), for: .touchUpInside)
        
    }
    
    // MARK: - Actions
    
    @objc private func button1WasPressed(_ sender: AnyObject) {
        delegate?.navigateFromVC2ToNextScene(currentViewController: self)
    }
    
    @objc private func button2WasPressed(_ sender: AnyObject) {
        delegate?.navigateFromVC2ToPreviousScene(currentViewController: self)
    }
    
}

// MARK: - Constructors
extension VC2 {
    
    public class func instantiate(delegate: VC2NavigationDelegate?, title: String, labelText: String, buttonText: String) -> VC2 {
        let viewController = VC2()
        viewController.delegate = delegate
        viewController.title = title
        viewController.buttonText = buttonText
        return viewController
    }
}



