//
//  ResetPassword.swift
//  Firebase-auth
//
//  Created by apple on 1/3/2023.
//

import SwiftUI

struct ResetPassword: View {
    
    @State var email: String = ""
    
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
                    
                    InputTextFieldView(text: $email,
                                       placeholder: "Email",
                                       icon: "at",
                                       keyboardType: .emailAddress)
                    
                    
                    
                    ButtonView(title: "Send Password Reset"){
                        print("hello")
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
