//
//  HomeViewController.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

class FactoryViewController: UIViewController {
    
    private var viewModel: FactoryViewModel?
    
    private func getVM() -> FactoryViewModel {
        guard let viewModel = self.viewModel else {fatalError("error!!!")}
        return viewModel
    }
    
    func set(viewModel: FactoryViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension FactoryViewController: FactoryViewModelDelegate {
}
