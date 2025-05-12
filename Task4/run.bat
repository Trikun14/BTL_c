@echo off
setlocal enabledelayedexpansion

rem Khởi tạo lệnh build cơ bản (chưa có *.cpp)
set BUILD_CMD=g++ -std=c++17 -o main.exe -Iinclude -Itest -Itest\unit_test_Task4 -g main.cpp ^
 test\unit_test_Task4\unit_test_Task4.cpp test\unit_test.cpp ^
 src\hcmcampaign.cpp

rem Thêm tất cả các .cpp trong test\unit_test_Task4\test_case\
for %%f in (test\unit_test_Task4\test_case\*.cpp) do (
    set BUILD_CMD=!BUILD_CMD! %%f
)

echo Building project Task4 VOTIEN with command:
echo !BUILD_CMD!
echo ----------------------------------------

call !BUILD_CMD!
if %errorlevel% equ 0 (
    echo Build successful!
    echo ----------------------------------------
    echo To run tests, use one of the following commands:
    echo 1. Run all tests: main.exe
    echo 2. Run a specific test: main.exe nameFunctionUnitTest
) else (
    echo Build failed!
    exit /b 1
)