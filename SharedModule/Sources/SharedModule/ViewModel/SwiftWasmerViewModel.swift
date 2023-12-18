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
        
    func swiftCallToRustWasmerWatSum() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let swiftWasmerResult = call_sum_wat()
        print("SwiftWasmer result: \(swiftWasmerResult)")
        let endTime = CFAbsoluteTimeGetCurrent()
        print("SwiftWasmer time: \(endTime - startTime)")
    }
    
    func swiftCallToRustWasmerBinarySum() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        // Get the wasm binary data
        let wasmURL = Bundle.module.url(forResource: "sum", withExtension: "wasm")
        let wasmData = try! Data(contentsOf: wasmURL!)
        print("\(wasmData.count)")
        
        wasmData.withUnsafeBytes { (wasmPointer: UnsafeRawBufferPointer) in
            let swiftWasmerResult = call_sum_binary(wasmPointer.assumingMemoryBound(to: UInt8.self))
            print("SwiftWasmer result: \(swiftWasmerResult)")
            let endTime = CFAbsoluteTimeGetCurrent()
            print("SwiftWasmer time: \(endTime - startTime)")
        }
    }
    
    func swiftCallToRustWasmerBinaryMemory() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        // Get the wasm binary data
        let wasmURL = Bundle.module.url(forResource: "memory", withExtension: "wasm")
        let wasmData = try! Data(contentsOf: wasmURL!)
        print("\(wasmData.count)")
        
        wasmData.withUnsafeBytes { (wasmPointer: UnsafeRawBufferPointer) in
            let swiftWasmerResult = call_memory_binary(wasmPointer.assumingMemoryBound(to: UInt8.self))
            print("SwiftWasmer result: \(swiftWasmerResult)")
            let endTime = CFAbsoluteTimeGetCurrent()
            print("SwiftWasmer time: \(endTime - startTime)")
        }
    }
}
