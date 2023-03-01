//
//  RegisterScreen.swift
//  Firebase-auth
//
//  Created by apple on 1/3/2023.
//

import SwiftUI

struct RegisterScreen: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.5)
                    .foregroundColor(Color(UIColor.systemBackground).opacity(0.8))
                
                VStack (spacing: 40){
                    VStack{
                        InputTextFieldView(text: $username,
                                           placeholder: "Username",
                                           icon: "person",
                                           keyboardType: .emailAddress)
                        InputTextFieldView(text: $email,
                                           placeholder: "Email",
                                           icon: "at",
                                           keyboardType: .emailAddress)
                        InputPasswordView(password: $password, placeholder: "Password",icon: "lock")
                    }
                    
                    ButtonView(title: "Register",
                               backgroundColor: Color(UIColor.systemBackground).opacity(0.1),
                               foregroundColor: .blue,
                               border: .blue){
                        print("Register")
                    }
                    
                    
                }.padding()
                .navigationTitle("Register")

            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}