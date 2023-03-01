//
//  CloseModifier.swift
//  Firebase-auth
//
//  Created by apple on 1/3/2023.
//

import Foundation
import SwiftUI


struct CloseModifier: ViewModifier{
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(UIColor.systemBackground))
                }
            }
    }
}

extension View{
    func applyClose() -> some View{
        self.modifier(CloseModifier())
    }
}

