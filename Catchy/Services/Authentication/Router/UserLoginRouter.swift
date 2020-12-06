//
//  UserLoginRouter.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

extension AuthenticationRouter.UserLoginRouter {

    static func signup(input: User.Signup.Input) -> Request<User.Signup.Output> {

        let url = generateURL("90546d40-4015-4594-85a0-5bebfe7b2fferr")
        return Request(url: url!, parse: { try? .init(dataObject: $0) })
    }
}
