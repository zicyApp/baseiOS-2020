//
//  FactoryDetailsViewModel.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

protocol FactoryDetailsViewModelDelegate: class {
}

class FactoryDetailsViewModel {
    
    private let router: FactoryDetailsRouterInterface
    private var firstTimeViewDidAppear = true
    private let app: AppDependencyContainerInterface
    
    private weak var delegate: FactoryDetailsViewModelDelegate?
    
    init(delegate: FactoryDetailsViewModelDelegate?,
         router: FactoryDetailsRouterInterface,
         app: AppDependencyContainerInterface) {
        self.delegate = delegate
        self.router = router
        self.app = app
    }
    
    func viewDidAppear() {
        
    }
}
