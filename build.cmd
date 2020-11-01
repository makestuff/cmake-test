@echo off
md build
cd build
cmake -DBUILD_TESTING=1 -DCMAKE_INSTALL_PREFIX=install -Dgtest_force_shared_crt=ON -A x64 ..
cd ..
cmake --build build --config Debug
cd build
ctest -C Debug
