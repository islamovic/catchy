//
//  User.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

struct Company: Codable {
    let id: String
    let nasme: String
}

struct User: Codable {
    let id: String
    let name: String
    let company: Company
}
