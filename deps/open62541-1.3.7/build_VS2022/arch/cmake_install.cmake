# Install script for directory: C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/arch

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/open62541")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/arch/posix/cmake_install.cmake")
  include("C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/arch/win32/cmake_install.cmake")
  include("C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/arch/freertosLWIP/cmake_install.cmake")
  include("C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/arch/vxworks/cmake_install.cmake")
  include("C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/arch/eCos/cmake_install.cmake")
  include("C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/arch/wec7/cmake_install.cmake")

endif()
