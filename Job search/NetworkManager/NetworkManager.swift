//
//  NetworkManager.swift
//  Job search
//
//  Created by Максим Зыкин on 02.06.2024.
//

import Foundation

final class NetworkManager<T: Decodable> {
    
    static func fetchData(urlJson: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlJson) else { return }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let vacancies = try decoder.decode(T.self, from: data)
                completion(.success(vacancies))
                print(vacancies)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}
