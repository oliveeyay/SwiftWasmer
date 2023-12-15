#[swift_bridge::bridge]
mod ffi {
    extern "Rust" {
        pub fn call_wasmer() -> bool;
    }
}

pub fn call_wasmer() -> bool {
    return true
}
