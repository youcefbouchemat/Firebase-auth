//
//  ContentView.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack{
            InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
            InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
            InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
            InputTextFieldView(text: $text, placeholder: "Email", keyboardType: .emailAddress)
            InputPasswordView(password: $text, placeholder: "Password",icon: "lock")
        }.padding()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
