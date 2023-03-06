//
//  LoginViewModal.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation
import Combine

enum LoginState{
    case successfull
    case failed(error: Error)
    case na
}


protocol LoginViewModalProtocol{
    var details: LoginModal { get }
    var state: LoginState { get }
    var service: LoginService { get }
    func login()
    init(service: LoginService)
}


final class LoginViewModal: ObservableObject, LoginViewModalProtocol{
    
    @Published var details: LoginModal = LoginModal.new
    
    @Published var state: LoginState = .na
    
    var service: LoginService
    
    private var subscriptions = Set<AnyCancellable>()
    
    func login() {
        service
            .Login(with: details)
            .sink { res in
                
                switch res{
                case .failure(let err):
                    self.state = .failed(error: err)
                default: break
                }
            
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)

    }
    
    init(service: LoginService) {
        self.service = service
    }
    
    
}
