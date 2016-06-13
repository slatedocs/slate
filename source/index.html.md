---
title: Inpher API Reference

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - annex

search: true
---

# Introduction

Welcome to the Inpher API documentation! The Inpher SDK enables applications to encrypt, index, search and share large unstructured data sets without revealing any plaintext to an untrusted host or attacker. Our client-side libraries and backend compatibility empower developers to quickly create secure applications without being crypto experts or changing their search and storage infrastructure.

### \_open
![alt text][open]
[open]: images/open.png "\_open"

Our free, open SDK for developers to sandbox and build applications on top of existing search platforms and backend storage.  Includes:

* Developer portal access with full documentation
* Java libraries (Android and JS coming soon)
* Sample applications
* Docker container
* Amazon Machine Image (AMI)
* Native support for search platforms Elasticsearch and Solr
* Backend integration with Azure, HDFS and S3 storage
* Lightweight, deployable on IoT devices

### \_ultra
![alt text][ultra]
[ultra]: images/ultra.png "\_ultra"

Our enterprise-grade SDK for encrypting, indexing and searching terabytes of data across thousands of distributed users. Get all of the components in the \_open toolkit plus everything your team needs to scale:

* Parallelization and synchronization libraries for big data
* Multi-user support
* Encrypted sharing groups
* Implementation services and direct support from our technical team

# Docker Sandbox
> Open your Docker quick start terminal and launch the following containers

```shell
# Download and run the storage backend
docker run --name hdfs -d -t sequenceiq/hadoop-docker

# Download and run the search engine
docker run --name elastic -td inpher/elastic-frequency:_ultra

# Download and run the message broker
docker run --name rabbitmq -td rabbitmq

# Download and run the inpher samples
docker run --name samples --link elastic:elastic --link hdfs:hdfs --link rabbitmq:rabbitmq -d -t inpher/samples:_ultra
```

> Log in to the samples container

```shell
docker exec -it samples /bin/bash
```

> Run the demo application

```shell
# CD to the home directory of the sample project
$ cd /root/inpher-sdk/inphertutorial/

# Launch the application
$ java -cp 'target/classes:target/dependency/*' Samples
```

![alt text][docker]
[docker]: images/docker.png "docker"

The fastest way to play with the Inpher SDK is to set up a couple of containers and look at the sample code provided in the `inpher/samples` container. For this you need to have [Docker](http://docs.docker.com/) installed.

The `Samples.java` file can be found here:

`/root/inpher-sdk/inphertutorial/src/main/java/Samples.java`

Feel free to install a command line text editor such as `vim` using `apt-get install` to view and edit the file.

# Environment Setup
![alt text][arch]
[arch]: images/arch.png "Hadoop"

### Application Layer End-to-End Encryption

Most cloud applications do not encrypt the data that is sent to the hosting
provider which can be a major privacy issue for the users.
Consider for instance an application managing *electronic health records*
(e-health). A typical use case might require to share these records among authorized
users (e.g., medical doctors that are treating a patient) or search for a patient name inside these records.
However, this data should not be visible to unauthorized people, e.g., to the
cloud administrator.
For instance, in the United States, the Health Insurance Portability and Accountability
Act~(HIPAA) defines guidelines to enforce the security and privacy of electronic
health information.
Complying to such guidelines can quickly make the software inefficient or
expensive. Moreover, the security should be designed by security and
cryptography experts to avoid making it vulnerable. Home-made
solutions can also quickly become difficult to integrate to an existing project as
they often require to be started from scratch.

With the Inpher SDK, we propose a tool that efficiently allows users to *store*
data on an **untrusted** back-end. It allows also to *search* on
this encrypted data in a way that no
meaningful information about the queries nor the stored content are leaked to
the cloud service provider or to unauthorized users.
Finally, the Inpher SDK can easily be integrated to an existing cloud
application as it supports most existing search platforms and storage solutions.
Hence, existing software based on these
cloud solutions can be modified without much effort so that they use the Inpher SDK
and protect the privacy of the stored data without losing functionalities.

## Storage
> Download and run the HDFS Docker container

```shell
docker run --name hdfs -d -t -p 9000:9000 sequenceiq/hadoop-docker
```

> Find out IP of container

```shell
docker inspect --format="{{.NetworkSettings.IPAddress}}" hdfs
```

> On OS X, add routing entry to connect to container

```shell
sudo route add -net <hadoop-subnet> <IP-docker-machine-VM>
```

> Modify the [config.properties](#config-prop):

```shell
storageType=HDFS
hdfs.uri=hdfs://localhost:9000
```

Supported storage backend:

* [HDFS](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html)

![alt text][hadoop]
[hadoop]: images/hadoop.png "Hadoop"

HDFS is the primary distributed storage used by Hadoop applications. A HDFS cluster primarily consists of a NameNode that manages the file system metadata and DataNodes that store the actual data.

The Inpher \_ultra SDK stores encrypted data on HDFS as a encrypted file system (EFS).
Neither the content, nor the file names, nor the folder hierarchy are visible to the
cloud administrator. It enables application developers to create
user friendly folder view on the client side. In addition, the hierarchical
front-end view allows for easy sharing of encrypted content in entire subtrees
while keeping the data in flat structure on the back-end.
The hierarchical structure
for a user always starts with a *root* `/user/` which contains
files and sub-directories.

Both files and directories (referred to as *elements* of the EFS)
contain *metadata* which will be used to link the front-end to the
back-end. In particular, the metadata for a file (e.g., `/user/file1` contains
a *decryption key* that allows to decrypt the content of the file and a
*back-end ID*, i.e., a pointer to the
encrypted content on the back-end.
Each metadata of an element is encrypted using a *hierarchical key* which is stored in the
parent directory of this element. The key of the root of the tree (the
*root key*) is given to the user when he joins the system or the sharing
group.  
This allows data sharing of subfolders with minimal key management overhead.
Indeed, if a user wants to recover a given file, he can simply browse
through the tree very efficiently using this hierarchical structure by
recovering recursively each encryption key starting from the root starting from
the root.

The EFS allows to *create* a new directory, to *list* the elements in a
directory, and to *copy*, *move* and *delete* elements.


## Search Engine
> Download and run the Elasticsearch Docker container

```shell
docker run --name elastic -td -p 9300:9300 inpher/elastic-frequency:_ultra
```

> Then modify the [config.properties](#config-prop)

```shell
searchServerType=ELASTIC
elastic.hostList=localhost:9300
```

> If you have an existing instance of elastic search, create a new index using the following command

```shell
curl -XPUT "http://localhost:9200/encindex/" -d'
{
 "settings": {
   "number_of_shards" : 1,
   "number_of_replicas" : 1,
   "analysis": {
     "analyzer": {
       "payloads": {
         "type": "custom",
         "tokenizer": "whitespace",
         "filter": [
           "delimited_payload_filter"
         ]
       }
     }
   }
 },
 "mappings": {
   "secureDoc": {
     "properties": {
       "encKeywords": {
         "type": "string",
         "analyzer": "payloads",
         "term_vector": "with_positions_offsets_payloads"
       },
       "id": {
         "type": "string"
       }
     }
   }
 }
}'
```

> Then, add the following groovy script to the scripts folder

```groovy
// NOTE: This file should be called script.groovy
score=0;
for (term in my_terms) {
    termInfo = _index["encKeywords"].get(term,_PAYLOADS);
    for (pos in termInfo) {
        score = score +  pos.payloadAsFloat(0);
    }
}
return score;
```

Supported search engines:

* [Elasticsearch](https://www.elastic.co/products/elasticsearch)

![alt text][elastic]
[elastic]: images/elastic.png "Elastic"

The search backend is used by the Inpher SDK to achieve full-text search in document. You can either use a Docker container or deploy it on your existing Elasticsearch instance.

### Search Features

The following features are currently supported. More features such as *proximity* or *snippeting* are currently being developed.

Feature | Description
--- | ---
Encrypted Index | Keywords are extracted and encrypted on the client before being sent to the search engine for indexing. This means that the search engine will never be able to read any information regarding the indexed documents, even when loaded in memory.
Encrypted Queries | The search queries are encrypted before leaving the client. The search engine will never see the search query in plain and the corresponding replies.
Ranking | Search hits are ranked according to their relevance. The score is computed based on the frequency of occurrence of the search terms.
Stemming | A keywords stem is indexed. E.g: "cats", "catlike", "catty" are indexed as "cat".
Disjunctive Queries | Multiple search terms are added to a disjunct query. E.g: A query for "cat dog" would return all documents containing "cat" *OR* "dog".
Global Queries | A query can be executed across all personal documents and all documents within associated sharing groups.


## Message Broker

> Download and run Docker the RabbitMQ Docker container

```shell
docker run --name rabbitmq -td -p 5672:5672 rabbitmq
```
> Then modify the [config.properties](#config-prop):

```shell
messageQueueType=RABBIT_MQ
rabbitMQ.uri=amqp://localhost:5672
```

Supported message brokers:

* [RabbitMQ](https://www.rabbitmq.com)

![alt text][rabbitmq]
[rabbitmq]: images/rabbitmq.png "RabbitMQ"

RabbitMQ is an open source message broker software (sometimes called message-oriented middleware) that implements the Advanced Message Queuing Protocol (AMQP).

The message broker used to send user and group notifications. It allows users to receive sharing group invitations or sharing group updates.

## Configuration File
> Create the *InpherClient* object using the default config file location

```java
InpherClient client = InpherClient.getClient();
```

> Create the *InpherClient* object using a custom config file location

```java
InpherClient client = InpherClient.getClient("/path/to/the/configFile");
```

The Inpher SDK is configured through a config file called [config.properties](#config-prop). The name is not fixed: the user can choose which config file to use during the client creation:

`InpherClient client = InpherClient.getClient("/path/to/the/configFile");`

By default the `getClient()` will read a file named [config.properties](#config-prop) at the root of the java project.

`InpherClient client = InpherClient.getClient();`

The default config file can be generated by the `generate-blank-inpher-project.sh` script located in the `bin` folder. This example file is a good starting point to configure Inpher for your needs.

### Syntax

The syntax of the config file is simple. Each line is a key value pair:

`key=value`

It is also possible to have a commented line by starting the line with a '#':

`# this is commented`

## General Search Settings
> disable the search functionality

```shell
searchLevel=OFF
```
> enable search only in data that is owned by the user

```shell
searchLevel=OWN_FILES
```
> enable search in all user data and data that is shared with the user

```shell
searchLevel=EVERYWHERE
```

Three different settings for search are available.

* `searchLevel=OFF`

disables the search functionality in the system. Use this if you don't need to search in your data for more efficiency.

* `searchLevel=OWN_FILES`

will enable search only in data that is owned by the user. This means that if a user is sharing a directory with another user, the latter will not see the content of this directory in his search results.

* `searchLevel=EVERYWHERE`

allows users to search in all their data and in the data that is shared. This is the least efficient option.

# Getting Started
## Prerequisites
> Ubuntu:

```shell
sudo apt-get install openjdk-8-jdk maven
```

The following packages are needed to get started developing an application powered by Inpher.

* Java 8 JDK such as openjdk-8-jdk
* Maven / Gradle

## Quick-start a Maven Project
> First download the following zip file and unzip it:

```shell
wget https://dp.inpher.io/files/inpher-sdk-ultra.zip
unzip inpher-sdk-ultra.zip
```

> Run the generate-blank-inpher-project.sh script to create a new blank maven project with Inpher SDK \_ultra as a dependency in a new directory *inphertutorial*.

```shell
cd inpher-sdk
./bin/generate-blank-inpher-project.sh
```

You can follow these steps to quickly start and setup a Maven project already with Inpher SDK as a dependency. This will also auto-generate the default [config.properties](#config-prop).

Once you have set your environment, you can start using the \_ultra SDK to develop secure applications.


## Maven
> Add the following repository in the pom.xml

```xml
<repository>
    <id>org.inpher</id>
    <name>Inpher Repository</name>
    <url>http://dp.inpher.io/maven</url>
</repository>
```
> Add the following dependencies in the pom.xml

```xml
<dependency>
    <groupId>org.inpher</groupId>
    <artifactId>clientapi</artifactId>
    <version>1.2</version>
</dependency>
<dependency>
    <groupId>org.inpher</groupId>
    <artifactId>clientimpl</artifactId>
    <version>1.2</version>
    <scope>runtime</scope>
</dependency>
```

![alt text][maven]
[maven]: images/maven.png "Maven"

[Apache Maven](https://maven.apache.org) is a software project management and comprehension tool. Based on the concept of a project object model (POM), Maven can manage a project's build, reporting and documentation from a central piece of information.

If your existing project is based on Maven, you can add the Inpher repository and dependencies to your `pom.xml` file. Refresh your dependencies to have access to the \_ultra API calls.

## Gradle

> Add the following in the build.gradle

```shell
repositories {
    maven { url "http://dp.inpher.io/maven" }
}
dependencies {
    compile 'org.inpher:clientapi:1.2'
    runtime 'org.inpher:clientimpl:1.2'
}
```
![alt text][gradle]
[gradle]:images/gradle.png "Gradle"

[Gradle](http://gradle.org) is an open source build automation system that builds upon the concepts of Apache Ant and Apache Maven and introduces a Groovy-based domain-specific language (DSL) instead of the XML form used by Apache Maven of declaring the project configuration.

If your existing project is based on Gradle, you can add the Inpher repository and dependencies to your `build.gradle` file. Refresh your dependencies to have access to the \_ultra API calls.

## Creating Client Objects
> Creating an *InpherClient* object

```java
InpherClient inpherClient = InpherClient.getClient();
```

The Inpher \_ultra SDK main class `InpherClient` supports user registration, login, creating sharing groups as well as basic management of public keys for both users and sharing groups. The simplest way of creating an `InpherClient` is to call the `getClient()` static method of `InpherClient`:

## User Registration
> User registration

```java
String pwd = "A_str0ng_Pa55w0rd!";
String username = "Guest";

InpherUser user = new InpherUser(username, pwd);
try {
    InpherClient.registerUser(user);
} catch(ExistingUserException e) {
    System.out.println("User " + user.getUsername() + " already exists.");
}
```

You can only register a user that was not previously registered. Failing to do so throws an `ExistingUserException`. The valid username can only have alphanumerical, dashes and underscore characters. When the username is invalid a runtime `InvalidUsernameException` is thrown.

<aside class="warning">Register does not upload a valid CA signed certificate. It just uploads a self-signed certificate for the user.</aside>

## User Login
> For a registered user, you can login the user

```java
try {
    SearchableFileSystem sfs = inpherClient.loginUser(user);
} catch(AuthenticationException e) {
    System.out.println("Failed to login with user " + user.getUsername());
}
```

An `AuthenticationExcepption` is thrown if the password is wrong or the user has not been registered.
Once the user is logged in, you can perform file system operations such as create directories, upload/download files.

## Create a New Directory
> Creating directory

```java
// SearchableFileSystem sfs;

// Create a directory in your own root:
try {
    sfs.mkdir(FrontendPath.root(user.getUsername()).append(dirName));
} catch(ParentNotFoundException e) {
    System.out.println("The parent of the directory you want to create does not exist");
}
```

If the parent of the directory you are trying to create does not exist, a `ParentNotFoundException` is thrown.

## Content Upload and Download
> Content upload

```java
// SearchableFileSystem sfs
// File sourceFile;
// FrontendPath pathToUpload;
try {
    sfs.upload(sourceFile, pathToUpload, null);
} catch(ParentNotFoundException e) {
    System.out.println("The parent directory of the specified destination path does not exist");
}
```

Content is preprocessed, indexed, encrypted and securely uploaded via a single method of the `SearchableFileSystem`

If the parent of the destination path you want to upload does not exist, a `ParentNotFoundException` is thrown.

Content is downloaded in a similar way. If the source frontend path does not exist, `PathNotFoundException` is thrown. If one is trying to download a directory, `PathIsDirectoryException` is thrown.

> Content download

```java
// FrontendPath sourcePath
// File destFile
try {
    sfs.download(sourcePath, destFile, null)
} catch (PathNotFoundException e) {
    System.out.println("The specified frontend source path does not exist.");
} catch (PathIsDirectoryException e) {
    System.out.println("The specified frontend source path is a directory frontend path.");
}
```

## Create a Sharing Group
> Creating a sharing group

```java
String groupName = "sharegp";
String user1 = "user1";
String user2 = "user2";
List<String> membersList = new ArrayList<String>();
membersList.add(user1);
membersList.add(user2);
createSharingGroup(searchableFileSystem, groupName, membersList);
```

To create a sharing group, one needs to call the static method `createSharingGroup()` of `InpherClient`. This method takes a SearchableFileSystem object, a group name as well as a list of users to be added as members of the sharing group.

## Share Element
> Sharing a file or a directory

```java
// SearchableFileSystem sfs
// FrontendPath = pathToShare
String groupName = "shareGroup";
String shareName = "sharedFromUser";

try {
    sfs.shareElement(groupName, pathToShare, shareName);
} catch(PathNotFoundException e) {
    System.out.println("The frontend path of the element to be shared does not exist");
} catch(ElementAlreadySharedException e) {
    System.out.println("The element is already shared with the same group and the same share name.");
} catch(PathNotOwnedByUserException e) {
    System.out.println("The specified frontend path is not owned by the calling user.");
}
```

To share a directory or a file that you own with the members in a sharing group, use the shareElement method of SearchableFileSystem

A `PathNotFoundException` if the frontend path of the element to share does not exist. If the element is already shared with this share name and this sharing group, an `ElementAlreadySharedException` is thrown. If the caller does not own the file system element, a `PathNotOwnedByUserException` is thrown.

## Secure Search
> Secure search

```java
List<String> keywords = new ArrayList<>();
keywords.add("cryptography");
keywords.add("encryption");
int page = 0; // the first result to return
int numResults = 100; // the maximal number of results to return
SearchResponse response = sfs.search(keywords, page, numResults);
```

To perform a secure keyword search on the content of the user, together with all the shared content from all sharing groups for which the user is a member, one calls the `search()` method of `SearchableFileSystem`

The result of the secure search is an object of class `SearchResponse`. One can retrieve the frontend paths together with the ranking scores of the hits in the `SearchResponse`. The method `getAllRankedSearchResults()` returns a list of objects of class `RankedSearchResult` (simply a pair of a frontend path and a ranking score).  
