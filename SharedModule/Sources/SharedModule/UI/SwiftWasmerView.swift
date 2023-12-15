//
//  SwiftUIView.swift
//  
//
//  Created by Olivier Goutay on 15/12/2023.
//

import SwiftUI

public struct SwiftWasmerView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    SwiftWasmerView()
}
