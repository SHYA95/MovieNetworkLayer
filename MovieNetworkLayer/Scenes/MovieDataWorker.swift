//
//  MovieDataWorker.swift
//  MoyaExample
//
//  Created by Shrouk Yasser on 15/08/2023.

import Moya
protocol Networkable {
    var provider: MoyaProvider<API> { get }
    func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ())
}

class NetworkManager: Networkable {
var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
 func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
