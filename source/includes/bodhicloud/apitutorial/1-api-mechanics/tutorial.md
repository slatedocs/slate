#### API Mechanics Tutorial

##### Overview

In this tutorial you will explore the basics of the bodhi api using the command line tool.

**Intended Audience**

This tutorial is designed for a new developer looking to understand how to interact with data. The tutorial assumes the developer has valid credentials for a namespace, the bodhi command line tool, and has set up their environment.

##### How To

**Resource Commands**

All resource commands take the following structure:
````
> bodhi <action> [options] resources/:resource-name/[:id][?:query]
````
Actions

1. get
2. count
3. post
4. put
5. put
6. delete

**Resource URL's::**

All resource URL's should start with `resources` and should take care not to prefix with the '/' character. The '/' character causes the cli to interpret the partial URL as absolute and will remove the namespace attributed.

A resource collection is referred to by `resources/:resource`. A resource instance is referred to by `resources/:resource/:id`.

Views

Each command has a default that it presents on response from the service. These views can be overwritten when the CLI is invoked using the the `--view` option. The table below shows the default view bindings for each action.

view     | defaults for       | description
----     | ------------       | -----------
status   | put, patch, delete | print just the status code
headers  |                    | print the headers and status code
location | post               | print the value of the location header
id       |                    | print the id of the newly created object
entity   | get                | print the content returned by the server
all      |                    | print status, headers, and content

Options

Below are a list of useful options when interacting with resources

option     |  description
----       | --file     | file containing resource instance
--data     | describe the resource instance inline
--color    | print the response object with syntax highlighting
--flat     | print the response object without line breaks or indention

**Reading Resources**  
Reading a collection of Resources

Our first query will attempt to extract all the resources in a given collection using the get action.

````
> bodhi get resources/MyResource
````

Counting Resources

````
> bodhi get resources/MyResource/count
{ count: 3 }
````

The CLI exposes a shorthand for this command using the count action.

````
> bodhi count resources/MyResource
{ count: INTEGER }
````

Fetch a Resource by ID

````
> bodhi get resources/MyResource/:id
````

Fetch by unique Attribute

````
> bodhi get resources/MyResource/:id?where={\"name\":\"My-Name\"}
````


**Creating Resources**

Look inside the file resource.json to see the resource description.

````(javascript)
{
  name     : ""
  age      : 0,
  eligible : false,
}
````

You can create an instance of new resource instance by posting JSON data to the collection. The API will return the id of the newly created id in the form of a relative resource URI. The new resource to be created can be specified as a file using the -f --file option and pointing at the resource.json file.

````
> bodhi post resources/MyResource --file resource.json
:namespace/resources/MyResource/:id
````

If you supply the `--view id` option then you will only see the new resource's id.

````(json)
{ eligible: true,
  age: 12,
  name: 'My Name',
  sys_namespace: 'namespace',
  sys_version: 1,
  sys_created_at: '2015-01-24T06:57:39+0000',
  sys_created_by: 'user_name',
  sys_type_version: 1,
  sys_id: 'de9a3e93-47fa-4537-a80d-3f3b49b446b1' }
````
Note there are a number of new system attributes that have been added to the resource. Those attributes are read only from an application perspective and are managed on your behalf by the system.

** Updating Resources**

The system supports two forms of update - replace and patch. When updating a resource it is not necessary to specify any of the system attributes (those that start with the prefix `sys_`). Those attributes will be ignored by the API and will be updated by the service.

 Replacing the Resource

A complete update is performed using a PUT. If the command succeeds then the newly specified resource will be assigned to the resource's id. A resource's attributes may be created, changed, or deleted using this action.

````
> bodhi put resources/MyResource/:id --file resource.json
  Success 204 No Content
````

````(json)
{ eligible: false,
  age: 12,
  name: 'my-name',
  sys_namespace: 'brian',
  sys_version: 3,
  sys_created_at: '2015-01-24T07:42:46+0000',
  sys_created_by: 'admin__brian',
  sys_type_version: 1,
  sys_id: 'd5aea468-f165-4d97-af16-7caba756ca43',
  sys_modified_at: '2015-01-24T08:18:57+0000',
  sys_modified_by: 'admin__brian' }
````

If you then access the record you will see the last modified time stamp has been changed and the instance_version will be incremented.

````
> bodhi get resource/MyResource/:id
  {
    ...
    sys_version    :  version++
    sys_modified_at: 'ISO-TS-FOR-NOW'
    sys_modified_by: 'your-user-id'
  }
````


**Deleting Resources**

Delete a Resource

Most of the time we will delete a resource by id. In this case we use a relative resource uri with an id at the end of the path. 

````
> bodhi delete resources/MyResource/:id
Success 204 No Content
````

If an resource matching that id exists then you will receive an HTTP 204. If no resource with the specified id exists then the API will return a 404 Not Found status.

Delete the entire Collection

If you want to delete all resources in a particular collection the use the following command. 

````
> bodhi delete resources/MyResource
Success 204 No Content
````

If the command returns successfully then you will receive an HTTP 204 and all the records will be deleted. You can verify the results of this command by trying to read the entire collection

````
> bodhi get resource/MyResource
[]
````

or by getting the count and verifying that it returns 0.

````
> bodhi count resources/MyResource
{count: 0}
````