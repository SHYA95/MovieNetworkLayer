//
//  MovieDataInteractor.swift
//  MoyaExample
//
//  Created by Shrouk Yasser on 15/08/2023.
//  
//
import UIKit

protocol MovieDataInteractorProtocol {
    func fetchPopularMovies()
}

class MovieDataInteractor: MovieDataInteractorProtocol {
    var presenter: HomePresenter?
    private let repository: MovieDataRepositoryProtocol
    init(repository: MovieDataRepositoryProtocol) {
        self.repository = repository
    }

    func fetchPopularMovies() {
        repository.fetchPopularMovies { [weak self] result in
            switch result {
            case .success(let movieResponse):
                print(result)
                print(movieResponse)
                self?.presenter?.presentFetchedPopularMovies(movieResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
