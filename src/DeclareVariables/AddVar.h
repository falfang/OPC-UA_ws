#pragma once

#include <open62541/plugin/log_stdout.h>
#include <open62541/server.h>
#include <open62541/server_config_default.h>

#include <csignal>
#include <cstdlib>
#include <iostream>

void a();

void addVariable(UA_Server* server);

void addMatrixVariable(UA_Server* server);

void writeVariable(UA_Server* server);

void writeWrongVariable(UA_Server* server);