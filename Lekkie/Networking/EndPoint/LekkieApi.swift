//
//  LekkieApi.swift
//  Lekkie
//
//  Created by Elliot on 13/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case debug
    case release
}

public enum LekkieApi {
    case outages()
    case outage(id:String)
}

extension LekkieApi: EndPointType {
    var environmentBaseUrl: String {
        switch NetworkManager.environment {
        case .debug: return ProcessInfo.processInfo.environment["LEKKIE_BASE_URL"]!
        case .release: return ProcessInfo.processInfo.environment["LEKKIE_BASE_URL"]!
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .outages(): return "outages/"
        case .outage(let id): return "outages/\(id)/"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self{
        case .outage(let id): return .request
        default: return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
