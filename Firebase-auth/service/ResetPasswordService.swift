//
//  ResetPasswordService.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation
import Combine
import FirebaseAuth

protocol ResetPasswordServiceProtocol{
    func sendResetPassword(to email: String) -> AnyPublisher<Void, Error>
}

final class ResetPasswordService: ResetPasswordServiceProtocol{
    func sendResetPassword(to email: String) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in
                Auth
                    .auth()
                    .sendPasswordReset(withEmail: email){ error in
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
    
    
}
