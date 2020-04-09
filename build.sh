#!/bin/sh

set -e

echo "======== Building C++ version"
clang --version
clang -c -std=c++2a -O3 -o mutate-cpp.o mutate.cpp
echo "======== Building Rust version"
rustc --verbose --version
rustc --crate-type staticlib --emit=obj -O -o mutate-rust.o mutate.rs

echo "======== Running C++ version"
gcc mutate-cpp.o test-mutate.c
./a.out
echo "======== Running Rust version"
gcc mutate-rust.o test-mutate.c
./a.out

echo "======== C++ version assembly"
objdump --disassemble --disassembler-options=intel mutate-cpp.o
echo "======== Rust version assembly"
objdump --disassemble --disassembler-options=intel mutate-rust.o

echo "======== C++ version LLVM IR"
clang -S -emit-llvm -std=c++2a -O3 -o mutate-cpp.ll mutate.cpp
cat mutate-cpp.ll
echo "======== Rust version LLVM IR"
rustc --crate-type staticlib --emit=llvm-ir -O -o mutate-rust.ll mutate.rs
cat mutate-rust.ll
