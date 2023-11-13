//
//  Service.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import Foundation

protocol ServiceProtocol {
    func request<T: Decodable>(with endpoint: HTTPEndpoint, completion: @escaping(Result<T, NetworkError>) -> Void)
}

final class Service: ServiceProtocol {
    
    func request<T: Decodable>(with endpoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let components = createURLComponents(from: endpoint)
        
        guard let url = components.url else {
            completion(.failure(.badURL))
            return
        }
                                                
        let urlRequest = createURLRequest(from: url, endpoint: endpoint)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                }
                catch {
                    completion(.failure(.decoding))
                }
            case 401:
                completion(.failure(.unauthorized))
            default:
                completion(.failure(.unexpectedStatusCode))
            }
        }.resume()
    }
    
    private func createURLComponents(from endpoint: HTTPEndpoint) -> URLComponents {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems
        return components
    }
    
    private func createURLRequest(from url: URL, endpoint: HTTPEndpoint) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = endpoint.httpBody
        
        for (value, key) in endpoint.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
