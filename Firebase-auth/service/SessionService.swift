//
//  SessionService.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation
import FirebaseAuth


enum SessionState{
    case loggedIn
    case loggedOut
}


protocol SessionServiceProtocol{
    var state: SessionState { get }
    var sessionDetails: SessionModal? { get }
    func logout()
}

final class SessionService: ObservableObject, SessionServiceProtocol{
    @Published var state: SessionState = .loggedOut
    
    @Published var sessionDetails: SessionModal?
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        setupFirebaseAuthHandler()
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
    
    
}
private extension SessionService{
    func setupFirebaseAuthHandler(){
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] res, user in
                guard let self = self else { return }
                self.state = user == nil ? .loggedOut : .loggedIn
                self.sessionDetails = SessionModal(username: user?.displayName ?? "" , email: user?.email ?? "")
        }
    }
}
