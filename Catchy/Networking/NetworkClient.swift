//
//  Networking.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

protocol NetworkClient {
    func execute<V>(_ enpointRequest: Request<V>, completion: @escaping(Result<V, NetworkError>) -> Void)
}
