//
//  MovieDataViewController.swift
//  MoyaExample
//
//  Created by Shrouk Yasser on 15/08/2023.

import UIKit

protocol HomeViewProtocol: AnyObject {
    func displayPopularMovies(_ movieResponse: MovieResponse)
    
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIP()
        presenter?.fetchPopularMovies()
    }

    private func setupVIP() {
        let interactor = MovieDataInteractor(repository: MovieDataRepository(networkWorker: NetworkManager()))
        presenter = HomePresenter(interactor: interactor)
        
    }

    // Implement HomeViewProtocol methods to update UI with data
    func displayPopularMovies(_ movieResponse: MovieResponse) {
        print(movieResponse)
        
    }
}
