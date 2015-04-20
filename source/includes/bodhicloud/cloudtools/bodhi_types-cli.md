####Bodhi CLI types


Bodhi-types is a command line tool bundled with bodhi-cli, that allows developers to interact with the RBC cloud services API.

###Installation & Setup

bodhi-types is included in the bodhi as a separate executable. To verify the availability of the tool use the following commands;

````
> bodhi-types -V
M.m.b
````
- or -

````
> bodhi-types info
bodhi-types v M.m.b
...
License Apache-2
Copyright 2014 Redbook Connect
````
###Arguments
The first entry is the name of the tool. The second argument is the command. All subsequent arguments are command specific.

###Command Organization

The commands are grouped into two main sub groups.
The following Commands groups are;

###Local Commands
* new      
* rename   
* remove   
* view     
* view-props
* set-prop
* mv-prop
* rm-prop
* gen-instance

###Remote Commands
* list
* get
* fetch
* post
* delete

###Local Commands

**NOTE:** Local commands operate on JSON structures stored on the local filesystem.

#####Type Commands
````
> bodhi-types <cmd> <type-name> [model-options]
````
#####Property Commands
````
> bodhi-types <cmd> <type-name> [prop-options] <property> [property ...]
````
###Local Commands

new      | create   | create a new type
rename   | move, mv | change the name of the type
edit     | modify   | edit the type metadata
remove   | rm       | remove a local type
view     | print    | print the local type definition
view-props |          | print all non-system properties of the type
set-prop   |          | create or replate a property
mv-prop    |          | rename an existing property
rm-prop    |          | remove an existing property
gen-instance

#####Type Name

A typename is the just the system name for the type and not a file system name. The name SHOULD NOT include an directory information or the .json suffix when used by the commands.

#####Type Options

short | long       | meaning
----- |-----        | ----------
none | --namespace    | the namespace of the type
none | --embedded     | this type does is not stored independently
none | --immutable    | instances of this type do not support updates
none | --encapsulated | this type does not support normal CRUD operations
none | --extensible   | this type may be extended

#####Short Hand Types

All system scalara have a special character designation to make them easier to describe. Those designators are listed below.

option | meaning
-----  | ----------
B      | Boolean
I      | Integer
R      | Real
D      | Decimal
C      | Currency
S      | String
T      | DateTime
G      | GeoJSON
L      | Link

###Local Commands
* new      
* rename   
* remove   
* view     
* view-props
* set-prop
* mv-prop
* rm-prop
* gen-instance

###new

__Aliases__: _create_

Create a new type locally

````
> bodhi-types new <typename> 
````
#####Arguments
arg     |  type-options | description
:------:| :---------: | :------: | :-------------
typename |  type-options |returns the new type name 

#####Options

  type-options | arg  | description
:------: |:----: |:-------------
none | none | none

#####Return Response
Response | Description
:------- | :----------
created the type name | The name of the created type

###rename

__Aliases__: _move_, _mv_

Rename an existing model from the current name to a new name.

````
> bodhi-types rename <from> <to>
````
#####Arguments
arg1 | arg2    |  type-options | description
:------:| :---------: | :------: | :-------------
from | to |  type-options |rename an existing model 

#####Options

  type-options    | description
:------: | :-------------
none | none

#####Return Response
Response | Description
:------- | :----------
the to [arg2] | The new name of the type
failed to load local type [arg1] | can not find local type

###edit

__Aliases__: _modify_

Change the type's metadata

````
> bodhi-types edit <typename> [type-options]
````
#####Arguments
arg1 |   type-options | description
:------:| :---------: | :------: | :-------------
typename |   type-options |name of the type to be modified 

#####type-Options

short | long       | meaning
----- |-----        | ----------
none | --namespace    | the namespace of the type
none | --embedded     | this type does is not stored independently
none | --immutable    | instances of this type do not support updates
none | --encapsulated | this type does not support normal CRUD operations
none | --extensible   | this type may be extended

#####Return Response
Response | Description
:------- | :----------
the typename | The Model's name

###remove

__Aliases__: _rm_

Remove the model from the local filesystem.

````
> bodhi-types remove <typename>
````
#####Arguments
arg  | description
:------:| :-------------
typename |name of the type to be removed 

#####Return Response
Response | Description
:------- | :----------
model name | The removed model's name

###view

__Aliases__: _print_

Print a type to the screen

````
> bodhi-types view <typename>
````
#####Arguments
arg  | description
:------:| :-------------
typename | name of the type to be printed 

#####Return Response
Response | Description
:------- | :----------
json object | The model as a JSON object

{ name: 'freddy', storage_name: 'freddy', properties: {} }

#####Property Commands
````
> bodhi-types <cmd> <type-name> [prop-options] <property> [property ...]
````

#####Property Options

short | long   | meaning
:-----      | :-----: | :----------
  none  | --type       | the type associated with the property
-r | --required  | property is required to have a value
 none | --multi | the property is multi valued (json array)
-u | --unique   | the property contains a unique value within a collection
-s |--scale     | how many decimal places should be kept
 none |--default   | the default value of the property if not set

###set-prop

__Aliases__: 

Add or Replace a Property in a Type

````
> bodhi-types set-prop <typename> [property-options] <propertyName>
````
#####Arguments
arg1  |  arg2 | description
:------:| :-------------
typename | property name | the name of the type and the property to be added or modified

#####Return Response
Response | Description
:------- | :----------
typename | the name of the type

###mv-prop

__Aliases__: _rename-prop_

Rename an existing property

````
> bodhi-types mv-prop <typename> <from> <to>
````
#####Arguments
arg1  |  arg2 | arg3 | description
:------:| :-------------
typename | the existing property's name | the new property name | rename the property of type to new property name

#####Return Response
Response | Description
:------- | :----------
typename | the name of the type modified

###rm-prop

__Aliases__: _remove-prop_

Remove an existing property

````
> bodhi-types rm-prop <typename> <propertyName>
````
#####Arguments

1. typename - the name of the type that has the property
1. propName - the name of the property to remove

#####Return

The typename modified

###gen-instance

__Aliases__: 

Generate a sample instance of the type

````
> bodhi-types gen-instance <typename>
````
#####Arguments

1. typename - the name of the type to be generated a insatnce from

#####Return

Prints a sample instance as a JSON object

###Remote Commands

Remote commands operate on types store on an service installation. These commands share many of the same options as the http commands.

````
> bodhi-types <cmd> <type-name> [env-options]
````

#####Commands

command  | aliases | description
-------  | ------- | -----------
list     | ls      | list all the types on the remote system
get      | read    | print a remote type
fetch    | pull, download  | fetch a remote type and store locally
post     | push, upload    | install a remote type on the server
delete   | destroy | destroy the type on the system
     | lp      | list the properties of a remote

#####Type Names

The typename is just the name and not a partial url path. The user MUST assume that `/namespace/type/` will be prepended to the name prior to sending the request. Any initial slash will be tolerated but is not required. Any additional path elements will be appended to the `namespace/types/` prior to executing the request.

#####Options

All remote commands require an environment. These options behave consistently with those in the  If none is specifed then the command will use the default. If no default is set then the command will fail.


###list

__Aliases__: _ll_

List all the types on the server for the environment

````
> bodhi-types [env-options] list
````
#####Arguments

None

#####Return

A JSON array of the current remote types for the environment

###fetch

__Aliases__: _download_, _pull_

Download and store a copy of a type

````
> bodhi-types [env-options] fetch <typename>
````
#####Arguments

1. typename

#####Return

The typename modified

###get

__Aliases__: _read_

Print a type stored on the server

````
> bodhi-types [env-options] get <typename>
````
#####Arguments

1. typename

#####Return

The typename modified

###delete

__Aliases__: _destroy_

Destroys a remote type

````
> bodhi-types [env-options] delete <typename>
````
#####Arguments

1. typename - the type to be deleted

#####Return

The typename deleted

###post

__Aliases__: _upload_, _push_

Posts a local type definition to the remote server

````
> bodhi-types [env-options] post <typename>
````
#####Arguments

1. typename - the name of the type to be sent to the server

#####Return

The typename posted


