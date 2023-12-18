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
                swiftWasmerViewModel.swiftCallToRustWasmerWatSum()
            }) {
                Text("Launch Wasm Sum Program (wat)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .padding()
            
            Button(action: {
                swiftWasmerViewModel.swiftCallToRustWasmerBinarySum()
            }) {
                Text("Launch Wasm Sum Program (binary)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .padding()
            
            Button(action: {
                swiftWasmerViewModel.swiftCallToRustWasmerBinaryMemoryFill()
            }) {
                Text("Launch Wasm Memory Program (binary)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .padding()
            
            Button(action: {
                swiftWasmerViewModel.swiftCallToRustWasmerBinaryMemoryTest()
            }) {
                Text("Launch Wasm Memory Program (binary)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .padding()
            
            Text("Test a Rust Wasmer call from Swift by clicking one of the button")
                .padding()
        }
        .padding()
    }
}

#Preview {
    SwiftWasmerView()
}
