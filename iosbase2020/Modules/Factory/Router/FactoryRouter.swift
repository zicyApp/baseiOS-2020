//
//  HomeRouter.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

protocol FactoryRouterInterface: class {
    func showDetailsView(factory: Factory?)
}

class FactoryRouter: FactoryRouterInterface {
    
    private struct Const {
        static let factoryStoryboard = "Factory"
        static let factoryViewController = "FactoryDetailsViewController"
    }
    
    private weak var presented: UIViewController?
    private let app: AppDependencyContainerInterface
    private let activities: [AppActivitiy]
    
    init(presented: UIViewController, app: AppDependencyContainerInterface, activities: [AppActivitiy]) {
        self.presented = presented
        self.app = app
        self.activities = activities
    }
    
    func showDetailsView(factory: Factory?) {
        let storyboard = UIStoryboard(name: Const.factoryStoryboard, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: Const.factoryViewController) as! FactoryDetailsViewController
        let router = FactoryDetailsRouter(presented: vc, app: self.app, activities: self.activities)
        let vm = FactoryDetailsViewModel(delegate: vc, router: router, app: self.app)
        vc.set(viewModel: vm)
        vc.factory = factory
        self.presented?.navigationController?.pushViewController(vc, animated: true)
    }
}
