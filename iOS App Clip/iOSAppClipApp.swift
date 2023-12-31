//
//  iOS_App_ClipApp.swift
//  iOS App Clip
//
//  Created by Olivier Goutay on 15/12/2023.
//

import SwiftUI
import SharedModule

@main
struct iOS_App_ClipApp: App {
    @StateObject private var swiftWasmerViewModel = SwiftWasmerViewModel()
    
    var body: some Scene {
        WindowGroup {
            SwiftWasmerView()
                .environmentObject(swiftWasmerViewModel)
        }
    }
}
