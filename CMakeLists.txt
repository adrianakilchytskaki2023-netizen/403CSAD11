cmake_minimum_required(VERSION 3.14)

project(HelloWorld LANGUAGES CXX)

# Create executable 'hello' from main.cpp
add_executable(hello main.cpp)

# Enforce a modern, portable C++ standard (optional but recommended)
set_target_properties(hello PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)