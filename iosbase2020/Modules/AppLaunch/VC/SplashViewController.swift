//
//  SplashViewVC.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    private var viewModel: SplashViewModel?
    
    private func getVM() -> SplashViewModel {
        guard let viewModel = self.viewModel else {fatalError("error!!!")}
        return viewModel
    }
    
    func set(viewModel: SplashViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getVM().viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SplashViewController: SplashViewModelDelegate {
    func showError(message: String, title: String?) {
        ControllerUtils.showError(forController: self.presentedViewController ?? self, message: message, title: title)
    }
}
