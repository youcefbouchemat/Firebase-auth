//
//  HomeScreen.swift
//  Firebase-auth
//
//  Created by apple on 1/3/2023.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var sessionObject: SessionViewModal
    var body: some View {
        VStack(spacing: 20) {
            VStack{
                Text("You are logged in \(sessionObject.sessionDetails?.email ?? "")")
                Text("You can logout from here")
            }
            ButtonView(title: "Login"){
                sessionObject.logout()
            }
        }
        .navigationTitle("Home")
        .padding()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeScreen()
                .environmentObject(SessionService())
        }
    }
}
