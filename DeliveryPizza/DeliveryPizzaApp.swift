//
//  DeliveryPizzaApp.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 22/02/2023.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct DeliveryPizzaApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            return true
        }
        
    }
    
}
