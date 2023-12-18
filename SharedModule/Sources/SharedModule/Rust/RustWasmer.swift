import Rust

public func call_sum_wat() -> Int32 {
    __swift_bridge__$call_sum_wat()
}
public func call_sum_binary(_ wasm_program: UnsafeBufferPointer<UInt8>) -> Bool {
    __swift_bridge__$call_sum_binary(wasm_program.toFfiSlice())
}
public func call_memory_fill_binary(_ wasm_program: UnsafeBufferPointer<UInt8>) -> Bool {
    __swift_bridge__$call_memory_fill_binary(wasm_program.toFfiSlice())
}
public func call_memory_test_wat() -> Bool {
    __swift_bridge__$call_memory_test_wat()
}


