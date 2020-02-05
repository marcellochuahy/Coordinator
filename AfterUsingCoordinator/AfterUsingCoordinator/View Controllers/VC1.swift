//
//  VC1.swift
//  AfterUsingCoordinator
//
//  Created by Marcello Chuahy on 02/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

public protocol VC1NavigationDelegate: class {
    func navigateFromVC1ToNextScene()
}

class VC1: UIViewController {
    
    weak var delegate: VC1NavigationDelegate?
    
    private lazy var button1: UIButton = { return UIButton(frame: .zero)}()
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC1"
    }
    
    // MARK: - Actions
    
    @objc private func button1WasPressed(_ sender: AnyObject) {
        delegate?.navigateFromVC1ToNextScene()
    }
    
}

// MARK: - Constructors
extension VC1 {
    public class func instantiate(delegate: VC1NavigationDelegate?) -> VC1 {
        let viewController = VC1()
        viewController.delegate = delegate
        viewController.title = "VC1"
        return viewController
    }
}

extension VC1: ViewCodeProtocol {
    
    private func setupView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        view.addSubview(button1)
    }
    
    func setupConstraints() {
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button1.heightAnchor.constraint(equalToConstant: 64),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
    }
    
    func setupComplementaryConfiguration() {

        button1.setTitle("▶️ pushViewController VC2-A", for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button1.titleLabel?.textColor = .white
        button1.backgroundColor = .green
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(button1WasPressed(_:)), for: .touchUpInside)
        
    }
    
}

