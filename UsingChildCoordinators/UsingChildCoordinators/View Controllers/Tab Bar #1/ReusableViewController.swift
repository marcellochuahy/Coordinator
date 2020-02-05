//
//  ViewController2A.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class ReusableViewController: UIViewController {

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
extension ReusableViewController {
    public class func instantiate(title: String, labelText: String) -> ReusableViewController {
        let viewController = ReusableViewController()
        viewController.title = title
        viewController.labelText = labelText
        return viewController
    }
}

extension ReusableViewController: ViewCodeProtocol {
    
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
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
    }
    
    func setupComplementaryConfiguration() {
        label.text = labelText
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
    }
    
}






