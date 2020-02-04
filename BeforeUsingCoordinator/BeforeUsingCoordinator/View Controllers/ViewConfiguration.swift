//
//  ViewConfiguration.swift
//  BeforeUsingCoordinator
//
//  Created by Marcello Chuahy on 04/02/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

protocol ViewConfiguration: class {
    
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    
    // Chama os métodos acima na ordem pré-fixada
    func setupViewConfiguration()
}

extension ViewConfiguration {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
//    func configureViews() {
//    }
    
}
