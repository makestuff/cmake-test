@echo off
md build
cd build
cmake -DBUILD_TESTING=1 -Dgtest_force_shared_crt=ON -A x64 ..
cd ..
cmake --build build
cd build
ctest
