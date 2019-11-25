---
title: SynBioHub HTTP API

language_tabs: # must be one of https://git.io/vQNgJ
  - http: HTTP
  - java: Java

toc_footers:
  - <a href='#'>Join the SynBioHub Users mailing list</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

SynBioHub[1] is a design repository for synthetic biology, built on the SBOL Stack[2] functionality. It is available both as a public website for you to use and as open source software. SynBioHub uses the Synthetic Biology Open Language (SBOL), an open-source standard for representing genetic designs, and also allows sharing design parts from GenBank and FASTA files.

* If you just want to use the public repository service via your Web browser, head over to synbiohub.org.
* If you want to install your own SynBioHub instance, check out Installation
* If you would like to write software that uses design information stored in a SynBioHub instance, check out the HTTP API or Java API

###### 1.SynBioHub: A Standards-Enabled Design Repository for Synthetic Biology. McLaughlin, J. A., Myers, C. J., Zundel, Z., Mısırlı, G., Zhang, M., Ofiteru, I. D., Goñi Moreno, A., & Wipat, A. (2018). ACS synthetic biology, 7(2), 682-688.
###### 2.The SBOL Stack: A Platform for Storing, Publishing, and Sharing Synthetic Biology Designs. Madsen, C., McLaughlin, J. A., Mısırlı, G., Pocock, M., Flanagan, K., Hallinan, J., & Wipat, A. (2016). ACS synthetic biology, 5(6), 487-497.

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

```http
e.g. curl -X GET https://synbiohub.org/Collection/Count

Note that you can replace <code>Collection</code> with any object type, such as <code>ComponentDefinition</code>, <code>SequenceAnnotation</code>, etc.
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

# Terms

### Id
* An id is a string of characters that MUST be composed of only alphanumeric or underscore characters and MUST NOT begin with a digit.

### Version
* A version is a string of characters that MUST be composed of only alphanumeric characters, underscores, hyphens, or periods and MUST begin with a digit.

### Collection
* A Collection is a group of parts, devices, and other information.  For more information see the description of [Collection](http://sbols.org/v2#Collection) in the SBOL specification.

### Component
* A Component is a region of a DNA/RNA molecule, a protein, a small molecule, or any other structural unit used in a biological design.  In SBOL, this is known as a [ComponentDefinition](http://sbols.org/v2#ComponentDefinition).

###Sequence
    
* A Sequence is a ordered list of nucleotides, amino acids, etc. For more information see the description of [Sequence](http://sbols.org/v2#Sequence) in the SBOL specification.

### Module
* A Module is a group of Parts that interact to produce a desired functional behavior.  In SBOL, this is known as a [ModuleDefinition](http://sbols.org/v2#ModuleDefinition).

### Model
* A Model is a reference to a computational model encoded in a language such as SBML. For more information see the description of [Model](http://sbols.org/v2#Model) in the SBOL specification.

### Attachment
* An Attachment is a reference to a file, which may include additional information such as a plot or experimental data.  In SBOL, this is represented using a [GenericTopLevel](http://sbols.org/v2#GenericTopLevel).

### Implementation
* An Implementation is a reference to a physically built implementation of a specific design (either a Component or a Module).  In SBOL, this is known as a [Implementation](http://sbols.org/v2#Implementation).  

# Instances

There is a public instance of SynBioHub located at [http://synbiohub.org synbiohub.org].  This is a public instance that is intended to be easily accessible for end-users wishing to share designs.

### Maintainers

This instance is currently maintained by the [ICOS Group](http://ico2s.org)  at [Newcastle University](http://ncl.ac.uk).  The technical contact is [James Alastair McLaughlin](mailto:j.a.mclaughlin@ncl.ac.uk).

# Admin Portal

The SynBioHub Administrator Portal is the place to manage an installation of SynBioHub. 

### Status
* The status page is probably the simplest of the administrative pages. At a glance, it shows some instance-specific settings that can be useful in diagnosing issues with your SynBioHub instance. As such, please include a screenshot of this page in bug reports logged on our [https://www.github.com/SynBioHub/SynBioHub/issues Issue Tracker].

### Users
* The users page allows you to alter user information and privileges. Please note that the save buttons along the right-hand side of the screen operate on a per-use basis, so you must save any changes you make for every user you changed. It is not possible for an administrator to change a user ID, username, or password -- User IDs and Usernames cannot be changed after creation, and passwords can only be changed by the user. 

### Mail
* To enable creation of users by administrators and user password resets, a SendGrid account is required. Once you have a SendGrid account, use this page to input or modify your account credentials. 

### Graphs
* This page shows the number of triples stored in each Virtuoso graph. This is often useful in diagnosing issues with SynBioHub; as such, it may be useful to include the info included on this page in bug reports.

### Remotes
* This page is used to connect your instance of SynBioHub to ICE registries and Benchling accounts. 

### Registries
* One of the most powerful features of SynBioHub is its ability to federate with other instances of SynBioHub. This functionality is currently under active development.

### Theme
* This page enables you to change the themeing of your site -- the logo, the front-page text, and the color scheme.

### Backup
* This feature enables backing up your Virtuoso data. To use, first click 'Create Backup'. All backups are shown in the list here. You can restore from any backup shown.


  
