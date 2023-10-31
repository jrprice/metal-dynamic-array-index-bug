# Reproducer for an internal compiler error in the AMD Metal driver

See `shaders.metal` for the MSL code.

## Reproduced on:

```
 macOS: Sonoma 14.7
 Model Name: MacBook Pro
 GPU: Radeon Pro 555X
```

Does not reproduce on Intel or Apple GPUs.

## Building and Running

```bash
make
./metal-dynamic-array-index-bug
```

On a machine with an AMD GPU it produces:
```
Device: Intel(R) UHD Graphics 630
Render pipeline created successfully.

Device: AMD Radeon Pro 555X
2024-09-26 10:04:06.342 metal-dynamic-array-index-bug[66390:1272141] Failed to created pipeline state object, error Error Domain=CompilerError Code=2 "Compiler encountered an internal error" UserInfo={NSLocalizedDescription=Compiler encountered an internal error}.
```
