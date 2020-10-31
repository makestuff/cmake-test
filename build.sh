#!/bin/sh
if [ ! -e build ]; then
  mkdir build
  cd build
  cmake \
    -DBUILD_TESTING=1 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/tmp/chris \
    -DCMAKE_VERBOSE_MAKEFILE=0 \
    -DCMAKE_INSTALL_RPATH=\$ORIGIN \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    ..
  cd ..
  ln -s build/compile_commands.json compile_commands.json
fi
cmake --build build --target install
