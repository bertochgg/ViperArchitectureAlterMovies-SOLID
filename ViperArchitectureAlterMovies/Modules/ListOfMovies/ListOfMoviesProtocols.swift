//
//  ListOfMoviesProtocols.swift
//  ViperArchitectureAlterMovies
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/23.
//

import UIKit

// MARK: - View Input (View -> Presenter)
protocol ViewToPresenterListOfMoviesProtocol: AnyObject {
    var view: PresenterToViewListOfMoviesProtocol? { get set }
    var interactor: PresenterToInteractorListOfMoviesProtocol? { get set }
    var router: PresenterToRouterListOfMoviesProtocol? { get set }
}

// MARK: - View Output (Presenter -> View)
protocol PresenterToViewListOfMoviesProtocol: AnyObject {
    
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorListOfMoviesProtocol: AnyObject {
    var presenter: InteractorToPresenterListOfMoviesProtocol? { get set }
    
    func fetchMovies()
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterListOfMoviesProtocol: AnyObject {
    func didGetMoviesSuccess(movie: ListOfMoviesEntity)
    func didGetMoviesFailure(error: NetworkErrors)
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterListOfMoviesProtocol: AnyObject {
    static func showListOfMovies() -> UIViewController
    
    
    
}
