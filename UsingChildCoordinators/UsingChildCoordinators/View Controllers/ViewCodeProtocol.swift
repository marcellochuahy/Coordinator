//
//  ViewCodeProtocol.swift
//  UsingChildCoordinators
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

protocol ViewCodeProtocol: class {
    
    func buildViewHierarchy()
    func setupConstraints()
    func setupComplementaryConfiguration()
    
    func callsMethodsInPreSetOrder()
    
}

extension ViewCodeProtocol {
    
    func callsMethodsInPreSetOrder() {
        buildViewHierarchy()
        setupConstraints()
        setupComplementaryConfiguration()
    }
    
}

