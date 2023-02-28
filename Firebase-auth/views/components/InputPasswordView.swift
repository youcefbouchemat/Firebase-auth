//
//  InputPasswordView.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI

struct InputPasswordView: View {
    
    @Binding var password: String
    let placeholder: String
    var icon: String = ""
    
    @FocusState private var isFocused: Bool
    @State private var isEye: Bool = true
    
    var body: some View {
        HStack {
            if(!icon.isEmpty)
            {
                Image(systemName: icon)
            }
           
            if(isEye){
                SecureField(placeholder, text: $password)
                    .focused($isFocused)
            }else{
                TextField(placeholder, text: $password)
                    .focused($isFocused)
            }
            
            
            Button {
                isEye.toggle()
            } label: {
                Image(systemName: isEye ? "eye" : "eye.slash")
            }

            
            
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor( isFocused ? Color.blue : Color.gray))
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    
    static var previews: some View {
        InputPasswordView(password: .constant(""), placeholder: "Password")
    }
}
