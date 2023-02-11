cmake_minimum_required(VERSION 3.20)
project(OPCUA_dev)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_COMPILE_FEATURES)

find_package(open62541 REQUIRED)
find_package(OpenSSL REQUIRED)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

add_subdirectory(src)