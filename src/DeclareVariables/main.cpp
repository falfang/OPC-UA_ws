#include <iostream>
#include "AddVar.h"

static volatile UA_Boolean running = true;

static void stopHandler(int sign) {
	UA_LOG_INFO(UA_Log_Stdout, UA_LOGCATEGORY_SERVER, "received Ctrl+C");
	running = false;
}

int main() {
	signal(SIGINT, stopHandler);
	signal(SIGTERM, stopHandler);

	UA_Server* server = UA_Server_new();
	UA_ServerConfig_setDefault(UA_Server_getConfig(server));
	UA_ServerConfig* config = UA_Server_getConfig(server);
	config->verifyRequestTimestamp = UA_RULEHANDLING_ACCEPT;

	addVariable(server);
	addMatrixVariable(server);
	writeVariable(server);

	UA_StatusCode retval = UA_Server_run(server, &running);

	UA_Server_delete(server);
	return retval == UA_STATUSCODE_GOOD ? EXIT_SUCCESS : EXIT_FAILURE;
}