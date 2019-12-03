---
title: SynBioHub HTTP API

language_tabs: # must be one of https://git.io/vQNgJ
  - python: Python
  - javascript: JavaScript

toc_footers:
  - <a href='#'>Join the SynBioHub Users mailing list</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# About SynBioHub
What is SynBioHub?

SynBioHub includes two projects:

* An [open source software project](http://github.com/SynBioHub) providing a Web interface for the storing and publishing of synthetic biology designs.
* A public instance of the aforementioned software project at [synbiohub.org](http://synbiohub.org), allowing users to upload and share designs.

For those familiar with the SBOL Stack, SynBioHub incorporates and extends its functionality.  An SBOL Stack installation is not required for SynBioHub.


What can SynBioHub be used for?

SynBioHub can be used to publish a library of synthetic parts and designs as a service, to share designs with collaborators, and to store designs of biological systems locally. Data in SynBioHub can be accessed via the HTTP API or Java API, where it can then be integrated into CAD tools for building genetic designs. SynBioHub contains an interface for users to upload new biological data to the database, to visualize DNA parts, to perform queries to access desired parts, and to download SBOL, GenBank or FASTA data.


### Contributors

SynBioHub

* [James Alastair McLaughlin](http://homepages.cs.ncl.ac.uk/j.a.mclaughlin)*
* [Prof. Chris J. Myers](http://www.async.ece.utah.edu/Myers)†
* [Dr Goksel Misirli](http://homepages.cs.ncl.ac.uk/goksel.misirli)*
* [Prof. Anil Wipat](http://homepages.cs.ncl.ac.uk/anil.wipat/)*
* [Zach Zundel](http://www.async.ece.utah.edu/people/students/zach-zundel/)†

SBOL Stack

* [Dr Curtis Madsen](http://sites.bu.edu/ckmadsen/)§ 
* [James Alastair McLaughlin](http://homepages.cs.ncl.ac.uk/j.a.mclaughlin)* 
* [Dr Goksel Misirli](http://homepages.cs.ncl.ac.uk/goksel.misirli/)*
* [Dr Matthew Pocock](http://intbio.ncl.ac.uk/?people=matthew-pocock)‡
* [Dr Keith Flanagan](http://intbio.ncl.ac.uk/?people=dr-keith-flanagan)*
* [Dr Jennifer Hallinan](https://research.science.mq.edu.au/synthetic-biology/people/)Δ
* [Prof. Anil Wipat](http://homepages.cs.ncl.ac.uk/anil.wipat/)* 

Web Design

* [Antarctic Design](http://www.antarctic-design.co.uk/) 



##### *[Newcastle University](http://ncl.ac.uk) 
##### †[University of Utah](https://www.utah.edu/) 
##### ‡Turing Ate My Hamster Ltd
##### §[Boston University](http://www.bu.edu/) 
##### Δ[Macquarie University](https://www.mq.edu.au/) 



# Documentation

## GET endpoint to count objects
### HTTP Request
`GET <SynBioHub URL>/<ObjectType>/count`

e.g. `curl -X GET https://synbiohub.org/Collection/Count`
<aside class="success">
Note that you can replace `Collection` with any object type, such as `ComponentDefinition`, `SequenceAnnotation`, etc. 
</aside>


## POST endpoint to request to login
Returns a string token to be passed with any call to submit as the `user` parameter. 

This POST request requires email/password and returns a user token needed for viewing private objects and submitting new objects. 
### HTTP Request
`POST http://synbiohub.org/login `

e.g.`curl -X POST -H "Accept: text/plain" -d "email=<email>&password=<password>" https://synbiohub.org/login`
### Query Parameters
Parameter | Description
--------- | ------- | -----------
email | the e-mail address of the user to login with
password | the password of the user



## GET endpoint that returns all Collections that are not members of any other Collection
### HTTP Request
`GET <SynBioHub URL>/rootCollections`

e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/igem_collection/1/subCollections `
<aside class="success">Note that the X-authorization header is optional, but if provided, it will also return private root collections for the logged in user.  </aside>


## GET endpoint that returns all Collections that are members of the Collection specified by its URI
### HTTP Request
`GET <URI>/subCollections`

e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/rootCollections`
<aside class="success">Note that the X-authorization header is not needed for public collections, but it is required for private collections. </aside>


## GET endpoint that returns SBOL for the object with the specified URI
### HTTP Request
`GET <URI>/sbol`

e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_F2620/1/sbol`
<aside class="success">Note that the X-authorization header is not needed for public objects, but it is required for private objects.  </aside>
 

## GET endpoint that returns source for an attachment with the specified URI
### HTTP Request
`GET <URI>/download `

e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/test/attachment_00009TGVMsfEoCdMeRzHrU/1/download -O --compressed `
<aside class="success">Note that the X-authorization header is not needed for public attachments, but it is required for private attachments.  </aside>

## POST endpoint that attaches a file to a specified URI
### HTTP Request
`POST <URI>/attach `

e.g. `curl -X POST -H "Accept: text/plain" -H "X-authorization: <token>" -F 'file=@<filename>' https://synbiohub.org/user/MyUserName/test/test_collection/1/attach`

## GET endpoint to perform a search and return metadata
`GET <SynBioHub URL>/search/<key>=<value>&...&<search string>/?offset=#&limit=# `

e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" 'https://synbiohub.org/search/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP/?offset=0&limit=50'`

Note that the X-authorization header is optional, but if provided, the search will also return private objects for the logged in user.

Before URL encoding, the URL is composed of a series of search criteria of the form:

key=value& 

### The key/value pair can be one of the following: 
Key/value pair | Description
--------- | -----------
objectType=value | The type of object to search for (e.g. objectType=ComponentDefinition&)
sbolTag=value |  A tag in the SBOL namespace to search for (e.g. role=<http://identifiers.org/so/SO:0000316>&)
collection=value | Matches objects that are members of the specified collection (e.g., collection=<http://synbiohub.org/public/igem/igem_collection>&)
dcterms:tag=value | A tag in the dcterms namespace to search for (e.g. dcterms:title='pLac'&) - note this requires an exact match
namespace/tag=value | A full namespace with tag separated by appropriate delimiter (e.g. <http://sbols.org/v2#role>=<http://identifiers.org/so/SO:0000316>&)

After the key/value pairs, an optional search string can be provided that will be used to search for partial matches in the displayId, name, or description fields.

Finally, the URL can end with an offest and limit parameter.

This endpoint returns JSON metadata of the form 

```
[
    {
        "uri":"http://synbiohub.org/public/igem/BBa_K1404008/1",
        "name":"BBa_K1404008",
        "description":"p70-CsgA-His*2, double His-tagged curli generator",
        "displayId":"BBa_K1404008",
        "version":"1"
    },

    ...
]
```

## GET endpoint to perform a search and return count of search results
Returns the number of items matching the search result.
###HTTP Request
`GET <SynBioHub URL>/searchCount/<key>=<value>&...&<search string>/?offset=#&limit=# `

e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" 'https://synbiohub.org/searchCount/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP'`

<aside class="success">Note that the X-authorization header is optional, but if provided, the search count will also include private objects for the logged in user. </aside>

## GET endpoint to perform a SPARQL query
Returns the results of the SPARQL query in JSON format. 
### HTTP Request
`GET <SynBioHub URL>/sparql?query=<SPARQL query> `

e.g. `curl -X GET -H "Accept: application/json" 'https://synbiohub.org/sparql?query=select%20%3Fs%20%3Fp%20%3Fo%20where%20%7B%20%3Fs%20%3Fp%20%3Fo%20%7D'`

Returns the results of the SPARQL query in JSON format. 

<aside class="success">Note that the X-authorization header is optional, but if provided, the SPARQL query will also include private objects for the logged in user. </aside>

## GET endpoint to perform a SPARQL admin query
Returns the results of the SPARQL admin query in JSON format.
### HTTP Request
`GET <SynBioHub URL>/admin/sparql?query=<SPARQL query>`

e.g. ` curl -X GET -H "Accept: application/json" 'https://synbiohub.org/admin/sparql?query=select%20%3Fs%20%3Fp%20%3Fo%20where%20%7B%20%3Fs%20%3Fp%20%3Fo%20%7D'`

<aside class="success">Note that the X-authorization header is required, and it must include a token for a user with administrator privileges.  </aside>

## POST endpoint to create a new collection
### HTTP Request
`POST <SynBioHub URL>/submit `

e.g. `curl -X POST -H "Accept: text/plain" -H "X-authorization: <token>" -F id=<id> -F version=<version> -F name=<name> -F description=<description> -F citations=<citations> -F overwrite_merge=<overwrite_merge> -F file=@<filename> https://synbiohub.org/submit`

### Query Parameters
Parameter | Description
--------- | -----------
id | a user-defined string identifier for the submission; alphanumeric and underscores only, e.g. `BBa_R0010`
version |  the version string to associate with the submission, e.g. `1`
name |  the dcterms name string to assign to the submission
description | the dcterms description string to assign to the submission
citations | a list of comma separated pubmed IDs of citations to store with the submission
overwrite_merge | '0' prevent if submission exists, '1' overwrite if submission exists
file | contents of an SBOL2, SBOL1, GenBank, FASTA, ZIP, or COMBINE Archive file

## POST endpoint to add to an existing collection
### HTTP Request
`POST <SynBioHub URL>/submit `

e.g. `curl -X POST -H "Accept: text/plain" -H "X-authorization: <token>" -F rootCollections=<URI> -F overwrite_merge=<overwrite_merge> -F file=@<filename> https://synbiohub.org/submit`

### Query Parameters
Parameter | Description
--------- | -----------
rootCollections | URI of the private root collection to add content to
overwrite_merge | '2' prevent if submission exists, '3' overwrite if submission exists
file | contents of an SBOL2, SBOL1, GenBank, FASTA, ZIP, or COMBINE Archive file


# Installation

The recommended way to install SynBioHub is via the Docker image.

SynBioHub has both JavaScript (node.js) and Java components.

Prequisites:

* Linux (only tested with Ubuntu 18.04.01) or macOS
* A JDK
* Apache Maven
* node.js >= 6.10
* OpenLink Virtuoso 7.x.x
* rapper (apt install `raptor2-utils`)
* jq (apt install `jq`)

Ubuntu 18.04.01

1. Install Virtuoso 7 from source at https://github.com/openlink/virtuoso-opensource

* Switch to the branch stable/7 before installing.
* Follow the README on installing virtuoso from source. This involves installing all the dependencies and running build commands.
* Currently, Virtuoso does not support versions of OpenSSL 1.1.0 and above, or versions of OpenSSL below 1.0.0. When installing the dependency, build from a binary between those versions from https://www.openssl.org/source/.

2. Set up the Node.js repository
* Download the Node setup script `curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -`
* Update your package repositories `apt update`
3. Install the necessary packages `apt install default-jdk maven raptor2-utils nodejs jq build-essential python`
4. Clone the SynBioHub repository `git clone https://github.com/SynBioHub/synbiohub`
5. Change to the SynBioHub directory `cd synbiohub`
6. Build the Java components with Maven `cd java && mvn package`
7. Return to the root directory and install the Node dependencies with yarn `cd ../ && yarn install` Make sure that yarn is being used, not 'cmdtest'.
8. Install nodemon and forever with `npm install nodemon -g && npm install forever -g`
9. Start virtuoso process `virtuoso-t +configfile /usr/local/virtuoso-opensource/var/lib/virtuoso/db/virtuoso.ini -f`
10. Add SPARQL update rights to the dba user in virtuoso.

* Visit localhost:8890, click conductor on the left hand side, and login with user name dba and password dba.
* Visit system admin -> user accounts in the menu at the top.
* Find the accound labled dba and edit.
* Add SPARQL_UPDATE to roles using the menu at the bottom.
* If no dba account exists, add one, then add update rights.

11. Start the SynBioHub process `npm start` or npm `run-script dev`

# NGINX configuration

Instructions for managing nginx server blocks can be found [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04#step-three-create-server-block-files-for-each-domain).

The server block for a SynBioHub installation listening on port 7777 is [here](http://wiki.synbiohub.org/wiki/NGINX_configuration_instructions).


This is most useful when you would like to host SynBioHub on a subdomain alongside other content (using nginx as an HTTP proxy) or using HTTPS. 



  
