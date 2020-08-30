//
//  SplashViewVM.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

protocol SplashViewModelDelegate: class {
    func showError(message: String, title: String?)
}

class SplashViewModel {
    
    private let router: SplashRouterInterface
    private var firstTimeViewDidAppear = true
    private let app: AppDependencyContainerInterface
    
    private weak var delegate: SplashViewModelDelegate?
    
    init(delegate: SplashViewModelDelegate?,
         router: SplashRouterInterface,
         app: AppDependencyContainerInterface) {
        self.delegate = delegate
        self.router = router
        self.app = app
    }
    
    func viewDidAppear() {
        self.router.showFactoryView()
    }
}

extension SplashViewModel: SessionServiceDelegate {
}
