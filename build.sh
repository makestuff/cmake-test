#!/bin/sh

CONFIG=Debug
if [ $# -eq 1 ]; then
  CONFIG=$1
fi

if [ ! -e build ]; then
  mkdir build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=${CONFIG} \
    -DBUILD_TESTING=1 \
    -DCMAKE_VERBOSE_MAKEFILE=0 \
    -DCMAKE_INSTALL_PREFIX=../install \
    -DCMAKE_INSTALL_RPATH=\$ORIGIN \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    ..
  cd ..
fi
cmake --build build --target install
