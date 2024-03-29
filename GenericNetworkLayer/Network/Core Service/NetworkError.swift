//
//  NetworkError.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

enum NetworkError: String, Error {
    case badURL                 = "Invalid request."
    case unableToComplete       = "Unable to complete your request. Please check your internet connection"
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data received from the server was invalid. Please try again."
    case unauthorized           = "Unauthorized"
    case unexpectedStatusCode   = "Unexpected Status Code"
    case decoding               = "Decoding error"
}
