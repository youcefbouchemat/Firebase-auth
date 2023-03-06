//
//  RegistrationModal.swift
//  Firebase-auth
//
//  Created by apple on 5/3/2023.
//

import Foundation

struct RegistrationModal {
    var username: String
    var email: String
    var password: String
}

extension RegistrationModal{
    static var new: RegistrationModal{
        RegistrationModal(username: "", email: "", password: "")
    }
}
