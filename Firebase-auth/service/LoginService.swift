//
//  LoginService.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation
import Combine
import FirebaseAuth

protocol LoginServiceProtocol{
    func Login(with details: LoginModal) -> AnyPublisher<Void, Error>
}

final class LoginService: LoginServiceProtocol{
    func Login(with details: LoginModal) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth
                    .auth()
                    .signIn(withEmail: details.email, password: details.password){ res, error in
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
