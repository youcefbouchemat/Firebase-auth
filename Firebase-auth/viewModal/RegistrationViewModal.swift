//
//  RegistrationViewModal.swift
//  Firebase-auth
//
//  Created by apple on 5/3/2023.
//

import Foundation
import Combine

enum RegistrationState {
    case successfull
    case failed(error: Error)
    case na
}

protocol RegistrationViewModalProtocol {
    func register()
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var userDetails: RegistrationModal { get }
    init(service: RegistrationService)
}

final class RegistrationViewModal: ObservableObject, RegistrationViewModalProtocol {
    
    let service: RegistrationService
    
    var state: RegistrationState = .na
    
    @Published var userDetails: RegistrationModal = RegistrationModal.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
    }
    
    func register() {
        service.register(with: userDetails)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subscriptions)
    }
    
    
    
    
}

