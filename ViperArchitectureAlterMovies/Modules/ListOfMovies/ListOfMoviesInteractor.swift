//
//  ListOfMoviesInteractor.swift
//  ViperArchitectureAlterMovies
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/23.
//

import Foundation

final class ListOfMoviesInteractor: PresenterToInteractorListOfMoviesProtocol {
    weak var presenter: InteractorToPresenterListOfMoviesProtocol?
    private let listOfMoviesService: ListOfMoviesNetworkServiceProtocol
    
    init(listOfMoviesService: ListOfMoviesNetworkServiceProtocol) {
        self.listOfMoviesService = listOfMoviesService
    }

    func fetchMovies() {
        Task {
            await listOfMoviesService.getMovies { result in
                switch result {
                case .success(let moviesData):
                    self.presenter?.didGetMoviesSuccess(movie: moviesData)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
