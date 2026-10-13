@echo off
rem Minimal CI script for local build, build dir creation, configure, build and run tests.

rem Create build directory if it doesn't exist
if not exist "build" (
    echo Creating build directory...
    mkdir "build"
)

rem Enter build directory
pushd "build" || (
    echo Failed to enter build directory.
    exit /b 1
)

rem Configure project
echo Configuring project with CMake...
cmake .. 
if errorlevel 1 (
    echo CMake configuration failed.
    popd
    exit /b 1
)

rem Build project
echo Building project...
cmake --build .
if errorlevel 1 (
    echo Build failed.
    popd
    exit /b 1
)

rem Run tests with CTest, explicitly specify Debug configuration and show output on failure
echo Running tests...
ctest -C Debug --output-on-failure
if errorlevel 1 (
    echo Some tests failed.
    popd
    exit /b 1
)

echo All steps completed successfully.
popd
exit /b 0