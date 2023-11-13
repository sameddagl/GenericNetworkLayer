//
//  Location.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

//MARK: - Location
struct Location: Decodable {
    let info: Info
    let results: [LocationResult]
    
    struct Info: Decodable {
        let pages: Int
    }
    
    struct LocationResult: Codable {
        let id: Int
        let name: String
        let residents: [String]
    }
}




