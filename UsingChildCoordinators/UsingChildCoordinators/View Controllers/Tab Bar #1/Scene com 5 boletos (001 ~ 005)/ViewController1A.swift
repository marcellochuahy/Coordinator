//
//  ViewController1A.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

protocol ViewController1ADelegate: class {
    func send(id: String)
}

class ViewController1A: UIViewController {
    
    weak var coordinator: ViewController1ADelegate?
    
    var safeArea: UILayoutGuide!
    private lazy var label: UILabel = { return UILabel(frame: .zero)}()
    private lazy var button1: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button2: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button3: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button4: UIButton = { return UIButton(frame: .zero)}()
    private lazy var button5: UIButton = { return UIButton(frame: .zero)}()
    
    override func loadView() {
        setupView()
        callsMethodsInPreSetOrder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc func button1WasTapped(_ sender: Any) { coordinator?.send(id: "Boleto 001") }
    @objc func button2WasTapped(_ sender: Any) { coordinator?.send(id: "Boleto 002") }
    @objc func button3WasTapped(_ sender: Any) { coordinator?.send(id: "Boleto 003") }
    @objc func button4WasTapped(_ sender: Any) { coordinator?.send(id: "Boleto 004") }
    @objc func button5WasTapped(_ sender: Any) { coordinator?.send(id: "Boleto 005") }
  
}

// MARK: - Constructors

extension ViewController1A {
    public class func instantiate(delegate: ViewController1ADelegate?) -> ViewController1A {
        let viewController = ViewController1A()
        viewController.coordinator = delegate
        viewController.title = "Lista de Pagamentos"
        return viewController
    }
}

extension ViewController1A: ViewCodeProtocol {
    
    private func setupView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }
    
    func buildViewHierarchy() {
        view.addSubview(label)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
    }
    
    func setupConstraints() {
        
        safeArea = self.view.layoutMarginsGuide
        
        label.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        button5.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 32),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            button1.heightAnchor.constraint(equalToConstant: 44),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 8),
            button2.heightAnchor.constraint(equalToConstant: 44),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 8),
            button3.heightAnchor.constraint(equalToConstant: 44),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 8),
            button4.heightAnchor.constraint(equalToConstant: 44),
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 8),
            button5.heightAnchor.constraint(equalToConstant: 44),
            button5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)

        ])
        
    }
    
    func setupComplementaryConfiguration() {
        
        label.text = "Selecione um pagamento"
        
        button1.setTitle("Boleto 001", for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button1.titleLabel?.textColor = .black
        button1.backgroundColor = .lightGray
        button1.layer.cornerRadius = 8
        button1.addTarget(self, action: #selector(button1WasTapped(_:)), for: .touchUpInside)
        
        button2.setTitle("Boleto 002", for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button2.titleLabel?.textColor = .black
        button2.backgroundColor = .lightGray
        button2.layer.cornerRadius = 8
        button2.addTarget(self, action: #selector(button2WasTapped(_:)), for: .touchUpInside)
        
        button3.setTitle("Boleto 003", for: .normal)
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button3.titleLabel?.textColor = .black
        button3.backgroundColor = .lightGray
        button3.layer.cornerRadius = 8
        button3.addTarget(self, action: #selector(button3WasTapped(_:)), for: .touchUpInside)
        
        button4.setTitle("Boleto 004", for: .normal)
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button4.titleLabel?.textColor = .black
        button4.backgroundColor = .lightGray
        button4.layer.cornerRadius = 8
        button4.addTarget(self, action: #selector(button4WasTapped(_:)), for: .touchUpInside)
        
        button5.setTitle("Boleto 005", for: .normal)
        button5.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button5.titleLabel?.textColor = .black
        button5.backgroundColor = .lightGray
        button5.layer.cornerRadius = 8
        button5.addTarget(self, action: #selector(button5WasTapped(_:)), for: .touchUpInside)
 
    }
    
}


