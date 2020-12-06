//
//  Routeer.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

protocol Router {
    static var rootURL: String? { get }
    static var name: String? { get }
    static var apiVersion: String? { get }
}

extension Router {

    static var name: String? {
        return nil
    }

    static var rootURL: String? {
        return "https://run.mocky.io"
    }

    static var apiVersion: String? {
        return "v3"
    }

    static func generateURL(_ components: String...) -> URL? {
        let urlString = URLStringGenerator.resource(name, root: rootURL ?? "", apiVersion: apiVersion)(components)
        return URL(string: urlString)
    }
}
