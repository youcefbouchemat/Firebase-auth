//
//  SessionViewModal.swift
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

protocol SessionViewModalProtocol{
    var state: SessionState { get }
    var sessionDetails: SessionModal? { get }
    var service: SessionService { get }
    var handler: AuthStateDidChangeListenerHandle? { get }
    func logout()
    init(service: SessionService)
}

class SessionViewModal: ObservableObject,SessionViewModalProtocol{
    
    @Published var state: SessionState = .loggedOut
    
    @Published var sessionDetails: SessionModal?
    
    var handler: AuthStateDidChangeListenerHandle?
    
    var service: SessionService
    
    required init(service: SessionService) {
        self.service = service
        setupFirebaseAuthHandler()
    }
    
    func logout() {
        service.logout()
    }
    
}
private extension SessionViewModal{
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

