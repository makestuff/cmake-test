cmake_minimum_required(VERSION 3.13)
project(cmake-test)

# Use a single output directory for everything
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Turn warning level up, and use C++17
if(MSVC)
  add_compile_options(/W4 /WX)
else()
  add_compile_options(-Wall -Wextra -pedantic -Werror)
endif()
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS 0)

# Maybe build GoogleTest
if(BUILD_TESTING)
  include(CTest)
  set(GOOGLETEST_VERSION 1.10.0)
  add_subdirectory("googletest/googlemock")
endif()

# Build components
add_subdirectory("libfoo")
add_subdirectory("app")
