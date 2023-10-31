//
//  ListOfMoviesNetworkService.swift
//  ViperArchitectureAlterMovies
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/23.
//

import Foundation

protocol ListOfMoviesNetworkServiceProtocol: AnyObject {
    func getMovies(completion: @escaping (Swift.Result<ListOfMoviesEntity, NetworkErrors>) -> Void) async
}

final class ListOfMoviesNetworkService: ListOfMoviesNetworkServiceProtocol {
    func getMovies(completion: @escaping (Swift.Result<ListOfMoviesEntity, NetworkErrors>) -> Void) async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .useDefaultKeys
                let moviesData = try jsonDecoder.decode(ListOfMoviesEntity.self, from: data)
                completion(.success(moviesData))
            } catch {
                if let urlError = error as? URLError {
                    completion(.failure(.networkError(urlError)))
                } else {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
