---
title: SynBioHub HTTP API

language_tabs: # must be one of https://git.io/vQNgJ
  - plaintext: shell
  - python
  - javascript


toc_footers:
  - <a href='https://github.com/SynBioHub/synbiohub'>SynBioHub Github</a>
  - <a href='https://groups.google.com/forum/#!forum/synbiohub-users'>Join the SynBioHub Users mailing list</a>
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
* James Scholz†

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

# Installation


## From Prebuilt Image

### Install Docker

First, install [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/).

Ensure that the Docker daemon is running on your system before continuing. On Mac and Windows, a small whale icon in the system tray indicates Docker is running.

On Ubuntu, start docker using: 

```systemctl start docker```

### Starting a SynBioHub Instance

First, pull the docker-compose configuration:: 

```git clone https://github.com/synbiohub/synbiohub-docker```

Then, start SynBioHub with: 

```docker-compose --file ./synbiohub-docker/docker-compose.yml up```

 If you would like to start SynBioHub with [SBOLExplorer](https://github.com/SynBioDex/SBOLExplorer) use the following commands instead: 


```sysctl -w vm.max_map_count=262144```

```docker-compose --file ./synbiohub-docker/docker-compose.yml --file ./synbiohub-docker/docker-compose.explorer.yml up``

### Configuring

In a web browser, visit 

``` http://localhost:7777/ ```

On first startup, you will be taken to the [SynBioHub Setup Page](http://wiki.synbiohub.org/wiki/SynBioHub_Setup_Page), which enables basic setup of the site. After first setup, the [Admin Portal](http://wiki.synbiohub.org/wiki/Admin_Portal) will allow admin users to update their site configuration. 

##### SendGrid email setup
In order to enable SynBioHub to send account-related emails, you need a [SendGrid](https://sendgrid.com/) account and API key. Once you have created your account, you should click "Settings" in the left bar, then "API Keys". On the resulting page, click the "Create API Key" button in the upper-right corner, and give your new API key a name. You should see the key on the next page. Copy the key and paste it into the "SendGrid API Key" in the Mail page on the SynBioHub admin dashboard. Save the API key in SynBioHub and you are ready to begin sending email. 

### Updating

To update a container, pull the new version and start it. 

```cd synbiohub-docker```

``` git pull ```

``` cd .. ```

``` ## if you are not running SBOL Explorer ```

``` docker-compose --file synbiohub-docker/docker-compose.yml pull synbiohub ```

```docker-compose --file synbiohub-docker/docker-compose.yml up ```

``` ## If you are running SBOL Explorer: ```

``` docker-compose --file synbiohub-docker/docker-compose.yml --file synbiohub-docker/docker-compose.explorer.yml pull synbiohub ```

``` docker-compose --file synbiohub-docker/docker-compose.yml --file synbiohub-docker/docker-compose.explorer.yml up ```

###### PERSISTENT LOGS UPDATE

If you are updating from a version earlier than 1.5.2, then you must execute the following command to setup persistent log files: 

```docker exec -it synbiohub-docker_synbiohub_1 mkdir /mnt/data/logs ```

#### If you are updating from a version of SynBioHub earlier than 1.3.0 to 1.3.0 or later, you must execute the following steps to persist your data between instances! ####

``` docker exec synbiohub cp /opt/synbiohub/synbiohub.sqlite /mnt/data/synbiohub.sqlite ```

``` docker exec synbiohub cp -R /opt/synbiohub/uploads /mnt/data/uploads ```

``` docker exec synbiohub chown synbiohub /mnt/data/synbiohub.sqlite ```

``` docker exec synbiohub chgrp synbiohub /mnt/data/synbiohub.sqlite ```

``` docker exec synbiohub chown -R synbiohub /mnt/data/uploads ```

``` docker exec synbiohub chgrp -R synbiohub /mnt/data/uploads ```

To update to the latest version of SynBioHub, first stop and remove the container: 

``` docker stop synbiohub ```

``` docker rm synbiohub ```

Then pull the latest version: 

``` docker pull synbiohub/synbiohub:1.3.0 ```

Finally, run a new container with the latest image: 

``` docker run -v synbiohub:/mnt -p 7777:7777 --name synbiohub -d synbiohub/synbiohub:1.3.0 ```

## From Source

Follow the instructions on the [GitHub README](https://github.com/synbiohub/synbiohub) to install SynBioHub locally on your system. If you would like SynBioHub to run as a service, you can enable Virtuoso using systemd or open a virtual terminal using tmux or GNU screen and run 

``` sudo /usr/local/bin/virtuoso-t +configfile $YOUR_CONFIG_FILE ```

 You should also run SynBioHub as a system service or using a virtual terminal and the command

``` npm start ```

If you are doing development work, you can start SynBioHub with the command 

``` npm run-script dev ```

which will restart the application with any change to the JavaScript source. 

## Publishing Instance

Nginx is used for the [reference instance](https://synbiohub.org/). [NGINX configuration instructions](http://wiki.synbiohub.org/wiki/NGINX_configuration_instructions) 

## NGINX configuration

Instructions for managing nginx server blocks can be found [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04#step-three-create-server-block-files-for-each-domain).

The server block for a SynBioHub installation listening on port 7777 is [here](http://wiki.synbiohub.org/wiki/NGINX_configuration_instructions).


This is most useful when you would like to host SynBioHub on a subdomain alongside other content (using nginx as an HTTP proxy) or using HTTPS. 



 

<aside class="success">Note that the X-authorization header is not needed for public objects, but is required for private objects unless stated otherwise.</aside>

# User Endpoints

Endpoints that control user related functions

## Request to login
Returns a string token to be passed with any call to submit as the `user` parameter. 

This POST request requires email/password and returns a user token needed for viewing private objects and submitting new objects.
 
`POST http://synbiohub.org/login `

```plaintext
`curl -X POST -H "Accept: text/plain" -d "email=<email>&password=<password>" https://synbiohub.org/login`
```

#### Query Parameters
Parameter | Description
--------- | ------- | -----------
email | the e-mail address of the user to login with
password | the password of the user

## Request to logout

`POST http://synbiohub.org/logout `

If `user` is currently logged in, this post request will logout the user.

```plaintext
`curl -X POST -H "Accept: test/plain" localhost:7777/logout`
```

## Request to reset password

# Search Endpoints

## Perform a search and return metadata

`GET <SynBioHub URL>/search/<key>=<value>&...&<search string>/?offset=#&limit=# `

Returns the metadata associated with the specified key and value.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/search/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP/?offset=0&limit=50'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/search/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP/?offset=0&limit=50',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```

```plaintext
 `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" 'https://synbiohub.org/search/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP/?offset=0&limit=50'
```

Note that the X-authorization header is optional, but if provided, the search will also return private objects for the logged in user.

Before URL encoding, the URL is composed of a series of search criteria of the form:

key=value& 

The key/value pair can be one of the following: 

Key/value pair | Description
--------- | -----------
objectType=value | The type of object to search for (e.g. objectType=ComponentDefinition&)
sbolTag=value |  A tag in the SBOL namespace to search for (e.g. role=<http://identifiers.org/so/SO:0000316>&)
collection=value | Matches objects that are members of the specified collection (e.g., collection=<http://synbiohub.org/public/igem/igem_collection>&)
dcterms:tag=value | A tag in the dcterms namespace to search for (e.g. dcterms:title='pLac'&) - note this requires an exact match
namespace/tag=value | A full namespace with tag separated by appropriate delimiter (e.g. <http://sbols.org/v2#role>=<http://identifiers.org/so/SO:0000316>&)

After the key/value pairs, an optional search string can be provided that will be used to search for partial matches in the displayId, name, or description fields.

Finally, the URL can end with an offset and limit parameter.



```plaintext

This endpoint returns JSON metadata of the form 
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

## Returns all Collections that are members of the Collection specified by its URI

`GET <URI>/subCollections`

Returns the collections of members within another collection

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/bsu/bsu_collection/1/subcollections',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/bsu/bsu_collection/1/subcollections`
```

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/bsu/bsu_collection/1/subcollections'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```


## Returns all Collections that are not members of any other Collection

`GET <SynBioHub URL>/rootCollections`

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/igem_collection/1/rootCollections
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/igem_collection/1/rootCollections',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)
```

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/igem_collection/1/rootCollections'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

Note that the X-authorization header is optional, but if provided, it will also return private root collections for the logged in user.

## Perform a search and return count of search results

`GET <SynBioHub URL>/searchCount/<key>=<value>&...&<search string>/?offset=#&limit=# `

Returns the number of items matching the search result.

```python
import requests

response = requests.get(
    'https://synbiohub.org/searchCount/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" 'https://synbiohub.org/searchCount/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP'`
```

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/searchCount/objectType%3DComponentDefinition%26role%3D%3Chttp%3A%2F%2Fidentifiers.org%2Fso%2FSO%3A0000316%3E%26GFP'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

Note that the X-authorization header is optional, but if provided, the search count will also include private objects for the logged in user.


## Count objects

`GET <SynBioHub URL>/<ObjectType>/count`

Returns the number of objects within a specified collection

```plaintext
e.g. curl -X GET https://synbiohub.org/Collection/Count
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/Collection/Count',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```


```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/Collection/Count'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

Note that you can replace `<ObjectType>` with any object type, such as `ComponentDefinition`, `SequenceAnnotation`, etc.

## Perform a SPARQL query

`GET <SynBioHub URL>/sparql?query=<SPARQL query>`

Returns the results of the SPARQL query in JSON format. 

```plaintext
e.g. `curl -X GET -H "Accept: application/json" 'https://synbiohub.org/sparql?query=select%20%3Fs%20%3Fp%20%3Fo%20where%20%7B%20%3Fs%20%3Fp%20%3Fo%20%7D'
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/sparql?query=select%20%3Fs%20%3Fp%20%3Fo%20where%20%7B%20%3Fs%20%3Fp%20%3Fo%20%7D',
    params={'X-authorization': 'token'},
    headers={'Accept': 'application/json'},
)

print(response.status_code)

print(response.json())
```

## Find the Twins of a component

`GET <SynBioHub URL>/twins`

Returns other components that have the same sequence.

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/bsu/BO_5629/1/twins',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/bsu/BO_5629/1/twins`
```

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/bsu/BO_5629/1/twins'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

## Find Similar Components

`GET <SynBioHub URL>/similar`

Returns other components that have similar sequences.

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/bsu/BO_5629/1/similar',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/bsu/BO_5629/1/similar`
```

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/bsu/BO_5629/1/similar'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```
## Find the Uses of an Object

`GET <SynBioHub URL>/uses`

Returns any other object that refers to this object, for example, if this is a component, it will return all other components that use this as a sub-component.

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/bsu/BO_5629/1/uses',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/bsu/BO_5629/1/uses`
```


```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/bsu/BO_5629/1/uses'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

 

# Download Endpoints


## Return source for an attachment with the specified URI

`GET <URI>/download `

Returns the source for an attachment to the specified URI

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/test/attachment_00009TGVMsfEoCdMeRzHrU/1/download'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/test/attachment_00009TGVMsfEoCdMeRzHrU/1/download',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)


```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/test/attachment_00009TGVMsfEoCdMeRzHrU/1/download -O --compressed
```


## Returns SBOL for the object with the specified URI

`GET <URI>/sbol`

Returns the SBOL for the object from the specified URI.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/sbol'
const otherPram={
    headers:{
	"content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
.then(res => res.buffer()).then(buf => console.log(buf.toString()))
.catch (error=>console.log(error))
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_F2620/1/sbol`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_F2620/1/sbol',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

## Returns SBOLnr for the object with the specified URI

`GET <URI>/sbolnr`

Returns the SBOLnr (SBOL not recursive, i.e. fetches the object without its children) for the object from the specified URI.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/sbolnr'
const otherPram={
    headers:{
	"content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
.then(res => res.buffer()).then(buf => console.log(buf.toString()))
.catch (error=>console.log(error))
```


```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_F2620/1/sbolnr`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_F2620/1/sbolnr',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

## Returns metadata for the object with the specified URI

`GET <URI>/metadata`

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/metadata'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_K1479017/1/metadata`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_K1479017/1/metadata',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

Returns the metadata for the object from the specified URI.

## Returns GenBank for the object with the specified URI

`GET <URI>/gb`

Returns the GenBank for the object from the specified URI.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/BBa_K1479017.gb'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_K1479017/1/BBa_K1479017.gb`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_K1479017/1/BBa_K1479017.gb',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

## Returns FASTA for the object with the specified URI

`GET <URI>/fasta`

Returns the FASTA for the object from the specified URI.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/BBa_K1479017.fasta'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_K1479017/1/BBa_K1479017.fasta`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_K1479017/1/BBa_K1479017.fasta',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

## Returns visualization for the object with the specified URI

`GET <URI>/visualization`

Returns the visualization for the object from the specified URI.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/visualization'
const otherPram={
    headers:{
        "content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
    .then(res => res.buffer()).then(buf => console.log(buf.toString()))
    .catch (error=>console.log(error))
```

```plaintext
 `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_K1479017/1/visualization`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_K1479017/1/visualization',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

# Submission Endpoints

## Submit

`POST <SynBioHub URL>/submit `

Create a new collection including the elements within a file or adds to a preexisting collection using the elements within a file.



```plaintext
 `curl -X POST -H "Accept: text/plain" -H "X-authorization: <token>" -F id=<id> -F version=<version> -F name=<name> -F description=<description> -F citations=<citations> -F overwrite_merge=<overwrite_merge> -F file=@<filename> https://synbiohub.org/submit
```

Query Parameters

Parameter | Description
--------- | -----------
id | a user-defined string identifier for the submission; alphanumeric and underscores only, e.g. `BBa_R0010`
version |  the version string to associate with the submission, e.g. `1`
name |  the dcterms name string to assign to the submission
description | the dcterms description string to assign to the submission
citations | a list of comma separated pubmed IDs of citations to store with the submission
overwrite_merge | '0' prevent if submission exists, '1' overwrite if submission exists, '2' to merge and prevent if submission exists, '3' to merge and overwrite matching URIS
file | contents of an SBOL2, SBOL1, GenBank, FASTA, GFF3, ZIP, or COMBINE Archive file
rootCollections | If submtitting the contents into the file, provide the previous parameters, otherwise, only provide a URI into rootCollections to append into an existing collection

## Remove Collection

`GET <URI>/removeCollection `

Removes the specified collection.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/removeCollection'
const otherPram={
    headers:{
	"content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
.then(res => res.buffer()).then(buf => console.log(buf.toString()))
.catch (error=>console.log(error))
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_F2620/1/removeCollection`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_F2620/1/removeCollection',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

## Remove Object

`GET <URI>/remove`

Remove the object specifiedfrom URI, and the references to that object.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/remove'
const otherPram={
    headers:{
	"content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
.then(res => res.buffer()).then(buf => console.log(buf.toString()))
.catch (error=>console.log(error))
```

```plaintext
e.g. `curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_F2620/1/remove`
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_F2620/1/remove',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```

## Replace Object

`GET <URI>/replace `

Remove the object specifiedfrom URI, but leave references to the object in tact.

```javascript
const fetch = require("node-fetch");
const Url = 'https://synbiohub.org/public/igem/BBa_K1479017/1/replace'
const otherPram={
    headers:{
	"content-type" : "text/plain; charset=UTF-8"
    },
    method:"GET"
};
fetch(Url,otherPram)
.then(res => res.buffer()).then(buf => console.log(buf.toString()))
.catch (error=>console.log(error))
```

```plaintext
curl -X GET -H "Accept: text/plain" -H "X-authorization: <token>" https://synbiohub.org/public/igem/BBa_F2620/1/remove
```

```python
import requests

response = requests.get(
    'https://synbiohub.org/public/igem/BBa_F2620/1/replace',
    params={'X-authorization': 'token'},
    headers={'Accept': 'text/plain'},
)

print(response.status_code)
print(response.content)

```


# Edit Endpoints




# Attachment Endpoints

## Attach file to a Specified URI

`POST <URI>/attach `

Attach a specified file to a given URI

```plaintext
curl -X POST -H "Accept: text/plain" -H "X-authorization: <token>" -F 'file=@<filename>' https://synbiohub.org/user/MyUserName/test/test_collection/1/attach
```

## Attach URL to a Specfied URI

`POST <URI>/attachURL `

Attach a specified URL to a given URI

# Administration Endpoints

## Perform a SPARQL admin query

`GET <SynBioHub URL>/admin/sparql?query=<SPARQL query>`

Returns the results of the SPARQL admin query in JSON format.

```plaintext
 ` curl -X GET -H "Accept: application/json" 'https://synbiohub.org/admin/sparql?query=select%20%3Fs%20%3Fp%20%3Fo%20where%20%7B%20%3Fs%20%3Fp%20%3Fo%20%7D'
```

# Plugins

### Rationale 

It should be possible for someone running a SynBioHub instance to configure plugins to extend the functionality of SynBioHub without altering the main codebase. 


### Goals
SynBioHub administrators should be able to:
Add processing steps to the submission pipeline
Add rendering steps construct pages


### Implementation
Plugins and SynBioHub will communicate using HTTP. The end user’s browser will not communicate with the plugin server.

To execute a plugin, SynBioHub will send an HTTP POST request to the plugin’s execute endpoint. The body of the request will contain a JSON object containing:
complete_sbol: the single-use URL for the complete object to operate on
shallow_sbol: the single-use URL for a summarized or truncated view of the object
top_level: the top-level URL of the SBOL object
instanceUrl: the top-level URL of the SBOL object 
size: a number representing an estimate of the size of the object, probably triple count

These pages needn’t be ready immediately upon responding to the SynBioHub plugin request. It should respond with an HTTP 503 error and the Retry-After header set to the number of seconds SynBioHub should wait before retrying.

### Submission
Intake plugins should interpret the complete_data object, which may not be in SBOL, and return a page containing SBOL. This page needn’t be ready immediately upon responding to the SynBioHub plugin request.

### Curation
Intake plugins should interpret the complete_data object, which will be in SBOL, and return a page containing SBOL. This page needn’t be ready immediately upon responding to the SynBioHub plugin request.

### Download
The response of download plugins should be a URL where the representation of the part can be downloaded. This page needn’t be ready immediately upon responding to the SynBioHub plugin request.

### Rendering
The response of rendering plugins should be HTML which will be displayed on the top-level page. Rendering responses may be cached to improve performance.


### Plugin Specification
Plugins must provide two endpoints, /status and /run. 

### Status endpoint
The status endpoint should listen for HTTP GET requests and return an HTTP 200 OK and (optionally) a short message if the plugin service is ready to handle requests. Otherwise, an HTTP error code and short error message should be returned. 

### Run endpoint
The run endpoint should function as described above in the Implementation section. 
 


  
