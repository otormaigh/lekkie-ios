//
//  OutagesTableViewModel.swift
//  Lekkie
//
//  Created by Elliot on 14/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

struct OutagesTableViewModel {
    let location: String
    let estRestoreTime: String
    let type: String
    
    init(outage: Outage) {
        self.location = outage.location
        self.estRestoreTime = outage.estRestoreTime
        self.type = outage.type
    }
}
