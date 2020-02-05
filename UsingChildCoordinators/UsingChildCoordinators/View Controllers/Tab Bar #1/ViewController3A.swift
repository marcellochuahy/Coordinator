//
//  File.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewController3A: UIViewController {
    
    weak var coordinator: Coordinator3?
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
extension ViewController3A {
    public class func instantiate() -> ViewController3A {
        let viewController = ViewController3A()
        viewController.title = "VC 3A"
        return viewController
    }
}

extension ViewController3A: ViewCodeProtocol {
    
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
        label.text = "Esta é a página VC 3A"
    }
    
}







