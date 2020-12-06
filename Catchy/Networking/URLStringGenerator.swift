//
//  URLStringGenerator.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

enum URLStringGenerator {

    static private func generatePath(for resource: String?, root: String, apiVersion: String?) -> String {

        var url = root

        if let apiVersion = apiVersion {
            url += "/" + apiVersion
        }

        if let resource = resource {
            url += "/" + resource
        }
        return url
    }

    static func resource(_ resource: String?, root: String, apiVersion: String?) -> ([String]) -> String {

        return { (componeents: [String]) in
            var uri = generatePath(for: resource, root: root, apiVersion: apiVersion)
            if !componeents.isEmpty {
                uri += "/" + componeents.joined(separator: "/")
            }
            return uri
        }
    }
}
