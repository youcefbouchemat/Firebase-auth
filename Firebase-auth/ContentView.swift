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
        LoginScreen()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
