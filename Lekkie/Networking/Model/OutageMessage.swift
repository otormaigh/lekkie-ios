//
//  OutageConcise.swift
//  Lekkie
//
//  Created by Elliot on 13/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

struct OutageMessage: Decodable {
    let outageMessage: [OutageConcise]
}

struct OutageConcise {
    let id: String
}

extension OutageConcise: Decodable {
    enum OutageConciseCodeKeys: String, CodingKey {
        case id = "outageId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OutageConciseCodeKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
    }
}
