//
//  ViewController1B.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewController1B: UIViewController {
    
    weak var coordinator: Coordinator1?
    private lazy var label: UILabel = { return UILabel(frame: .zero)}()
    private var labelText: String?
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Constructors

extension ViewController1B {
    public class func instantiate(id: String) -> ViewController1B {
        let viewController = ViewController1B()
        viewController.title = id
        viewController.labelText = id
        return viewController
    }
}

extension ViewController1B: ViewCodeProtocol {
    
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
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func setupComplementaryConfiguration() {
        
        label.text = labelText ?? "Ups. Algo deu errado."
        
    }
    
}



