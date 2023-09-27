//
//  MovieDataPresenter.swift
//  MoyaExample
//
//  Created by Shrouk Yasser on 15/08/2023.
//
import UIKit

protocol HomePresenterProtocol {
    func fetchPopularMovies()
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    private let interactor: MovieDataInteractorProtocol

    init(interactor: MovieDataInteractorProtocol) {
        self.interactor = interactor
    }

    func fetchPopularMovies() {
        interactor.fetchPopularMovies()
    }

    func presentFetchedPopularMovies(_ movieResponse: MovieResponse) {
        view?.displayPopularMovies(movieResponse)
    }
}
