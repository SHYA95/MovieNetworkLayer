//
//  DataRepository.swift
//  MoyaExample
//
//  Created by Shrouk Yasser on 15/08/2023.
//  

import Foundation

protocol MovieDataRepositoryProtocol {
    func fetchPopularMovies(completion: @escaping (Result<MovieResponse, Error>) -> ())
    
}

class MovieDataRepository: MovieDataRepositoryProtocol {
    private let networkWorker: Networkable
    
    init(networkWorker: Networkable) {
        self.networkWorker = networkWorker
    }
    
    func fetchPopularMovies(completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        networkWorker.request(target: .popular, completion: completion)
    }

    
}
