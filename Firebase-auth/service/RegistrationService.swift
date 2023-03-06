//
//  RegistrationService.swift
//  Firebase-auth
//
//  Created by apple on 5/3/2023.
//

import Foundation
import Combine
import FirebaseAuth

protocol RegistrationServiceProtocol {
    func register(with details: RegistrationModal) -> AnyPublisher<Void,Error>
}

final class RegistrationService: RegistrationServiceProtocol{
    func register(with details: RegistrationModal) -> AnyPublisher<Void, Error> {
        
        Deferred {
            Future { promise in
                Auth.auth().createUser(withEmail: details.email, password: details.password){ res, error in
                    if let err = error {
                        promise(.failure(err))
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    
}
