//
//  Outage.swift
//  Lekkie
//
//  Created by Elliot on 13/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

struct Point {
    let coordinates: String
}

struct Outage {
    let id: String
    let type: String
    let estRestoreTime: String
    let location: String
    let numCustAffected: String
    let startTime: String
    let statusMessage: String
    let point: Point?
}

extension Outage: Decodable {
    enum OutageCodingKeys: String, CodingKey {
        case id = "outageId"
        case type = "outageType"
        case estRestoreTime
        case location
        case numCustAffected
        case startTime
        case statusMessage
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OutageCodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(String.self, forKey: .type)
        estRestoreTime = try container.decode(String.self, forKey: .estRestoreTime)
        location = try container.decode(String.self, forKey: .location)
        numCustAffected = try container.decode(String.self, forKey: .numCustAffected)
        startTime = try container.decode(String.self, forKey: .startTime)
        statusMessage = try container.decode(String.self, forKey: .statusMessage)
        point = nil
    }
}
