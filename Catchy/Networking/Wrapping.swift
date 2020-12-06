//
//  Wrapping.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//
import Foundation

protocol Wrap {
    func wrap() -> [String: Any]
}

protocol Unwrapping {
    init(dataObject: Data?) throws
}
