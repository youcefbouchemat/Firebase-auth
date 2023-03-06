//
//  ResetPasswordViewModal.swift
//  Firebase-auth
//
//  Created by apple on 6/3/2023.
//

import Foundation
import Combine


protocol ResetPasswordViewModalProtocol{
    var email: String { get }
    var service: ResetPasswordService { get }
    func sendResetPassword()
    init(service: ResetPasswordService)
}


final class ResetPasswordViewModal: ObservableObject, ResetPasswordViewModalProtocol{
    @Published var email: String = ""
    
    var service: ResetPasswordService
    
    private var subscriptions = Set<AnyCancellable>()
    
    func sendResetPassword() {
        service
            .sendResetPassword(to: email)
            .sink { res in
                switch res {
                case .failure(_):
                    print("reset Password failed")
                default: break
                }
            } receiveValue: { () in
                print("reset Password successfull")
            }
            .store(in: &subscriptions)

    }
    
    init(service: ResetPasswordService) {
        self.service = service
    }
}
