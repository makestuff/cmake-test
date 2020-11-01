@echo off
setlocal
if not exist build (
  md build
  cd build
  cmake ^
    -DBUILD_TESTING=1 ^
    -DCMAKE_VERBOSE_MAKEFILE=0 ^
    -DCMAKE_INSTALL_PREFIX=../install ^
    -Dgtest_force_shared_crt=ON ^
    -A x64 ^
    ..
  cd ..
)
cmake --build build --config Debug --target install
cd build
ctest -C Debug --verbose
endlocal
