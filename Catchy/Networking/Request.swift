//
//  Request.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

struct Request<Output> {

    let url: URL
    let method: HTTPMethod
    let parameters: Parameters?
    let headers: Headers?
    let parse: (Data?) -> Output?

    init(url: URL,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         headers: Headers? = nil,
         parse: @escaping(Data?) -> Output?) {

        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.parse = parse
    }
}

extension Request: URLRequestConvertible {

    func asURLRequest() throws -> URLRequest {

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.cachePolicy = .reloadIgnoringCacheData

        if method == .get {
            try URLEncoding.encode(urlRequest: &urlRequest, parameters: parameters)
            return urlRequest
        }

        try JSONEncoding.encode(urlRequest: &urlRequest, parameters: parameters)
        return urlRequest
    }
}
