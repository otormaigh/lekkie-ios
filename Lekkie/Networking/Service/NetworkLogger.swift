//
//  NetworkLogger.swift
//  Lekkie
//
//  Created by Elliot on 13/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

class NetworkLogger {
    static func log(request: URLRequest) {
        print("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput = """
        \(urlAsString) \n
        \(method) \(path)?\(query) HTTP/1.1
        HOST: \(host)\n
        """
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }
        if let body = request.httpBody {
            logOutput += "\(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        
        print(logOutput)
        
        print("\n - - - - - - - - - -  END - - - - - - - - - - \n")
    }
    
    static func log(response: URLResponse, data: Data) {
        print("\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n")
        
        var logOutput = ""
        if let httpResponse = response as? HTTPURLResponse {
            logOutput += "Status Code: \(httpResponse.statusCode)\n"
        }
        
        logOutput += "Description: \(response.description)\n"
        print("Data: \(String(data: data, encoding: String.Encoding.utf8))")
        
        print(logOutput)
        
        print("\n - - - - - - - - - -  END - - - - - - - - - - \n")
    }
}
