//
//  Encoder.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

protocol Encoder {
    static func encode(urlRequest: inout URLRequest, parameters: Parameters?) throws
}
