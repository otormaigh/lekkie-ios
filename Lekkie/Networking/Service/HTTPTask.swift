//
//  HTTPTask.swift
//  Lekkie
//
//  Created by Elliot on 13/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
}
