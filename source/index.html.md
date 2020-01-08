---
title: SynBioHub HTTP API

language_tabs: # must be one of https://git.io/vQNgJ
  - plaintext: shell
  - python
  - javascript


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

 

# Documentation

<aside class="success">Note that the X-authorization header is not needed for public objects, but is required for private objects unless stated otherwise.</aside>

## User Endpopints

Endpoints that control user related functions

### Request to login
Returns a string token to be passed with any call to submit as the `user` parameter. 

This POST request requires email/password and returns a user token needed for viewing private objects and submitting new objects.
 
`POST http://synbiohub.org/login `

```plaintext
e.g.`curl -X POST -H "Accept: text/plain" -d "email=<email>&password=<password>" https://synbiohub.org/login`
```

#### Query Parameters
Parameter | Description
--------- | ------- | -----------
email | the e-mail address of the user to login with
password | the password of the user
### Request to logout
If `user` is currently logged in, this post request will logout the user.

`POST http://synbiohub.org/logout `

```plaintext
e.g. `curl -X POST -H "Accept: test/plain" localhost:7777/logout`
```

### 


## Plugin Endpoints

## Edit Mutable Fields Endpoints

## Submission Endpoints

## Collection View Endpoints

## Administration Endpoints

## Search Endpoints

## Manage Submission Endpoints

## Update Permissions Endpoints

## Attachment Endpoints

## Download Endpoints

## View/Download Endpoints

## Misc. endpoints

# NGINX configuration

Instructions for managing nginx server blocks can be found [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04#step-three-create-server-block-files-for-each-domain).

The server block for a SynBioHub installation listening on port 7777 is [here](http://wiki.synbiohub.org/wiki/NGINX_configuration_instructions).


This is most useful when you would like to host SynBioHub on a subdomain alongside other content (using nginx as an HTTP proxy) or using HTTPS. 



  
