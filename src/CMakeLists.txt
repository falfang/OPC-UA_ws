# Source codes using open62541
add_executable(server_AddMethodToObject AddMethodToObject.c)
target_link_libraries(server_AddMethodToObject open62541 OpenSSL::Crypto)