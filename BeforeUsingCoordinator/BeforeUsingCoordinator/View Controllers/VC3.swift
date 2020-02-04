//
//  VC3.swift
//  BeforeUsingCoordinator
//
//  Created by Marcello Chuahy on 02/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class VC3: UIViewController {
    
    private var button1: UIButton!
    private var button2: UIButton!
    
    override func loadView() {
        setupView()
        setupButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC3"
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

    // MARK: - Actions
    
    @objc private func button1WasPressed(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func button2WasPressed(_ sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
