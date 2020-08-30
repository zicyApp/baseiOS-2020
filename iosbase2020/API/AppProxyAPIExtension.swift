//
//  AppProxyAPIExtension.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

extension AppProxy: APIInterface {
    func getFactories(completionCall: @escaping FactoryLitsComp) {
        GetFactoryListCall(proxy: self).getFactories(completionCall: completionCall)
    }
}
