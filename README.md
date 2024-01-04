# SwiftWasmer
Demonstrates how to call Wasmer through Rust from a Swift Multiplatform app (iOS, MacOS).

## Making Wasmer work with iOS
If a wasm program is ran on iOS and uses some memory in some capacity, an error will happen:
`Failed to create memory: Error when allocating memory: Cannot allocate memory (os error 12)`

Example of issues opened related to this: https://github.com/wasmerio/wasmer/issues/4343

To circumvent this issue, you need to tune the memory (style or size) of the Wasmer VM. Three examples are available in this repository:
1. A default Store with a default Memory -> [Default Memory](RustWasmer/src/memory_default.rs) (it will crash)
2. A Static Memory Style (implementing BaseTunables directly) -> [Static Limited Memory](RustWasmer/src/memory_static_limited.rs)
3. A Dynamic Memory Style (composing Tunables to override and force the MemoryStyle) -> [Default Memory](RustWasmer/src/memory_dynamic.rs)

In my tests, using a limited static memory style was more performant than a dynamic style. It might depend on your program and needs.

# How to build

## What do you need to build the project
- Preferrably an ARM-based Mac (M1/2/3) - Rust can also be cross-compiled on x86 with cargo/cross
- [XCode](https://developer.apple.com/xcode/resources/) and XCode tools (run the command `xcode-select --install`)
- [RustUp](https://www.rust-lang.org/tools/install) and [Cross](https://github.com/cross-rs/cross)

## How to run
1. Execute `compileRustToXCFramework.sh`. It will compile the `RustWasmer` package to 3 targets (iOS, iOS Simulator, MacOS) and create an XCFramework which contains each of these static libraries, as well as the headers necessary to bridge to Swift directly
2. Clean the project every time you execute `compileRustToXCFramework.sh` (in XCode: Product > Clean Build Folder) 
3. Run the target you want to test on (one from `MacOS`, `iOS`, `iOS App Clip`)
4. If selecting `iOS` and `iOS App Clip`, you can choose between running on an emulator, or on a real iPhone (the later needs a developer provisioning profile)
5. Note: A real iPhone is needed to reproduce the issues we've seen with memory usage/reference (working fine on simulators or MacOS).

Note: Code-signing might fail if you don't have an Apple Developer's provisioning profile setup on your machine. You can change each of the target's signature config by clicking on each target and selecting `Signing & Capabilities` > `Signing Certificate` > `Sign to run locally`.
