//
//  HomeViewModel.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

protocol FactoryViewModelDelegate: class {
    
}

class FactoryViewModel {
    
    private let router: FactoryRouterInterface
    private var firstTimeViewDidAppear = true
    private let app: AppDependencyContainerInterface
    
    private weak var delegate: FactoryViewModelDelegate?
    
    init(delegate: FactoryViewModelDelegate?,
         router: FactoryRouterInterface,
         app: AppDependencyContainerInterface) {
        self.delegate = delegate
        self.router = router
        self.app = app
    }
    
    func viewDidAppear() {
    }
    
    func getFactoryList() {
        
    }
}
