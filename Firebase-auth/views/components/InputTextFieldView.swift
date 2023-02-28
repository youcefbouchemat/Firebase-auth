//
//  InputTextFieldView.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI

struct InputTextFieldView: View {
    @Binding var text: String
    let placeholder: String
    var icon: String = ""
    let keyboardType: UIKeyboardType
    
    @State private var isFocused:Bool = false
    
    
    var body: some View {
        HStack {
            if(!icon.isEmpty)
            {
                Image(systemName: icon)
            }
           
            TextField(placeholder, text: $text,onEditingChanged: { focus in
                isFocused = focus;
            })
                .keyboardType(keyboardType)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor( isFocused ? Color.blue : Color.gray))
    
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
        
    }
}
