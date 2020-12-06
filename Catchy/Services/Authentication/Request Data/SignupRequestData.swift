//
//  SignupRequestData.swift
//  Catchy
//
//  Created by Islam on 11/13/20.
//

import Foundation

extension User.Signup.Input: Wrap {

    func wrap() -> [String : Any] {
        return [
            "name": name,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation,
            "avatar": avatar
        ]
    }
}
