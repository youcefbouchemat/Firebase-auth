//
//  LoginScreen.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var vm: LoginViewModal = LoginViewModal(service: LoginService())
    
    @State var loginLoader: Bool = false
    
    @State private var isShowRegistration: Bool = false
    @State private var isShowResetPassword: Bool = false
    
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            Circle()
                .scale(1.75)
                .foregroundColor(.white.opacity(0.15))
            
            Circle()
                .scale(1.35)
                .foregroundColor(Color(UIColor.systemBackground))
            
            VStack{
                Text("Login")
                    .font(.system(size: 30,weight: .bold))
                
                InputTextFieldView(text: $vm.details.email,
                                   placeholder: "Email",
                                   icon: "at",
                                   keyboardType: .emailAddress)
                InputPasswordView(password: $vm.details.password, placeholder: "Password",icon: "lock")
                
                HStack{
                    Spacer()
                    Button {
                        isShowResetPassword.toggle()
                    } label: {
                        Text("Forgot Password ?")
                            .foregroundColor(.blue)
                            .font(.system(size: 17,weight: .bold))
                    }.sheet(isPresented: $isShowResetPassword) {
                        ResetPassword()
                    }

                    
                }
                
                ButtonView(title: "Login",isLoading: loginLoader){
                    vm.login()
                }
                ButtonView(title: "Register",
                           backgroundColor: .white,
                           foregroundColor: .blue,
                           border: .blue){
                    isShowRegistration.toggle()
                }
                   .sheet(isPresented: $isShowRegistration) {
                       RegisterScreen()
                   }
            }
            .padding()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
