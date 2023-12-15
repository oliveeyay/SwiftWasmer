//
//  SwiftWasmerApp.swift
//  SwiftWasmer
//
//  Created by Olivier Goutay on 15/12/2023.
//

import SwiftUI
import SharedModule

@main
struct SwiftWasmerApp: App {
    @StateObject private var swiftWasmerViewModel = SwiftWasmerViewModel()
    
    var body: some Scene {
        WindowGroup {
            SwiftWasmerView()
                .environmentObject(swiftWasmerViewModel)
        }
    }
}
