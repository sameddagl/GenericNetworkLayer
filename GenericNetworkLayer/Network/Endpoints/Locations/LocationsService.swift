//
//  LocationsService.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

protocol LocationsServiceProtocol {
    func getLocations(endPoint: LocationsEndPoint, completion: @escaping (Result<Location, NetworkError>) -> Void)
}

final class LocationsService: LocationsServiceProtocol {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func getLocations(endPoint: LocationsEndPoint, completion: @escaping (Result<Location, NetworkError>) -> Void) {
        service.request(with: endPoint) { (result: Result<Location, NetworkError>) in
            completion(result)
        }
    }
}
