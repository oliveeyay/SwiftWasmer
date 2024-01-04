mod memory_default;
mod memory_dynamic;
mod memory_static_limited;

#[swift_bridge::bridge]
mod ffi {
    extern "Rust" {
        pub fn call_memory_with_default_tunables() -> bool;
        pub fn call_memory_with_limited_static_tunables() -> bool;
        pub fn call_memory_with_dynamic_tunables() -> bool;
    }
}

pub fn call_memory_with_default_tunables() -> bool {
    memory_default::call_memory_test()
}

pub fn call_memory_with_limited_static_tunables() -> bool {
    memory_static_limited::call_memory_test()
}

pub fn call_memory_with_dynamic_tunables() -> bool {
    memory_dynamic::call_memory_test()
}
