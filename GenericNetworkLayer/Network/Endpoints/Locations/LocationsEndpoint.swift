//
//  LocationsEndpoint.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

enum LocationsEndPoint: HTTPEndpoint {
    case getLocations(page: Int)
    
    var path: String {
        return Paths.locations
    }
    
    var headers: [(value: String, forField: String)] {
        return [
            ("application/json", "Content-Type"),
            ("application/json", "Accept"),
        ]
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getLocations(let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}
