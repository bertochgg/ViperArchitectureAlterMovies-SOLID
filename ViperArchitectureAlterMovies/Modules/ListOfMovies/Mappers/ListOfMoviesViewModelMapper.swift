//
//  ListOfMoviesViewModelMapper.swift
//  ViperArchitectureAlterMovies
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/23.
//

import Foundation

protocol ListOfMoviesViewModelMapperProtocol: AnyObject {
    func map(entity: Result) -> ListOfMoviesViewModel
}

final class ListOfMoviesViewModelMapper: ListOfMoviesViewModelMapperProtocol {
    func map(entity: Result) -> ListOfMoviesViewModel {
        .init(title: entity.title,
              poster: URL(string: "https://image.tmdb.org/t/p/w200" + entity.posterPath),
              overview: entity.overview)
    }
}
