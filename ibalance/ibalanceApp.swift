//
//  ibalanceApp.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 08/05/24.
//

import SwiftUI

@main
struct ibalanceApp: App {
    
    @StateObject private var sharedData = SharedData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(screen: .constant(2))
                .environmentObject(sharedData)
        }
    }
}
