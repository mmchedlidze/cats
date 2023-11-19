// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public final class NetworkManager {
    public static let shared = NetworkManager()
    private let baseURL = "https://catfact.ninja/facts"
    
    private init() {}
    
    public func fetchMovies(completion: @escaping (Result<[Cats], Error>) -> Void ){
        let urlStr = baseURL
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain:"", code: -1, userInfo: [ NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain:"", code: -2, userInfo: [ NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            do {
                let catsResponse = try JSONDecoder().decode(CatsResponse.self, from: data)
                completion(.success(catsResponse.data))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
}
