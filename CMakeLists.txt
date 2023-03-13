cmake_minimum_required(VERSION 3.20)
project(OPCUA_dev)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_COMPILE_FEATURES)
set(THREADS_PREFER_PTHREAD_FLAG ON)

set(CMAKE_PREFIX_PATH "C:/Library/open62541")

find_package(open62541 REQUIRED COMPONENTS)
find_package(OpenSSL REQUIRED COMPONENTS)

link_directories("C:/Library/open62541/lib")
include_directories("C:/Library/open62541/include")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

add_subdirectory(src)