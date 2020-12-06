//
//  JSONEncoding.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

struct JSONEncoding: Encoder {

    static func encode(urlRequest: inout URLRequest, parameters: Parameters?) throws {

        guard let parameters = parameters else { return }

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
