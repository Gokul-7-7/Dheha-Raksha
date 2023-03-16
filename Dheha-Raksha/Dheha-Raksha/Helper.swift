//
//  Helper.swift
//  Dheha-Raksha
//
//  Created by Gokul on 16/03/23.
//
import Foundation


enum DataError: Error {
    case invalidData
    case invalidResponse
    case invalidURL
    case network(Error?)
}
  
typealias Handler = (Result<Bool, DataError>) -> ()

class ApiManager {
    static let shared = ApiManager()
    ///Object can be made only inside this class.
    private init() {}
    
    ///Result is a value that represents either a success or a failure
    func callTheApi(url: String, completion: @escaping Handler) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let teamResponse = try JSONDecoder().decode(Bool.self, from: data)
                completion(.success(teamResponse))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
    
}

