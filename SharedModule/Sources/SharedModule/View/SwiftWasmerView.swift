//
//  SwiftWasmerView.swift
//  
//
//  Created by Olivier Goutay on 15/12/2023.
//

import SwiftUI

public struct SwiftWasmerView: View {
    @EnvironmentObject private var swiftWasmerViewModel: SwiftWasmerViewModel
    
    public init() {}
    
    public var body: some View {
        VStack {
            Button(action: {
                swiftWasmerViewModel.swiftCallToRustWasmer()
            }) {
                Text("Launch Wasm Program")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .padding()
            
            Text("Test a Rust Wasmer call from Swift by clicking on the button")
                .padding()
        }
        .padding()
    }
}

#Preview {
    SwiftWasmerView()
}