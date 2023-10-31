//
//  ListOfMoviesPresenter.swift
//  ViperArchitectureAlterMovies
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/23.
//

import Foundation

final class ListOfMoviesPresenter: ViewToPresenterListOfMoviesProtocol {
    weak var view: PresenterToViewListOfMoviesProtocol?
    var interactor: PresenterToInteractorListOfMoviesProtocol?
    var router: PresenterToRouterListOfMoviesProtocol?
    
    private var movieModels: [Result] = []
    private var movieViewModels: [ListOfMoviesViewModel] = []
    
    private let mapper: ListOfMoviesViewModelMapperProtocol
    
    init(mapper: ListOfMoviesViewModelMapperProtocol) {
        self.mapper = mapper
    }
    
    func viewDidLoad() {
        interactor?.fetchMovies()
    }
    
    
}

extension ListOfMoviesPresenter: InteractorToPresenterListOfMoviesProtocol {
    func didGetMoviesSuccess(movie: ListOfMoviesEntity) {
        movieModels = movie.results
        movieViewModels = movieModels.map(mapper.map(entity:))
    }
    
    func didGetMoviesFailure(error: NetworkErrors) {
        print(error)
    }
}
