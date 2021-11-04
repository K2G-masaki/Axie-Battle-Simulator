//
//  Axie_Battle_SimulatorApp.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/01.
//

import SwiftUI
import Firebase 

@main
struct Axie_Battle_SimulatorApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate : NSObject,UIApplicationDelegate {
    
    func application(_ application : UIApplication,
                     didFinishLaunchingWithOptions launchoptions : [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        FirebaseApp.configure()
        
        return true
    }
    
}
