//
//  AppDependencies.swift
//  Lekkie
//
//  Created by Elliot on 12/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

class AppDependencies {
    private enum DependencyType {
        case test
        case live
    }
    
    static let live: AppDependencies = {
        AppDependencies(type: .live)
    }()
    
    private init(type: DependencyType) {
    }
}
