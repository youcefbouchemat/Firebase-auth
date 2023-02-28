//
//  LoginScreen.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI

struct LoginScreen: View {
    @State var email: String = ""
    @State var password: String = ""
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
                
                InputTextFieldView(text: $email, placeholder: "Email", keyboardType: .emailAddress)
                InputPasswordView(password: $password, placeholder: "Password",icon: "lock")
                
                HStack{
                    Spacer()
                    Text("Forgot Password ?")
                        .foregroundColor(.blue)
                        .font(.system(size: 17,weight: .bold))
                }
                
                ButtonView(title: "Login"){
                    print("hello")
                }
                ButtonView(title: "Register", backgroundColor: .white, foregroundColor: .blue, border: .blue){
                    print("Register")
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