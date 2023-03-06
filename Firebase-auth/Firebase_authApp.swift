//
//  Firebase_authApp.swift
//  Firebase-auth
//
//  Created by apple on 28/2/2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Firebase_authApp: App {
    //Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var sessionObject = SessionService()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionObject.state{
                case .loggedOut:
                    LoginScreen()
                case .loggedIn:
                    HomeScreen()
                        .environmentObject(sessionObject)
                }
                
            }
        }
    }
}
