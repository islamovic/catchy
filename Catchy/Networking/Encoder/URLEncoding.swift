//
//  URLEncoding.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

struct URLEncoding: Encoder {

    static func encode(urlRequest: inout URLRequest, parameters: Parameters?) throws {

        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        guard let parameters = parameters, !parameters.isEmpty else { return }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {

            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8",
                                forHTTPHeaderField: "Content-Type")
        }
    }
}
