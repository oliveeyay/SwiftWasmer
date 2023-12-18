use wasmer::{imports, EngineBuilder, Instance, Module, Store, Value};
use wasmer_compiler_cranelift::Cranelift;

#[swift_bridge::bridge]
mod ffi {
    extern "Rust" {
        pub fn call_wasmer() -> i32;
        pub fn call(wasm_program: &[u8]) -> bool;
    }
}

pub fn call_wasmer() -> i32 {
    let wasm_bytes = wat::parse_str(
        r#"
(module
  (type $sum_t (func (param i32 i32) (result i32)))
  (func $sum_f (type $sum_t) (param $x i32) (param $y i32) (result i32)
    local.get $x
    local.get $y
    i32.add)
  (export "sum" (func $sum_f)))
"#
    ).unwrap();

    println!("Creating Universal engine...");
    // Define the engine that will drive everything.
    //
    // In this case, the engine is `wasmer_compiler` which roughly
    // means that the executable code will live in memory.
    let compiler_config = Cranelift::default();
    let engine = EngineBuilder::new(compiler_config);

    // Create a store, that holds the engine.
    let mut store = Store::new(engine);

    println!("Compiling module...");
    // Here we go.
    //
    // Let's compile the Wasm module. It is at this step that the Wasm
    // text is transformed into Wasm bytes (if necessary), and then
    // compiled to executable code by the compiler, which is then
    // stored in memory by the engine.
    let module = Module::new(&store, wasm_bytes).unwrap();

    // Congrats, the Wasm module is compiled! Now let's execute it for
    // the sake of having a complete example.

    // Create an import object. Since our Wasm module didn't declare
    // any imports, it's an empty object.
    let import_object = imports! {};

    println!("Instantiating module...");
    // And here we go again. Let's instantiate the Wasm module.
    let instance = Instance::new(&mut store, &module, &import_object).unwrap();

    println!("Calling `sum` function...");
    // The Wasm module exports a function called `sum`.
    let sum = instance.exports.get_function("sum").unwrap();
    let results = sum.call(&mut store, &[Value::I32(1), Value::I32(2)]).unwrap();

    println!("Results: {:?}", results);
    assert_eq!(results.to_vec(), vec![Value::I32(3)]);

    return (*results)[0].i32().unwrap()
}

// Call the sum program from a wasm program in binary format
pub fn call(wasm_program: &[u8]) -> bool {
    let wasm_bytes = wasm_program.to_vec();
    let compiler_config = Cranelift::default();
    let engine = EngineBuilder::new(compiler_config);
    let mut store = Store::new(engine);
    let module = Module::new(&store, wasm_bytes).unwrap();
    let import_object = imports! {};
    let instance = Instance::new(&mut store, &module, &import_object).unwrap();
    let sum = instance.exports.get_function("addTwo").unwrap();
    let results = sum.call(&mut store, &[Value::I32(1), Value::I32(2)]).unwrap();
    println!("Results: {:?}", results);
    assert_eq!(results.to_vec(), vec![Value::I32(3)]);
    return results.to_vec() == vec![Value::I32(3)]
}
