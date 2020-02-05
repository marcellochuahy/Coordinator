//
//  ViewController2A.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ViewController2A: UIViewController {

    weak var coordinator: Coordinator2?
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
extension ViewController2A {
    public class func instantiate() -> ViewController2A {
        let viewController = ViewController2A()
        viewController.title = "VC 2A"
        return viewController
    }
}

extension ViewController2A: ViewCodeProtocol {
    
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
        label.text = "Esta é a página VC 2A"
    }
    
}






