project(app)

# Create an executable
file(GLOB CPP_SOURCES *.cpp)
add_executable(${PROJECT_NAME} ${CPP_SOURCES})

# Link with "foo" library
target_link_libraries(${PROJECT_NAME} PRIVATE foo)

# What to install
install(TARGETS ${PROJECT_NAME}
  DESTINATION bin
)
