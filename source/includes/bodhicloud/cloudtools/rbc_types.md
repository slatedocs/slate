####rbc-types


Basic command line tool for interacting with the RBC cloud services API

###Installation & Setup

rbc-types is included in the bodhi as a separate executable. To verify the availability of the tool use

````
> rbc-types -V
M.m.b
````

- or -

````
> rbc-types info
rbc-types v M.m.b
...
License Apache-2
Copyright 2014 Redbook Connect
````

###Local Commands

#####Usage

#####Type Commands

````
> rbc-types <cmd> <type-name> [model-options]
````

#####Property Commands

````
> rbc-types <cmd> <type-name> [prop-options] <property> [propery ...]
````

###Commands

Local commands operate on JSON structures stored on the local filesystem.

option       | meaning
-----        | ----------
namespace    | the namespace of the type
embedded     | this type does is not stored independently
immutable    | instances of this type do not support updates
encapsulated | this type does not support normal CRUD operations
extensible   | this type may be extended


command | aliases | description
-------  | -------  | ------
new      | create   | create a new type
rename   | move, mv | change the name of the type
edit     | modify   | edit the type metadata
remove   | rm       | remove a local type
view     | print    | print the local type definition


#####Type Name

A typename is the just the system name for the type and not a file system name. The name SHOULD NOT include an directory information or the .json suffix when used by the commands.

#####Type Options

option       | meaning
-----        | ----------
namespace    | the namespace of the type
embedded     | this type does is not stored independently
immutable    | instances of this type do not support updates
encapsulated | this type does not support normal CRUD operations
extensible   | this type may be extended

#####Property Options

option     | short | meaning
-----      | ____  | ----------
type       |       | the type associated with the property
required   | r     | property is required to have a value
multi      | r     | the property is multi valued (json array)
unique     | u     | the property contains a unique value within a collection
scale      | s     | how many decimal places should be kept
default    |       | the default value of the property if not set

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

###Remote Commands

Remote commands operate on types store on an service installation. These commands share many of the same options as the http commands.

#####Usage

````
> rbc-types <cmd> <type-name> [env-options]
````

#####Commands

command  | aliases | description
-------  | ------- | -----------
list     | ls      | list all the types on the remote system
get      | read    | print a remote type
fetch    | pull, download  | fetch a remote type and store locally
post     | push, upload    | install a remote type on the server
delete   | destroy | destroy the type on the system
listp    | lp      | list the properties of a remote

#####Type Names

The typename is the just the name and not a partial url path. The user MUST assume that `/namespace/type/` will be prepended to the name prior to sending the request. Any initial slash will be tolerated but is not required. Any additional path elements will be appended to the `namespace/types/` prior to executing the request.

#####Options

All remote commands require an environment. These options behave consistently with those in the  If none is specifed then the command will use the default. If no default is set then to command will fail.

###Command Details

###New

Create a new type locally

#####Signature

````
> rbc-types new <typename> --namespace <namespace> [type-options]
````
#####Aliases

1. create

#####Arguments

1. typename

#####Options

1. namespace is a required parameter

#####Return

The name of the created model


###Rename

Rename an existing model.

#####Signature

````
> rbc-types rename <from> <to>
````
#####Aliases

1. mv
2. move

#####Arguments

1. from
2. to

#####Return

The 'to' name of the model

###Edit

Change the type's metadata

#####Signature

````
> rbc-types edit <typename> [type-options]
````
#####Aliases

1. modify

#####Arguments

1. typename - name of the type to be modified

#####Return

The model's name

###Remove

Remove the model from the local filesystem.

#####Signature

````
> rbc-types remove <typename>
````
#####Aliases

1. rm

#####Arguments

1. typename - name of the type to be removed

#####Return

The removed model's name

###Echo

Print a type to the screen

#####Signature

````
> rbc-types echo <typename>
````
#####Aliases

1. print

#####Arguments

1. typename - name of the type to be printed

#####Return

The model as a JSON object

###Set-Prop

Add or Replace a Property in a Type

#####Signature

````
> rbc-types set-prop <typename> [property-options] <propertyName>
````
#####Aliases

None

#####Arguments

1. typename - the name of the type
2. propertyName - the name of the property to add/replace

#####Return

The typename

###Mv-Prop

Rename an existing property

#####Signature

````
> rbc-types mv-prop <typename> <from> <to>
````
#####Aliases

rename-prop

#####Arguments

1. typename - the name of the type that has the property
2. from - the existing property's name
2. to - the new property name

#####Return

The typename modified

###rm-Prop

Remove an existing property

#####Signature

````
> rbc-types rm-prop <typename> <propertyName>
````
#####Aliases

remove-prop

#####Arguments

1. typename - the name of the type that has the property
1. propName - the name of the property to remove

#####Return

The typename modified

###gen-instance

Generate a sample instance of the type

#####Signature

````
> rbc-types gen-instance <typename>
````
#####Aliases

None

#####Arguments

1. typename - the name of the type to be generated a insatnce from

#####Return

Prints a sample instance as a JSON object

###fetch

Download and store a copy of a type

#####Signature

````
> rbc-types [env-options] fetch <typename>
````
#####Aliases

download, pull

#####Arguments

1. typename

#####Return

The typename modified

###get

Print a type stored on the server

#####Signature

````
> rbc-types [env-options] get <typename>
````
#####Aliases

read

#####Arguments

1. typename

#####Return

The typename modified

###list

List all the types on the server for the environment

#####Signature

````
> rbc-types [env-options] list
````
#####Aliases

ll

#####Arguments

None

#####Return

A JSON array of the current remote types for the environment

###delete

Destroys a remote type

#####Signature

````
> rbc-types [env-options] delete <typename>
````
#####Aliases

destroy

#####Arguments

1. typename - the type to be deleted

#####Return

The typename deleted

###post

Posts a local type definition to the remote server

#####Signature

````
> rbc-types [env-options] post <typename>
````
#####Aliases

upload, push

#####Arguments

1. typename - the name of the type to be sent to the server

#####Return

The typename posted


