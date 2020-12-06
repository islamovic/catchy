//
//  NetworkError.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//
import Foundation

enum NetworkError: Error {

    case encodingFailed
    case missingURL
    case notFound
    case responseFailed(_ error: Error?)
    case parseFailed
    case missingData
}

extension NetworkError: LocalizedError {

    var errorDescription: String? {
        switch self {

        case .encodingFailed:
            return NSLocalizedString("Unable to encode", comment: "")

        case .missingURL:
            return NSLocalizedString("URL is missing", comment: "")

        case .notFound:
            return NSLocalizedString("The URL you trying to open may not be found, Check your URL again.", comment: "")

        case .responseFailed(let error):
            return NSLocalizedString("Failed to return response", comment: error?.localizedDescription ?? "")

        case .parseFailed:
            return NSLocalizedString("Uunable to parse response", comment: "")

        case .missingData:
            return NSLocalizedString("Request succsed but with no data", comment: "")
        }
    }
}
