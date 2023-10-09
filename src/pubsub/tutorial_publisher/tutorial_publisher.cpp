#include <open62541/plugin/log_stdout.h>
#include <open62541/plugin/pubsub.h>
#include <open62541/plugin/pubsub_udp.h>
#include <open62541/server.h>
#include <open62541/server_pubsub.h>
#include <open62541/server_config_default.h>

#include <csignal>

UA_NodeId connectionIdent, publishedDataSetIdent, writerGroupIdent;

static void addPubSubConnection
	(UA_Server* server, UA_String* transportProfile,
	UA_NetworkAddressUrlDataType* networkAddressUrl)
{
	// Details about the connection configuration and handling are located
	// in the pubsub connection tutorial
	UA_PubSubConnectionConfig connectionConfig;
	memset(&connectionConfig, 0, sizeof(connectionConfig));
	connectionConfig.name = UA_STRING((char*)"UADP Connection 1");
	connectionConfig.transportProfileUri = *transportProfile;
	connectionConfig.enabled = UA_TRUE;
	UA_Variant_setScalar(&connectionConfig.address, networkAddressUrl,
		&UA_TYPES[UA_TYPES_NETWORKADDRESSURLDATATYPE]);

	// Changed to static publisherId from random generation to identify
	// the publisher on Subscriber side
	connectionConfig.publisherId.numeric = 2234;
	UA_Server_addPubSubConnection(server, &connectionConfig, &connectionIdent);
}



/*
 * **PublishedDataSet handling**
 * 
 * The PublishedDataSet (PDS) and PubSubConnection are the toplevel entities and
 * can exist alone. The PDS contains the colletion of the published fields.
 * All other PubSub elements are directly or indirectly linked with the PDS or connection.
**/
static void addPublishDataSet(UA_Server* server)
{
	// The publishedDataSetConfig contains all necessary public
	// information for the creation of a new PublishedDataSet
	UA_PublishedDataSetConfig publishedDataSetConfig;
	memset(&publishedDataSetConfig, 0, sizeof(UA_PublishedDataSetConfig));
	publishedDataSetConfig.publishedDataSetType = UA_PUBSUB_DATASET_PUBLISHEDITEMS;
	publishedDataSetConfig.name = UA_STRING((char*)"Demo PDS");

	// Create new PublishedDataSet based on the PublishedDataSetConfig
	UA_Server_addPublishedDataSet(server, &publishedDataSetConfig, &publishedDataSetIdent);
}


/*
 * **DataSetField handling**
 * 
 * The DataSetField (DSF) is part of the PDS and
 * describes exactly one published field.
**/
static void addDataSetField(UA_Server* server)
{
	// Add a field to the previous created PublishedDataSet
	UA_NodeId dataSetFieldIdent;
	UA_DataSetFieldConfig dataSetFieldConfig;
	memset(&dataSetFieldConfig, 0, sizeof(UA_DataSetFieldConfig));
	dataSetFieldConfig.dataSetFieldType = UA_PUBSUB_DATASETFIELD_VARIABLE;
	dataSetFieldConfig.field.variable.fieldNameAlias = UA_STRING((char*)"Server localtime");
	dataSetFieldConfig.field.variable.promotedField = UA_FALSE;
	dataSetFieldConfig.field.variable.publishParameters.publishedVariable
		= UA_NODEID_NUMERIC(0, UA_NS0ID_SERVER_SERVERSTATUS_CURRENTTIME);
	dataSetFieldConfig.field.variable.publishParameters.attributeId = UA_ATTRIBUTEID_VALUE;
	UA_Server_addDataSetField(server, publishedDataSetIdent, &dataSetFieldConfig, &dataSetFieldIdent);
}


/*
 * **WriterGroup handling**
 * 
 * The WriterGroup (WG) is part of the connection and contains the primary
 * configuration parameters for the message creation.
**/
static void addWriterGroup(UA_Server* server)
{
	// Now we create a new writerGroupConfig and
	// add the group to the existing PubSubConnection
	UA_WriterGroupConfig writerGroupConfig;
	memset(&writerGroupConfig, 0, sizeof(UA_WriterGroupConfig));
	writerGroupConfig.name = UA_STRING((char*)"Demo WriterGroup");
	writerGroupConfig.publishingInterval = 1000;
	writerGroupConfig.enabled = UA_FALSE;
	writerGroupConfig.writerGroupId = 100;
	writerGroupConfig.encodingMimeType = UA_PUBSUB_ENCODING_UADP;
	writerGroupConfig.messageSettings.encoding = UA_EXTENSIONOBJECT_DECODED;
	writerGroupConfig.messageSettings.content.decoded.type = &UA_TYPES[UA_TYPES_UADPWRITERGROUPMESSAGEDATATYPE];

	UA_UadpWriterGroupMessageDataType* writerGroupMessage = UA_UadpWriterGroupMessageDataType_new();
	writerGroupMessage->networkMessageContentMask
		= (UA_UadpNetworkMessageContentMask)(UA_UADPNETWORKMESSAGECONTENTMASK_PUBLISHERID |
			(UA_UadpNetworkMessageContentMask)UA_UADPNETWORKMESSAGECONTENTMASK_GROUPHEADER |
			(UA_UadpNetworkMessageContentMask)UA_UADPNETWORKMESSAGECONTENTMASK_WRITERGROUPID |
			(UA_UadpNetworkMessageContentMask)UA_UADPNETWORKMESSAGECONTENTMASK_PAYLOADHEADER);

	writerGroupConfig.messageSettings.content.decoded.data = writerGroupMessage;
	UA_Server_addWriterGroup(server, connectionIdent, &writerGroupConfig, &writerGroupIdent);
	UA_Server_setWriterGroupOperational(server, writerGroupIdent);
	UA_UadpWriterGroupMessageDataType_delete(writerGroupMessage);
}


/*
 * **DataSetWriter handling**
 * 
 * A DataSetWriter (DSW) is the glue between the WG and the PDS.
 * The DSW is linked to exactly one PDS and contains additional information for the
 * message generation.
**/
static void addDataSetWriter(UA_Server* server)
{
	// https://github.com/open62541/open62541/blob/v1.3.7/examples/pubsub/tutorial_pubsub_publish.c#L138

}