//
//  FactoryDetailsViewController.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

class FactoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: TLabel!
    @IBOutlet weak var addressTitle: TLabel!
    @IBOutlet weak var addressLabel: TLabel!
    @IBOutlet weak var countryTitle: TLabel!
    @IBOutlet weak var countryLabel: TLabel!
    @IBOutlet weak var divisionTitle: TLabel!
    @IBOutlet weak var divisionLabel: TLabel!
    
    private var viewModel: FactoryDetailsViewModel?
    var factory: Factory?
    
    private func getVM() -> FactoryDetailsViewModel {
        guard let viewModel = self.viewModel else {fatalError("error!!!")}
        return viewModel
    }
    
    func set(viewModel: FactoryDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    @IBAction func onBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setText()
    }
    
    private func setText() {
        self.titleLabel.text = self.factory?.name
        self.addressTitle.text = NSLocalizedString(i18Interface.factoryAddress, comment: "Address")
        self.addressLabel.text = self.factory?.address
        self.countryTitle.text = NSLocalizedString(i18Interface.factoryCountry, comment: "Country")
        self.countryLabel.text = self.factory?.country
        self.divisionTitle.text = NSLocalizedString(i18Interface.factoryDivision, comment: "Division")
        self.divisionLabel.text = self.factory?.division
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getVM().viewDidAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension FactoryDetailsViewController: FactoryDetailsViewModelDelegate {
}
