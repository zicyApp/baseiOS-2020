//
//  FactoryCell.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

class FactoryCell: SharedTableViewCell {
    
    private var indexPath: IndexPath?
    private var factory: Factory?
    
    @IBOutlet weak var titleLabel: TLabel!
    @IBOutlet weak var divisionLabel: TLabel!
    
    func setUpCell(factory: Factory?, indexPath: IndexPath?) {
        self.factory = factory
        self.indexPath = indexPath
        
        self.titleLabel.text = self.factory?.name
        self.divisionLabel.text = self.factory?.division
    }
}
