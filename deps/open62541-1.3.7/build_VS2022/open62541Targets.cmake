# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.8)
   message(FATAL_ERROR "CMake >= 2.8.0 required")
endif()
if(CMAKE_VERSION VERSION_LESS "2.8.3")
   message(FATAL_ERROR "CMake >= 2.8.3 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.8.3...3.22)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_cmake_targets_defined "")
set(_cmake_targets_not_defined "")
set(_cmake_expected_targets "")
foreach(_cmake_expected_target IN ITEMS open62541::open62541)
  list(APPEND _cmake_expected_targets "${_cmake_expected_target}")
  if(TARGET "${_cmake_expected_target}")
    list(APPEND _cmake_targets_defined "${_cmake_expected_target}")
  else()
    list(APPEND _cmake_targets_not_defined "${_cmake_expected_target}")
  endif()
endforeach()
unset(_cmake_expected_target)
if(_cmake_targets_defined STREQUAL _cmake_expected_targets)
  unset(_cmake_targets_defined)
  unset(_cmake_targets_not_defined)
  unset(_cmake_expected_targets)
  unset(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT _cmake_targets_defined STREQUAL "")
  string(REPLACE ";" ", " _cmake_targets_defined_text "${_cmake_targets_defined}")
  string(REPLACE ";" ", " _cmake_targets_not_defined_text "${_cmake_targets_not_defined}")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_cmake_targets_defined_text}\nTargets not yet defined: ${_cmake_targets_not_defined_text}\n")
endif()
unset(_cmake_targets_defined)
unset(_cmake_targets_not_defined)
unset(_cmake_expected_targets)


# Create imported target open62541::open62541
add_library(open62541::open62541 SHARED IMPORTED)

set_target_properties(open62541::open62541 PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "UA_ARCHITECTURE_WIN32"
  INTERFACE_INCLUDE_DIRECTORIES "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/arch;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/src;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/arch/win32;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/include;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/plugins/include;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/deps;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/src/pubsub;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/src_generated"
  INTERFACE_LINK_LIBRARIES "\$<\$<NOT:\$<CONFIG:DEBUG>>:C:/Program Files/OpenSSL-Win64/lib/VC/libssl64MD.lib>;\$<\$<CONFIG:DEBUG>:C:/Program Files/OpenSSL-Win64/lib/VC/libssl64MDd.lib>;\$<\$<NOT:\$<CONFIG:DEBUG>>:C:/Program Files/OpenSSL-Win64/lib/VC/libcrypto64MD.lib>;\$<\$<CONFIG:DEBUG>:C:/Program Files/OpenSSL-Win64/lib/VC/libcrypto64MDd.lib>;ws2_32;iphlpapi"
)

# Import target "open62541::open62541" for configuration "Debug"
set_property(TARGET open62541::open62541 APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(open62541::open62541 PROPERTIES
  IMPORTED_IMPLIB_DEBUG "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/Debug/open62541.lib"
  IMPORTED_LOCATION_DEBUG "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/Debug/open62541.dll"
  )

# Import target "open62541::open62541" for configuration "Release"
set_property(TARGET open62541::open62541 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(open62541::open62541 PROPERTIES
  IMPORTED_IMPLIB_RELEASE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/Release/open62541.lib"
  IMPORTED_LOCATION_RELEASE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/Release/open62541.dll"
  )

# Import target "open62541::open62541" for configuration "MinSizeRel"
set_property(TARGET open62541::open62541 APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(open62541::open62541 PROPERTIES
  IMPORTED_IMPLIB_MINSIZEREL "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/MinSizeRel/open62541.lib"
  IMPORTED_LOCATION_MINSIZEREL "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/MinSizeRel/open62541.dll"
  )

# Import target "open62541::open62541" for configuration "RelWithDebInfo"
set_property(TARGET open62541::open62541 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(open62541::open62541 PROPERTIES
  IMPORTED_IMPLIB_RELWITHDEBINFO "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/RelWithDebInfo/open62541.lib"
  IMPORTED_LOCATION_RELWITHDEBINFO "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/bin/RelWithDebInfo/open62541.dll"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
