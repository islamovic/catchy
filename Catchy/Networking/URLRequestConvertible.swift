//
//  URLRequestConvertible.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}
