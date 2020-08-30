//
//  AppRouteCreator.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

public enum AppActivitiy {
    case session
}

class AppRouteCreator {
    
    private let activities: [AppActivitiy] = [.session,
                                              ]
    
    func createRoute(forApp app: AppDependencyContainerInterface) -> AppRouter {
        return AppRouter(app: app, activities: self.activities)
    }
}
