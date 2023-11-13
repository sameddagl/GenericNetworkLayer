//
//  AppContainer.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

struct AppContainer {
    static let service = Service()
    static let locationsService = LocationsService(service: Self.service)
}
