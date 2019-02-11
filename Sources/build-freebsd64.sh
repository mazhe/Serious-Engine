#!/bin/sh

NCPU=`sysctl -n hw.ncpu`
let NCPU=`expr $NCPU + 2`
echo "Will build with 'make -j$NCPU' ... please edit this script if incorrect."

set -e
set -x

cmake_build=`dirname $0`/cmake-build
rm -rf $cmake_build
mkdir $cmake_build
cd $cmake_build
#cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 ..
#ninja

# This is the eventual path for amd64.
cmake -DCMAKE_BUILD_TYPE=Debug ..

# Right now we force x86, though...
#cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 ..

make -j$NCPU

