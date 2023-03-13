# Source codes using open62541
add_executable(server_AddMethodToObject AddMethodToObject.c)
target_link_libraries(server_AddMethodToObject open62541 ws2_32 wsock32 OpenSSL::Crypto)   # Got an error

#add_executable(server_AddVariableToAServer AddVariableToAServer.c)
#target_link_libraries(server_AddVariableToAServer OpenSSL::Crypto open62541)