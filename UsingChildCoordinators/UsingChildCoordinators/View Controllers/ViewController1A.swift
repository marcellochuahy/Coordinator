//
//  VC3.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewController001A: UIViewController {
    
    weak var coordinator: Coordinator001?
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

extension ViewController001A {
    public class func instantiate() -> ViewController002A {
        let viewController = ViewController002A()
        viewController.title = "VC001A"
        return viewController
    }
}

extension ViewController001A: ViewCodeProtocol {
    
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
        label.text = "Está é a página CREATE ACCOUNT"
    }
    
}


