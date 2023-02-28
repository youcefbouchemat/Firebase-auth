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
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white
    var border: Color = .clear
    let handler: ActionHandler
    
    private let radius: CGFloat = 10
    
    var body: some View {
        Button(action: handler) {
            Text(title)
                .frame(maxWidth: .infinity,maxHeight: 50)
                .font(.system(size: 16,weight: .bold))
        }
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(radius)
            .overlay(RoundedRectangle(cornerRadius: radius)
                .stroke(lineWidth: 1).foregroundColor(border))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Login"){}
    }
}
