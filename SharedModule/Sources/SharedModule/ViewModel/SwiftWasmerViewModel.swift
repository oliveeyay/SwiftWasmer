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
    
    func swiftCallToRustWasmerBinaryMemoryDefault() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let swiftWasmerResult = call_memory_with_default_tunables()
        print("SwiftWasmer result: \(swiftWasmerResult)")
        let endTime = CFAbsoluteTimeGetCurrent()
        print("SwiftWasmer time: \(endTime - startTime)")
    }
    
    func swiftCallToRustWasmerBinaryMemoryStaticLimited() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let swiftWasmerResult = call_memory_with_limited_static_tunables()
        print("SwiftWasmer result: \(swiftWasmerResult)")
        let endTime = CFAbsoluteTimeGetCurrent()
        print("SwiftWasmer time: \(endTime - startTime)")
    }
    
    func swiftCallToRustWasmerBinaryMemoryDynamic() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let swiftWasmerResult = call_memory_with_dynamic_tunables()
        print("SwiftWasmer result: \(swiftWasmerResult)")
        let endTime = CFAbsoluteTimeGetCurrent()
        print("SwiftWasmer time: \(endTime - startTime)")
    }
}
