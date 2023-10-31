metal-dynamic-array-index-bug: main.m shaders.metallib
	clang++ -fmodules -framework CoreGraphics main.m -o $@

shaders.metallib: shaders.metal
	xcrun metal shaders.metal -o $@

clean:
	rm -f metal-dynamic-array-index-bug shaders.metallib

.PHONY: clean
