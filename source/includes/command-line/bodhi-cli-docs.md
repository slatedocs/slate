##Bodhi CLI tools

Command Line Tools for the Bodhi Cloud

###Installation

The cli tools require a nodejs runtime and are installed using the node package manager (npm).

````
> npm install -g bodhi-cli
````

Not that on *nix based systems and Macs, a global install command MUST be run using sudo.

One the tools are installed, verify the installation using the version command. The command SHOULD respond with a semantic version of the tools: M is the major version, m is the minor version, and b is the build increment.

````
> bodhi -V
  M.m.b
````

### Getting Started

2. Create a directory for your workspace and `cd` into it.
3. `bodhi init` <br> This will create a rbc-project.json which will house all your environment info. It will
also create an /apps directory where your apps will reside.
4. `bodhi new [ENVIRONMENT NAME]` This will create a new environment entry in rbc-project.json.
5. Open up rbc-project.json and fill in information about your new environment. <br>
Example: <br>
```
{
     "environments": {
           "[ENVIRONMENT NAME]": {
               "uri": "[API ENDPOINT]",
               "user": "[USERNAME]",
               "password": "[PASSWORD]",
               "namespace": "[NAMESPACE]"
          }
     },
     "default": "[ENVIRONMENT NAME]"
}
```
Once you do this, all commands will be used under the default environment unless you specify otherwise with the -e flag.

###General Str

#####Common Usage

````
<rbc-tool> [options] <command> [arguments ..]
````
The first entry is the name of the tool. The second argument is the command. All further arguments are interpretted in the context of the command.

Options can be specified anywhere on the command line __AFTER__ the tool designation. The following commands are considered equivalent.

````
bodhi -e my-environment -v command
````
````
bodhi -v command -e my-environment
````
````
bodhi command -v -e my-environment
````

#####Processing Options

The following switch are universal and have consistent semantics across the tools.

long    | short | meaning
----    | ----- | -------
version | V     | request the version of a tool
help    | H     | request help in the form of usage instructions
verbose | v     | execute the command with intermediate output
debug   | d     | execute the command in debug mode
force   | f     | force the command to ignore saftey considerations
no-color| C     | do not use color

###Project Commands

* pwd
* init

###pwd

__Aliases__: _home_

This command will print the home directory of the current project.

#####Arguments

None.

#####Return

Platform specific directory path of the current project.

#####Sample

````
> bodhi pwd
/path/to/project/root
````

###init

This command will establish the current directory as a new project by creating a new rbc-project.json file. This command will fail safely if an existing rbc-project.json file exists up the directory tree. A user may create a project in a subfolder by using the --force command line option.

````
> bodhi init [-f]
/path/to/new/project/root
````

#####Arguments

None.

#####Return

Platform specific directory path to the newly initialized project.

###Environment Commands

### General Command Signature

````
> bodhi <action> <environment> [env-options] [processing-options]
````

###Commands

* new
* rename
* copy
* edit
* remove
* set-default
* get-default
* list
* view
* whoami
* whereami
* uri
* user
* namespace

###Environment Options

long      | short | meaning
----      | ----- | -------
uri       | s     | request help in the form of usage instructions
username  | u     | execute the command with intermediate output
password  | p     | execute the command in debug mode
namespace | n     | force the command to ignore saftey considerations

###new

__Aliases__: _create_

This command will create a new environment in the project

#####Arguments

1. environment name - the name of the environment to create

#####Return

The name of the newly created environment

#####Signature

````
> bodhi new <env-name> [env-options] [processing-options]
<env-name>
````

###rename

__Aliases__: _mv_, _move_

This command will rename an existing environment and optionally update its configuration if environment options are present.

#####Arguments

1. from - the name of the environment to rename
2. to   - the new name for the environment

#####Return

The new name of the existing environment

#####Signature

````
> bodhi rename <from> <to> [env-options] [processing-options]
<env-name>
````

###copy

__Aliases__: _cp_, _clone_

This command will copy an existing environment and optionally update the copy with new setting if environment options are present.

#####Arguments

1. from - the name of the environment to copy
2. to   - the name of the new environment

#####Return

The new name of the newly created environment

#####Signature

````
> bodhi copy <from> <to> [env-options] [processing-options]
<from>
````

###edit

__Aliases__: _update_, _modify_

This command changes an exiting environment's settings based on the environment options are supplied.

#####Arguments

1. environment - the name of the environment to change

#####Return

The name of the environment that was modified

#####Signature

````
> bodhi edit <environment> [env-options] [processing-options]
<env-name>
````

###remove

__Aliases__: _rm_, _del_

#####Arguments

1. environment - the name of the environment to remove

#####Return

The name of the environment that was removed

#####Signature

````
> bodhi remove <environment> [env-options] [processing-options]
<env-name>
````

###set-default

Establish the default environment to use for all remote commands.

#####Arguments

1. environment - the name of the environment to be the default

#####Return

The name of the environment that is now the default

#####Signature

````
> bodhi set-default <environment> [processing-options]
<environment>
````

###get-default

Print the default environment for the current project

#####Arguments

None

#####Return

The name of the default environment

#####Signature

````
> bodhi get-default <environment> [processing-options]
<environment>
````
###list

__Aliases__: _ls_, _ll_, _dir_

Print the names of a project's environments

#####Arguments

1. environment - the name of the environment to remove

#####Return

A JSON array containing the names

#####Signature

````
> bodhi list <environment> [processing-options]
[
  "env",
  "env2"
]
````

###view

__Aliases__: _display_, _print_, _show__

Print the structure of the named enviroment

#####Arguments

1. environment - the name of the environment to remove

#####Return

A JSON object representation of the current environment.

#####Signature

````
> bodhi view <environment> [processing-options]
{
  "uri":"uri",
  "user":"user",
  "password":"password",
  "namespace":"namespace",
}
````

###Special Print Commands

The following commands can be used to print/return a specific value of environment configuration.

command  | prints
------   | -------
user     | the name of the user
username | the name of the user
whoami   | the name of the user
whereami | the base uri stem uri + namespace
uri      | the envrionment's base uri
url      | the envrionment's base uri
namespace| the envrionment's namespace
namespace| the envrionment's namespace


#####Signatures

These commands have three possible signatures

Preferred

````
> bodhi <cmd> <environment> [processing-options]
````

Acceptable

````
> bodhi <cmd> -e <environment-name>
````

Default (uses the default environment if set)

````
> bodhi cmd
````

####rbc-types


Basic command line tool for interacting with the RBC cloud services API

#####Installation & Setup

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

command  | aliases  | description
-------  | -------  | -----------
new      | create   | create a new type
rename   | move, mv | change the name of the type
edit     | modify   | edit the type metadata
remove   | rm       | remove a local type
view     | print    | print the local type definition
view-props |          | print all non-system properties of the type
set-prop   |          | create or replate a property
mv-prop    |          | rename an existing property
rm-prop    |          | remove an existing property
gen-instance |      | generate a sample object based on the type

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


