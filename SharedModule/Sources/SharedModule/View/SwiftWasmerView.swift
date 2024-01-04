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
                swiftWasmerViewModel.swiftCallToRustWasmerBinaryMemoryStaticLimited()
            }) {
                Text("Launch Wasm Memory Program (Static Limited to 512mb)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .buttonStyle(.borderless)
            .padding()
            
            Button(action: {
                swiftWasmerViewModel.swiftCallToRustWasmerBinaryMemoryDynamic()
            }) {
                Text("Launch Wasm Memory Program (Dynamic)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .buttonStyle(.borderless)
            .padding()
            
            Button(action: {
                swiftWasmerViewModel.swiftCallToRustWasmerBinaryMemoryDefault()
            }) {
                Text("Launch Wasm Memory Program (Default - Crash)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .cornerRadius(40)
            }
            .buttonStyle(.borderless)
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
