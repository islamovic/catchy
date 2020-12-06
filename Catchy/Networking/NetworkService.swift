//
//  NetworkService.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

class NetworkService: NSObject {

    let client: NetworkClient

    init(client: NetworkClient) {
        self.client = client
    }

    static let shared: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        return configuration
    }()

    override init() {
        client = NetworkService.shared
        super.init()
    }
}
