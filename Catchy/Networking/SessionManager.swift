//
//  SessionManager.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

extension URLSessionConfiguration: NetworkClient {

    func execute<V>(_ enpointRequest: Request<V>, completion: @escaping(Result<V, NetworkError>) -> Void) {

        let request = try? enpointRequest.asURLRequest()
        guard let Catchy = request else {
            return
        }

        URLSession.shared.dataTask(with: Catchy) { (data, response, error) in

            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 404 {
                    completion(.failure(.notFound))
                }
                return
            }

            if error != nil {
                completion(.failure(.responseFailed(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.missingData))
                return
            }

            guard let parseedResponse = enpointRequest.parse(data) else {
                completion(.failure(.parseFailed))
                return
            }

            completion(.success(parseedResponse))
            
        }.resume()
    }
}
