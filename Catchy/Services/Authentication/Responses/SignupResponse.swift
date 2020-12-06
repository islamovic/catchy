//
//  SignupResponse.swift
//  Catchy
//
//  Created by Islam on 11/15/20.
//

import Foundation

extension User.Signup.Output: Unwrapping {

    init(dataObject: Data?) throws {
        guard let data = dataObject else { throw NetworkError.encodingFailed }
        let userResponse = try? JSONDecoder().decode(User.self, from: data)
        guard let user = userResponse else { throw NetworkError.encodingFailed }
        self.init(user: user)
    }
}
