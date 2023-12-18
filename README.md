# SwiftWasmer
Demonstrates how to call Wasmer through Rust from a Swift Multiplatform app (iOS, MacOS).

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
