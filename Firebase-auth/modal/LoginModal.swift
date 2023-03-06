//
//  LoginModal.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation

struct LoginModal{
    var email: String
    var password: String
}

extension LoginModal{
    static var new: LoginModal{
        LoginModal(email: "", password: "")
    }
}
