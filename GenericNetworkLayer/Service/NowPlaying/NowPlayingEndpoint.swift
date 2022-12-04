//
//  NowPlayingEndpoint.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 4.12.2022.
//

import Foundation

enum NowPlayingEndpoint: EndPoint {
    case getNowPlaying(language: String, page: Int)
    
    //https://api.themoviedb.org/3/movie/now_playing?api_key=3628cca7b1f145241f88009eac10fc7c&language=en-US&page=1
    var path: String {
        switch self {
        case .getNowPlaying:
            return Paths.nowPlaying
        }
    }
    
    var params: [URLQueryItem] {
        switch self {
        case .getNowPlaying(let language, let page):
            return [
                URLQueryItem(name: "api_key", value: NetworkHelper.apiKey),
                URLQueryItem(name: "language", value: language),
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}
