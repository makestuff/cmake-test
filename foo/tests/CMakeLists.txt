# Create a test-driver executable
file(GLOB CPP_SOURCES *.cpp)
add_executable(tests ${CPP_SOURCES})

# Link with GoogleTest and the foo library itself
target_link_libraries(tests PRIVATE foo gtest gmock)
