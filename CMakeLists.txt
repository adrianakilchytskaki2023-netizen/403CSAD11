cmake_minimum_required(VERSION 3.14)

project(HelloWorld LANGUAGES CXX)

# Use a modern, portable C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Main executable 'hello' — include implementation file math_operations.cpp
add_executable(hello
    main.cpp
    math_operations.cpp
)

# FetchContent to bring in GoogleTest from the git repository (avoid 404 on zip URL)
include(FetchContent)

# Ensure GTest uses the shared CRT on Windows (helps MSVC linkage)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        v1.14.0
)
FetchContent_MakeAvailable(googletest)

# Enable CTest and create test executable that links to GTest::gtest_main
enable_testing()

add_executable(unit_tests
    tests/unit_tests.cpp
    math_operations.cpp
)

target_link_libraries(unit_tests PRIVATE GTest::gtest_main)

# Ensure both targets use consistent C++ standard properties
set_target_properties(hello unit_tests PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)

# Register the test with CTest
add_test(NAME unit_tests COMMAND unit_tests)