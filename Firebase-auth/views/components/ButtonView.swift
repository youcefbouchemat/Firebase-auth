//
//  ButtonView.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    var backgroundColor: Color
    var foregroundColor: Color
    var border: Color
    let handler: ActionHandler
    var isLoading: Bool
    
    internal init(title: String,
                  backgroundColor: Color = .blue,
                  foregroundColor: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ActionHandler,
                  isLoading: Bool = false) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.border = border
        self.handler = handler
        self.isLoading = isLoading
    }
    
    private let radius: CGFloat = 10
    
    var body: some View {
        Button(action: handler) {
            if(isLoading)
            {
                ProgressView()
                    .tint(.white)
            }else{
                Text(title)
                    .font(.system(size: 16,weight: .bold))
            }
            
        }
            .frame(maxWidth: .infinity,maxHeight: 50)
            .disabled(isLoading)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(radius)
            .overlay(RoundedRectangle(cornerRadius: radius)
                .stroke(lineWidth: 1).foregroundColor(border))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Login",isLoading: true){}
    }
}
