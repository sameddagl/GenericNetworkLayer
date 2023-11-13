//
//  HTTPEndpoint.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

protocol HTTPEndpoint {
    var scheme: String { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [(value: String, forField: String)] { get }
    var queryItems: [URLQueryItem] { get }
    var httpBody: Data? { get }
}

extension HTTPEndpoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "rickandmortyapi.com"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var httpBody: Data? { return nil }
}
