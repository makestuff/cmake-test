project(foo)

# Create a shared library
file(GLOB CPP_SOURCES src/*.cpp)
add_library(${PROJECT_NAME} SHARED ${CPP_SOURCES})

# Ensure clients can find the includes
target_include_directories(${PROJECT_NAME}
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# What to install
file(GLOB CPP_HEADERS include/${PROJECT_NAME}/*.h)
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER ${CPP_HEADERS})
install(TARGETS ${PROJECT_NAME}
  LIBRARY DESTINATION bin
  PUBLIC_HEADER DESTINATION include/${PROJECT_NAME}
)

# Maybe build tests
if(BUILD_TESTING)
  add_subdirectory(tests)
endif()
