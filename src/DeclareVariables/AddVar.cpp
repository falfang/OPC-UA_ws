// https://www.open62541.org/doc/1.3/tutorial_server_variable.html

#include "AddVar.h"

void a() {

}

void addVariable(UA_Server* server) {
	// Define the attribute of the myInteger variable node
	UA_VariableAttributes attr = UA_VariableAttributes_default;
	UA_Int32 myInteger = 42;
	UA_Variant_setScalar(&attr.value, &myInteger, &UA_TYPES[UA_TYPES_INT32]);

	// attributeÇÃëÆê´ê›íË
	attr.description = UA_LOCALIZEDTEXT((char*)"en-US", (char*)"the answer");
	attr.displayName = UA_LOCALIZEDTEXT((char*)"en-US", (char*)"the answer");
	attr.dataType = UA_TYPES[UA_TYPES_INT32].typeId;
	attr.accessLevel = UA_ACCESSLEVELMASK_READ | UA_ACCESSLEVELMASK_WRITE;

	// Add the variable node to the information model
	UA_NodeId myIntegerNodeId = UA_NODEID_STRING(1, (char*)"the.answer");
	UA_QualifiedName myIntegerName = UA_QUALIFIEDNAME(1, (char*)"the answer");
	UA_NodeId parentNodeId = UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER);
	UA_NodeId parentReferenceNodeId = UA_NODEID_NUMERIC(0, UA_NS0ID_ORGANIZES);
	UA_Server_addVariableNode(
		server, myIntegerNodeId, parentNodeId,
		parentReferenceNodeId, myIntegerName,
		UA_NODEID_NUMERIC(0, UA_NS0ID_BASEDATAVARIABLETYPE), attr, NULL, NULL
	);
}


void addMatrixVariable(UA_Server* server) {
	UA_VariableAttributes attr = UA_VariableAttributes_default;
	attr.displayName = UA_LOCALIZEDTEXT((char*)"en-US", (char*)"Double Matrix");
	attr.accessLevel = UA_ACCESSLEVELMASK_READ | UA_ACCESSLEVELMASK_WRITE;

	// Set the variable value constraints
	attr.dataType = UA_TYPES[UA_TYPES_DOUBLE].typeId;
	attr.valueRank = UA_VALUERANK_TWO_DIMENSIONS;
	UA_UInt32 arrayDims[2] = { 2, 2 };
	attr.arrayDimensions = arrayDims;
	attr.arrayDimensionsSize = 2;

	// Set the value. The array dimensions need to be the same for the value
	UA_Double zero[4] = { 0.0, 0.0, 0.0, 0.0 };
	UA_Variant_setArray(&attr.value, zero, 4, &UA_TYPES[UA_TYPES_DOUBLE]);
	attr.value.arrayDimensions = arrayDims;
	attr.value.arrayDimensionsSize = 2;

	UA_NodeId myIntegerNodeId = UA_NODEID_STRING(1, (char*)"double.matrix");
	UA_QualifiedName myIntegerName = UA_QUALIFIEDNAME(1, (char*)"double matrix");
	UA_NodeId parentNodeId = UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER);
	UA_NodeId parentReferenceNodeId = UA_NODEID_NUMERIC(0, UA_NS0ID_ORGANIZES);
	UA_Server_addVariableNode(
		server, myIntegerNodeId, parentNodeId,
		parentReferenceNodeId, myIntegerName,
		UA_NODEID_NUMERIC(0, UA_NS0ID_BASEDATAVARIABLETYPE), attr, NULL, NULL
	);
}



void writeVariable(UA_Server* server) {
	UA_NodeId myIntegerNodeId = UA_NODEID_STRING(1, (char*)"the.answer");

	// Write a different integer value
	UA_Int32 myInteger = 43;
	UA_Variant myVar;
	UA_Variant_init(&myVar);
	UA_Variant_setScalar(&myVar, &myInteger, &UA_TYPES[UA_TYPES_INT32]);
	UA_Server_writeValue(server, myIntegerNodeId, myVar);

	// Set the status code of the value to an error code.
	// The function UA_Server_write provides access to the raw service.
	// The above UA_Server_writeValue is syntactic sugar for writing a specific node attribute
	// with the write service.
	UA_WriteValue wv;
	UA_WriteValue_init(&wv);
	wv.nodeId = myIntegerNodeId;
	wv.attributeId = UA_ATTRIBUTEID_VALUE;
	wv.value.status = UA_STATUSCODE_BADNOTCONNECTED;
	wv.value.hasStatus = true;
	UA_Server_write(server, &wv);

	// Reset the variable to a good statuscode with a value
	wv.value.hasStatus = false;
	wv.value.value = myVar;
	wv.value.hasValue = true;
	UA_Server_write(server, &wv);
}



void writeWrongVariable(UA_Server* server) {
	UA_NodeId myIntegerNodeId = UA_NODEID_STRING(1, (char*)"the.answer");

	// write a string
	UA_String myString = UA_STRING((char*)"test");
	UA_Variant myVar;
	UA_Variant_init(&myVar);
	UA_Variant_setScalar(&myVar, &myString, &UA_TYPES[UA_TYPES_STRING]);
	UA_StatusCode retval = UA_Server_writeValue(server, myIntegerNodeId, myVar);
	std::cout << "Writing a string returned statuscode " << UA_StatusCode_name(retval) << std::endl;
}