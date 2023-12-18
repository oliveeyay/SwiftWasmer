import Rust

public func call_wasmer() -> Int32 {
    __swift_bridge__$call_wasmer()
}
public func call(_ wasm_program: UnsafeBufferPointer<UInt8>) -> Bool {
    __swift_bridge__$call(wasm_program.toFfiSlice())
}


