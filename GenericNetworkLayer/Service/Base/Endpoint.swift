//
//  Endpoint.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 4.12.2022.
//

import Foundation

protocol EndPoint {
    //HTTP or HTTPS
    var scheme: String { get }
    
    //jsonplaceholder.typicode.com
    var baseURL: String { get }
    
    // /posts
    var path: String { get }
    
    // [URLQueryItem(name: "api_key", value: API_KEY]
    var params: [URLQueryItem] { get }
    
    // Get
    var method: String { get }
}

extension EndPoint {
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return NetworkHelper.baseURL
    }

    var method: String {
        return "GET"
    }
}
