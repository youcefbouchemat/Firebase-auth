//
//  RegisterScreen.swift
//  Firebase-auth
//
//  Created by apple on 1/3/2023.
//

import SwiftUI

struct RegisterScreen: View {
    @StateObject private var vm = RegistrationViewModal(service: RegistrationService())
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(Color(UIColor.systemBackground).opacity(0.8))
                
                VStack (spacing: 25){
                    VStack{
                        InputTextFieldView(text: $vm.userDetails.username,
                                           placeholder: "Username",
                                           icon: "person",
                                           keyboardType: .emailAddress)
                        InputTextFieldView(text: $vm.userDetails.email,
                                           placeholder: "Email",
                                           icon: "at",
                                           keyboardType: .emailAddress)
                        InputPasswordView(password: $vm.userDetails.password,
                                          placeholder: "Password",
                                          icon: "lock")
                    }
                    
                    Divider()
                    
                    ButtonView(title: "Register",
                               backgroundColor: Color(UIColor.systemBackground).opacity(0.1),
                               foregroundColor: .blue,
                               border: .blue,
                               isLoading:vm.isLoading){
                        vm.register()
                    }
                    
                    
                }.padding()
                .navigationTitle("Register")

            }
            .applyClose()
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
