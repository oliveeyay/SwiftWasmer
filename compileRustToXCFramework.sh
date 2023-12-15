#!/bin/bash

echo "Will do a bunch of stuff that will create a multi-platform XCFramework from the RustWasmer package"

# Remove previous xcframework, targets and Generated folder
rm -rf libRustWasmer.xcframework
rm -rf RustWasmer/target
rm -rf RustWasmer/Generated

# Go into the RustWasmer folder
cd RustWasmer

# Install MacOS and iOS rust targets
rustup target add aarch64-apple-ios aarch64-apple-ios-sim aarch64-apple-darwin

# Build Rust with cargo (need cargo and cross to be installed) - Covering every MacOS and iOS CPU architectures
cross build --release --target aarch64-apple-ios --target aarch64-apple-ios-sim --target aarch64-apple-darwin

# Move the headers to the headers folder
mv Generated/SwiftBridgeCore.h headers
mv Generated/RustWasmer/RustWasmer.h headers

# Generate the xcframework using xcode tools (pointing to libRustWasmer.a static lib and the headers)
xcrun xcodebuild -create-xcframework \
  -library target/aarch64-apple-ios/release/libRustWasmer.a -headers headers \
  -library target/aarch64-apple-ios-sim/release/libRustWasmer.a -headers headers \
  -library target/aarch64-apple-darwin/release/libRustWasmer.a -headers headers \
  -output ../libRustWasmer.xcframework

# Append correct bridging imports to swift files
sed -i '' '1s/^/import Rust\n/' Generated/SwiftBridgeCore.swift
sed -i '' '1s/^/import Rust\n\n/' Generated/RustWasmer/RustWasmer.swift

# Go back into the SwiftWasmer project
cd ..

# Move the swift files to the Swift SharedModule
mv RustWasmer/Generated/SwiftBridgeCore.swift SharedModule/Sources/SharedModule/Rust
mv RustWasmer/Generated/RustWasmer/RustWasmer.swift SharedModule/Sources/SharedModule/Rust

echo "Successfully done a bunch of stuff to create a multi-platform XCFramework from the RustWasmer package"
