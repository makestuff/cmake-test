@echo off
md build
cd build
cmake -DBUILD_TESTING=1 -DCMAKE_BUILD_TYPE=Debug -Dgtest_force_shared_crt=ON -A x64 ..
cd ..
cmake --build build
cd build
ctest -D Debug
