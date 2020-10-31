cmake_minimum_required(VERSION 3.13)

# Turn warning level up, and use C++17
if(MSVC)
  add_compile_options(/W4 /WX)
else()
  add_compile_options(-Wall -Wextra -pedantic -Werror)
endif()
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS 0)

if(BUILD_TESTING)
  set(GOOGLETEST_VERSION 1.10.0)
  add_subdirectory("googletest/googlemock")
endif()
add_subdirectory("foo")
add_subdirectory("app")
