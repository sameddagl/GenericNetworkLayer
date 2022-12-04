//
//  TopRatedService.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 4.12.2022.
//

import Foundation

final class TopRatedService {
    
    func fetchTopRatedMovies(language: String, page: Int, completion: @escaping(Swift.Result<Movie, NetworkError>) -> Void) {
        NetworkService().request(endPoint: TopRatedEndpoint.getTopRatedMovies(language: language, page: page)) { (result: Swift.Result<Movie, NetworkError>) in
            completion(result)
        }
    }
}
