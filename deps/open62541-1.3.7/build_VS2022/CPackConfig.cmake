# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7;C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022")
set(CPACK_CMAKE_GENERATOR "Visual Studio 17 2022")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "open62541 team")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "C:/Library/CMake/share/cmake-3.24/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "open62541 built using CMake")
set(CPACK_DMG_SLA_USE_RESOURCE_FILE_LICENSE "ON")
set(CPACK_GENERATOR "TGZ;DEB;RPM")
set(CPACK_INSTALL_CMAKE_PROJECTS "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022;open62541;ALL;/")
set(CPACK_INSTALL_PREFIX "C:/Program Files (x86)/open62541")
set(CPACK_MODULE_PATH "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/tools/cmake")
set(CPACK_NSIS_DISPLAY_NAME "open62541 1.3.6-undefined")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES64")
set(CPACK_NSIS_PACKAGE_NAME "open62541 1.3.6-undefined")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/CPackConfig.cmake")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION "open62541 is a C-based library (linking with C++ projects is possible) with all necessary tools to implement dedicated OPC UA clients and servers, or to integrate OPC UA-based communication into existing applications.")
set(CPACK_PACKAGE_DESCRIPTION_FILE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/README.md")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "OPC UA implementation")
set(CPACK_PACKAGE_FILE_NAME "open62541-1.3.6-undefined-win64")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "open62541 1.3.6-undefined")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "open62541 1.3.6-undefined")
set(CPACK_PACKAGE_NAME "open62541")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "open62541 team")
set(CPACK_PACKAGE_VERSION "1.3.6-undefined")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "3")
set(CPACK_PACKAGE_VERSION_PATCH "6-undefined")
set(CPACK_RESOURCE_FILE_LICENSE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/LICENSE")
set(CPACK_RESOURCE_FILE_README "C:/Library/CMake/share/cmake-3.24/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "C:/Library/CMake/share/cmake-3.24/Templates/CPack.GenericWelcome.txt")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_7Z "ON")
set(CPACK_SOURCE_GENERATOR "7Z;ZIP")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/CPackSourceConfig.cmake")
set(CPACK_SOURCE_ZIP "ON")
set(CPACK_SYSTEM_NAME "win64")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "win64")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "C:/OPC-UA_ws/open62541_ws/deps/open62541-1.3.7/build_VS2022/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()