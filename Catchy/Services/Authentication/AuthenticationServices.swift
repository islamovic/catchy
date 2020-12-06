//
//  AuthenticationServices.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

class AuthenticationServices: NetworkService {

    func signup(input: User.Signup.Input, completion: @escaping(Result<User.Signup.Output, NetworkError>) -> Void) {
        let request = AuthenticationRouter.UserLoginRouter.signup(input: input)
        client.execute(request, completion: completion)
    }
}
