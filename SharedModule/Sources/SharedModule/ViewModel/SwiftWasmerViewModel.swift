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
        
    func swiftCallToRustWasmerWat() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let swiftWasmerResult = call_wasmer()
        print("SwiftWasmer result: \(swiftWasmerResult)")
        let endTime = CFAbsoluteTimeGetCurrent()
        print("SwiftWasmer time: \(endTime - startTime)")
    }
    
    
    func swiftCallToRustWasmerBinary() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        // Get the wasm binary data
        let wasmURL = Bundle.module.url(forResource: "sum", withExtension: "wasm")
        let wasmData = try! Data(contentsOf: wasmURL!)
        print("\(wasmData.count)")
        
        wasmData.withUnsafeBytes { (wasmPointer: UnsafeRawBufferPointer) in
            let swiftWasmerResult = call(wasmPointer.assumingMemoryBound(to: UInt8.self))
            print("SwiftWasmer result: \(swiftWasmerResult)")
            let endTime = CFAbsoluteTimeGetCurrent()
            print("SwiftWasmer time: \(endTime - startTime)")
        }
    }
}
