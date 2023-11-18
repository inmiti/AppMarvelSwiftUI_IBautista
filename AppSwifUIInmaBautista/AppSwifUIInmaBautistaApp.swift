//
//  AppSwifUIInmaBautistaApp.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

@main
struct AppSwifUIInmaBautistaApp: App {
    
    //ViewModel global
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
