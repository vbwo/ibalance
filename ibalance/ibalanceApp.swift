//
//  ibalanceApp.swift
//  ibalance
//
//  Created by Vitória Beltrão Wenceslau do Ó on 08/05/24.
//

import SwiftUI

@main
struct ibalanceApp: App {
    @State private var selectedDayIndex = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView(screen: .constant(2), selectedDayIndex: $selectedDayIndex)
        }
    }
}

