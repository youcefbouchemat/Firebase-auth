//
//  ResetPassword.swift
//  Firebase-auth
//
//  Created by apple on 1/3/2023.
//

import SwiftUI

struct ResetPassword: View {
    
    @StateObject private var vm = ResetPasswordViewModal(service: ResetPasswordService())
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.75)
                    .foregroundColor(.white.opacity(0.15))
                
                Circle()
                    .scale(1.35)
                    .foregroundColor(Color(UIColor.systemBackground))
                
                VStack(spacing: 25){
                    Text("Reset Password")
                        .font(.system(size: 30,weight: .bold))
                    
                    InputTextFieldView(text: $vm.email,
                                       placeholder: "Email",
                                       icon: "at",
                                       keyboardType: .emailAddress)
                    
                    
                    
                    ButtonView(title: "Send Password Reset"){
                        vm.sendResetPassword()
                        presentationMode.wrappedValue.dismiss()
                    }
                   
                }
                .padding()
            }
            .applyClose()
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
