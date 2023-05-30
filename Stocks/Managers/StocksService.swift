//
//  StocksService.swift
//  Stocks
//
//  Created by Tai Chin Huang on 2023/4/10.
//

import Foundation

final class StocksService {
    static let shared = StocksService()
    
    private struct Constants {
        static let apiKey = ""
        static let sandboxApiKey = ""
        static let baseUrl = ""
    }
    private init() {}
    
    // MARK: - Public
    // get stock info
    // search stocks
    
    // MARK: - Private
    
    private enum Endpoint: String {
        case search
    }
    
    private enum StocksServiceError: Error {
        case invalidUrl
        case noDataReturned
    }
    
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        return nil
    }
    
    private func execute<T: Codable>(_ url: URL?,
                                     expecting type: T.Type,
                                     completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(StocksServiceError.invalidUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? StocksServiceError.noDataReturned))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
