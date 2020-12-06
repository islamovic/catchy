//
//  Authentication.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

extension User {
    enum Signup { }
}

extension User.Signup {
    struct Input {
        let name: String
        let email: String
        let password: String
        let passwordConfirmation: String
        let avatar: String
    }

    struct Output {
        let user: User
        init(user: User) {
            self.user = user
        }
    }
}
