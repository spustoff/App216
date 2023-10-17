//
//  App216App.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_1Lw2P3AihsD5pv7EN3fxsJTKc52343")
        Amplitude.instance().initializeApiKey("98e173af7927b88e618d8ceeffd3eb1f")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App216App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
