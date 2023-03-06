//
//  SessionService.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation
import FirebaseAuth



protocol SessionServiceProtocol{
    func logout()
}

final class SessionService: ObservableObject, SessionServiceProtocol{
    
    func logout() {
        try? Auth.auth().signOut()
    }
    
    
}
