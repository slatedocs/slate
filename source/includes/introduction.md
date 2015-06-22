# Introduction

Welcome to SD Elements API(v2)! Our API provides RESTful HTTP access to a large part of the functionality of SD Elements.

SD Elements's API documentation page was created with [Slate](http://github.com/tripit/slate)

### Resources

The most common types of resources obtained from this API are *Collections* and *Elements*.  A collection resource represents the set of all objects of one type (such as "projects" or "applicatoins").An element resource represents an individual member of a collection.  Each element consists of a set of name/value pairs.


### API Format

API results are currently returned in XML and JSON formats.  It is advised to use the JSON format only.Specify the JSON format by including the HTTP header in all requests:


`Content-type: application-json`

## Include & Expand Options

Some endpoints allow users to *include* or *expand* certain objects included in the response object.

* **Include**: Used to add a specific field to an element, or collection of elements. *For example, we may wish to receive a collection of projects that are within an application element.  Since projects are normally not a field of the applications element, we can include projects in our request to see it as a field.*

`/?include={field_to_include}`

* **Expand**: Used to expand a given field of an element into a nested element with more information. *For example, by default, an application element contains the id of the business unit to which it belongs.  If we wish to retreive more information about the business unit, we would expand the business unit field get more information.*

`/?expand={field_to_expand}`

**It is possible to include and expand more than one field simultaneously.**

`/?include={field1},{field2}&expand={field3},{field4}`
