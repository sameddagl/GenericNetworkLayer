//
//  NetworkService.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 4.12.2022.
//

import Foundation

enum NetworkError: String, Error {
    case badURL = "Bad URL"
    case badResponse = "Bad Response"
    case badData = "Bad data"
}

final class NetworkService {
    
    func request<T: Codable>(endPoint: EndPoint, completion: @escaping(Swift.Result<T, NetworkError>) -> Void) {
        var components = URLComponents()
        components.scheme = endPoint.scheme
        components.host = endPoint.baseURL
        components.path = endPoint.path
        components.queryItems = endPoint.params
        
        guard let url = components.url else {
            completion(.failure(.badURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(.badURL))
                print(error)
                return
            }
            
            guard response != nil else {
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                print("error while getting data")
                completion(.failure(.badData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
                return
            }
            catch {
                print("error while decoding data")
                print(error)
                completion(.failure(.badData))
                return
            }
        }.resume()
    }
}
