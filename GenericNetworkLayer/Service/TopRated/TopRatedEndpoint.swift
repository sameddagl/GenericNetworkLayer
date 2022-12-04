//
//  TopRatedEndpoint.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 4.12.2022.
//

import Foundation

//https://api.themoviedb.org/3/movie/top_rated?api_key=3628cca7b1f145241f88009eac10fc7c&language=en-US&page=1
enum TopRatedEndpoint: EndPoint {
    case getTopRatedMovies(language: String, page: Int)
    
    var path: String {
        switch self {
        case .getTopRatedMovies:
            return Paths.topRated
        }
    }
    
    var params: [URLQueryItem] {
        switch self {
        case .getTopRatedMovies(let language, let page):
            return [
                URLQueryItem(name: "api_key", value: NetworkHelper.apiKey),
                URLQueryItem(name: "language", value: language),
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}
