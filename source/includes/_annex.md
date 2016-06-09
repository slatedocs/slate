# JavaDoc
[Inpher \_ultra API JavaDoc](https://dp.inpher.io/api/ultra/doc/?org/inpher/clientapi/InpherClient.html)
# Annex

## <a name="config-prop"></a>Configuration File
> default [config.properties](#config-prop) file

```shell
## FileSystem access layer type
## Possible choices: HDFS RAM
storageType=RAM

## This section configures the HDFS backend
hdfs.uri=hdfs://127.0.0.1:9000


## Choose a search server type
## Possible choices: ELASTIC RAM
searchServerType=RAM

## This section configures the elasticsearch backend

## a list host1:port1,host2:port2,...
elastic.hostList=localhost:9300
elastic.indexList=encindex
## Basic Auth credentials as username:password
#elastic.basicAuthUser=
elastic.clusterName=inpher-es
## Search bulk items size (Elastic)
elastic.queueSize=5
## Max search bulk size in MB before auto commit (Elastic)
elastic.bulkSize=50
## Search auto commit timeout (Elastic)
elastic.flushTime=1
## Number of search threads (Elastic)
elastic.concurrentRequests=5


## Choose a message queue type
## Possible choices: RABBIT_MQ RAM
messageQueueType=RAM

## Rabbit Message Queue URI
rabbitMQ.uri=amqp://127.0.0.1:5672

## If global ssl certificates or key are required, please provide them here
#defaultSSL.keyStorePath=
#defaultSSL.keyStorePasswd=
#defaultSSL.trustStorePath=
#defaultSSL.trustStorePasswd=

## Configure the certificate validator
## Possible choices: ACCEPT_SELF_SIGNED PERFORM_CRL_CHECK ENFORCE_CRL_PRESENCE
certificateValidator.securityLevel=PERFORM_CRL_CHECK
#certificateValidator.trustStore=
#certificateValidator.trustStorePwd=

## Configure search level
## Possible choices: OFF OWN_FILES EVERYWHERE
searchLevel=EVERYWHERE

## Configure Logging
## Logging verbosity
## Possible choices: ERROR DEBUG ALL FATAL INFO OFF TRACE WARN
#log.verbosity=
## Log File Path
#log.logFilePath=
```

<table><colgroup><col><col></colgroup><tbody><tr><th class="confluenceTh">Name</th><th class="confluenceTh">Description</th></tr><tr><th colspan="2" class="confluenceTh">Storage Properties</th></tr><tr><td class="confluenceTd">storageType</td><td class="confluenceTd"><p>Backend storage location:</p><ul><li>RAM: stores the encrypted data in the RAM of the machine. This is typically used for testing</li><li>HDFS_STORAGE: use HDFS related properties to setup HDFS backend</li></ul></td></tr><tr><th colspan="2" class="confluenceTh">HDFS Properties</th></tr><tr><td class="confluenceTd">hdfs.uri</td><td class="confluenceTd">URI of the HDFS backend. This parameter is used when storageType=HDFS.</td></tr><tr><th colspan="2" class="confluenceTh">Search Properties</th></tr><tr><td class="confluenceTd">searchServerType</td><td class="confluenceTd"><p>Type of SearchEngine</p><ul><li>RAM: Search engine running in the RAM of the client. This is typically used for testing</li><li>ELASTIC: Use Elastic Search as search engine</li></ul></td></tr><tr><th colspan="2" class="confluenceTh">Elasticsearch Properties</th></tr><tr><td colspan="1" class="confluenceTd">elastic.hostList</td><td colspan="1" class="confluenceTd">Comma separated list of hosts:port containing at least one Elasticsearch host</td></tr><tr><td colspan="1" class="confluenceTd">elastic.indexList</td><td colspan="1" class="confluenceTd">Name of the encrypted index on the Elasticsearch engine. The <strong>default</strong> value is <em>encindex</em>.</td></tr><tr><td colspan="1" class="confluenceTd">elastic.clusterName</td><td colspan="1" class="confluenceTd">Name of the Elasticsearch cluster instance. The <strong>default</strong> value is <em>inpher-es</em>.</td></tr><tr><td colspan="1" class="confluenceTd">elastic.basicAuthUser</td><td colspan="1" class="confluenceTd">Basic Auth credentials as username:password</td></tr><tr><td colspan="1" class="confluenceTd">elastic.queueSize</td><td colspan="1" class="confluenceTd">The amound of <span style="color: rgb(68,68,68);">pending requests that have no threads to execute them. </span>The <strong>default</strong> value is <em>5</em>.</td></tr><tr><td colspan="1" class="confluenceTd">elastic.bulkSize</td><td colspan="1" class="confluenceTd">Once the bulk reached a size of X, it will be flushed. Size is in MBs. The <strong>default</strong> value is <em>50</em>.</td></tr><tr><td colspan="1" class="confluenceTd">elastic.flushTime</td><td colspan="1" class="confluenceTd">Every x seconds the bulk will be flushed no matter how many requests are queued. Time is in seconds. The <strong>default</strong> value is <em>1</em>.</td></tr><tr><td colspan="1" class="confluenceTd">elastic.concurrentRequests</td><td colspan="1" class="confluenceTd"><span style="color: rgb(68,68,68);">Number of concurrent requests towards the bulk. If the value is 0, it is a single-request with no concurrent requests, if the value is 1 or X, there are going to be up to X concurrent requests</span>. The <strong>default</strong> value is <em>5</em>.</td></tr><tr><th colspan="2" class="confluenceTh">MessageQueue Properties</th></tr><tr><td colspan="1" class="confluenceTd">messageQueueType</td><td colspan="1" class="confluenceTd"><p>Type of MessageQueue</p><ul style="list-style-type: square;"><li>RAM: message queue running in the RAM of the client. This is typically used for testing</li><li>RABBIT_MQ: use RabbitMQ as a message queue backend</li></ul></td></tr><tr><th colspan="2" class="confluenceTh">RabbitMQ Properties</th></tr><tr><td colspan="1" class="confluenceTd">rabbitMQ.uri</td><td colspan="1" class="confluenceTd">URI of the RabbitMQ backend</td></tr><tr><th colspan="2" class="confluenceTh">SSL Properties</th></tr><tr><td colspan="1" class="confluenceTd">trustStorePath</td><td colspan="1" class="confluenceTd">Store containing the certificate chain if the search engine is protected by SSL/TLS</td></tr><tr><td colspan="1" class="confluenceTd">trustStorePasswd</td><td colspan="1" class="confluenceTd">Password for the trust store</td></tr><tr><td colspan="1" class="confluenceTd">keyStorePath</td><td colspan="1" class="confluenceTd">Store containing the&nbsp;<strong>client&nbsp;</strong>certificate if the search engine supports SSL/TLS</td></tr><tr><td colspan="1" class="confluenceTd">keyStorePasswd</td><td colspan="1" class="confluenceTd">Password for the key store</td></tr><tr><td colspan="1" class="confluenceTd">certificateValidator.securityLevel</td><td colspan="1" class="confluenceTd"><p>This property is for X.509 certificate verification in the notification system of Inpher _ultra</p><ul style="list-style-type: square;"><li>ACCEPT_SELF_SIGNED: accept self-signed certificates</li><li>PERFORM_CRL_CHECK: if the certificate contains a CRL distribution point, this will perform the CRL check. But the verification will not fail if no CRL distribution point is present.</li><li>ENFORCE_CRL_PRESENCE: certificate verification will fail if the certificate does not mention any CRL distribution points.</li></ul></td></tr><tr><th colspan="2" class="confluenceTh">Logging Properties</th></tr><tr><td class="confluenceTd">logVerbosity</td><td class="confluenceTd"><p>ALL &lt; DEBUG &lt; INFO &lt; WARN &lt; ERROR &lt; FATAL &lt; OFF</p><ul style="list-style-type: square;"><li>ALL: <span style="color: rgb(49,49,49);">All levels including custom levels.</span></li><li><span style="color: rgb(49,49,49);">DEBUG: <span style="color: rgb(49,49,49);">Designates fine-grained informational events that are most useful to debug an application.</span></span><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);"><br></span></span></li><li><span style="color: rgb(49,49,49);">INFO: <span style="color: rgb(49,49,49);">Designates informational messages that highlight the progress of the application at coarse-grained level.</span></span></li><li><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);">WARN: <span style="color: rgb(49,49,49);">Designates potentially harmful situations.</span></span></span></li><li><span style="color: rgb(49,49,49);"><span>ERROR: <span>Designates error events that might still allow the application to continue running.</span></span></span><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);"><br></span></span></li><li><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);">FATAL: <span style="color: rgb(49,49,49);">Designates very severe error events that will presumably lead the application to abort.</span></span></span></span></li><li><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);"><span style="color: rgb(49,49,49);">OFF: <span style="color: rgb(49,49,49);">The highest possible rank and is intended to turn off logging.</span></span></span></span></span></li></ul></td></tr><tr><td colspan="1" class="confluenceTd">pathLogFile</td><td colspan="1" class="confluenceTd">If specified, a log file will be created at the specified location</td></tr></tbody></table>
