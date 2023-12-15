//
//  SwiftWasmerViewModel.swift
//  
//
//  Created by Olivier Goutay on 15/12/2023.
//

import Foundation
import Rust

public class SwiftWasmerViewModel: ObservableObject {
    
    public init() {}
        
    func swiftCallToRustWasmer() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let swiftWasmerResult = call_wasmer()
        print("SwiftWasmer result: \(swiftWasmerResult)")
        let endTime = CFAbsoluteTimeGetCurrent()
        print("SwiftWasmer time: \(endTime - startTime)")
    }
}
