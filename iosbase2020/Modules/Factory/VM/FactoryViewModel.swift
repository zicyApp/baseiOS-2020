//
//  HomeViewModel.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

protocol FactoryViewModelDelegate: class {
    func onDataLoadSuccess()
    func onDataLoadError()
}

class FactoryViewModel {
    
    private let router: FactoryRouterInterface
    private var firstTimeViewDidAppear = true
    private let app: AppDependencyContainerInterface
    
    private weak var delegate: FactoryViewModelDelegate?
    private var maxCount = 0
    private var lastOffset = 0
    var factories = [Factory]()
    
    init(delegate: FactoryViewModelDelegate?,
         router: FactoryRouterInterface,
         app: AppDependencyContainerInterface) {
        self.delegate = delegate
        self.router = router
        self.app = app
    }
    
    func viewDidAppear() {
    }
    
    func fetchList(isReset: Bool) {
        let request = GetFactoryListRequest()
        self.app.getFactoryService().getFactories(request: request) { result in
            switch(result) {
                case .success(let response):
                    self.maxCount = response.count ?? 10
                    if (isReset) {
                        self.lastOffset = 0
                        self.factories = response.results ?? [Factory]()
                    } else {
                        self.factories.append(contentsOf: response.results ?? [Factory]())
                    }
                    self.delegate?.onDataLoadSuccess()
                case .error(let error):
                    self.delegate?.onDataLoadError()
            }
        }
    }
    
    func fetchMore() {
        if !(self.factories.count >= self.maxCount) {
            var request = GetFactoryListRequest()
            self.lastOffset += 10
            request.offset = self.lastOffset
            self.app.getFactoryService().getFactories(request: request) { result in
                switch(result) {
                    case .success(let response):
                        self.factories.append(contentsOf: response.results ?? [Factory]())
                        self.delegate?.onDataLoadSuccess()
                    case .error(let error):
                        self.delegate?.onDataLoadError()
                }
            }
        }
    }
}
