bodhi CLI tools
=============

Command Line Tools for the Bodhi Cloud

##Installation

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

## Getting Started

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

##General Str

###Common Usage

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

###Processing Options

The following switch are universal and have consistent semantics across the tools.

long    | short | meaning
----    | ----- | -------
version | V     | request the version of a tool
help    | H     | request help in the form of usage instructions
verbose | v     | execute the command with intermediate output
debug   | d     | execute the command in debug mode
force   | f     | force the command to ignore saftey considerations
no-color| C     | do not use color

##Project Commands

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

##Environment Commands

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

rbc-types
=========

Basic command line tool for interacting with the RBC cloud services API

##Installation & Setup

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

##Local Commands

####Usage

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

####Type Name

A typename is the just the system name for the type and not a file system name. The name SHOULD NOT include an directory information or the .json suffix when used by the commands.

####Type Options

option       | meaning
-----        | ----------
namespace    | the namespace of the type
embedded     | this type does is not stored independently
immutable    | instances of this type do not support updates
encapsulated | this type does not support normal CRUD operations
extensible   | this type may be extended

####Property Options

option     | short | meaning
-----      | ____  | ----------
type       |       | the type associated with the property
required   | r     | property is required to have a value
multi      | r     | the property is multi valued (json array)
unique     | u     | the property contains a unique value within a collection
scale      | s     | how many decimal places should be kept
default    |       | the default value of the property if not set

####Short Hand Types

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

####Usage

````
> rbc-types <cmd> <type-name> [env-options]
````

####Commands

command  | aliases | description
-------  | ------- | -----------
list     | ls      | list all the types on the remote system
get      | read    | print a remote type
fetch    | pull, download  | fetch a remote type and store locally
post     | push, upload    | install a remote type on the server
delete   | destroy | destroy the type on the system
listp    | lp      | list the properties of a remote

####Type Names

The typename is the just the name and not a partial url path. The user MUST assume that `/namespace/type/` will be prepended to the name prior to sending the request. Any initial slash will be tolerated but is not required. Any additional path elements will be appended to the `namespace/types/` prior to executing the request.

####Options

All remote commands require an environment. These options behave consistently with those in the  If none is specifed then the command will use the default. If no default is set then to command will fail.

##Command Details

###New

Create a new type locally

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

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

####Signature

````
> rbc-types [env-options] post <typename>
````
#####Aliases

upload, push

#####Arguments

1. typename - the name of the type to be sent to the server

#####Return

The typename posted


app-tools
=========
app-tools is a command line tool, bundled with bodhi-cli, that allows app developers to quickly generate
an app and publish it to the cloud so that it can be viewed on the mobile container.

## Local Commands

### App Creation Commands

#### new-app

Creates a new app skeleton in /apps folder based on the type of skeleton app specified. 

Notes:

* App name must be unique to the namespace.
* The app's profile name is the same as the app name.
* Once app name and profile name has been specified, it cannot be changed.

##### Signature

```
> app-tools new-app <app-name> [meta-data-options] [env-options]
```

##### Arguments

1. app name

##### Options

See environment options above (environment options are only needed for app-generator).

Meta Data Options:

long        | short     | arg                                 | meaning
----------- | --------- | ----------------------------------- | -------------
type        | t         | custom (default), app generator, angular   | specifies the type of skeleton project to create
model       | m         | resource type                       | specifies the resource type for the app generator function

##### Return

None.

##### Custom App

Creates a custom app skeleton in /apps/\<app-name\>.
The custom app skeleton just has the required files needed to publish the app.

```
> app-tools new-app <app-name> [meta-data-options]
```

##### Angular App

Creates an angular app skeleton in /apps/\<app-name\>.

```
> app-tools new-app <app-name> -t angular [meta-data-options]
```

##### App Generator

Creates a list-detail app based on the specified type (-m). The app will list the 20 most recent records fo the specified type. The user can then drill down and see the record in more detail. 

Notes:

* Environment information is used to grab the type definition remotely from the environment's namespace.
* The model with the select action (specified by the -m flag) will be added to the profile definition upon app creation.

```
> app-tools new-app <app-name> -t app-generator -m <type name> [meta-data-options] [env-options]
```

### Profile Definition Commands

The following commands allow the user to edit/view the local profile definition. When the user publishes the app, the cloud will create a unique profile (profile name will be the same as the app name) specifically for this app. Any user with this profile will then be able to use this app.

#### Profile Action Options

long      | meaning
----      | -------
select    | select action allowed on type
update    | update action allowed on type
delete    | delete action allowed on type
insert    | insert action allowed on type
aggregate | aggregate action allowed on type


#### view-profile-def

View the local app profile definition.

##### Signature

```
> app-tools view-profile-def
```

##### Arguments

None.

##### Options

None.

##### Return

The local app profile definition.

#### add-type-to-profile

Add a type and its allowed actions to the local app profile definition. If the type already exists, it will overwrite it. Application type cannot be edited.

##### Signature

```
> app-tools add-type-to-profile <type> [profile-action-options]
```

##### Arguments

1. type

##### Options

See profile action options above.

##### Return

The local app profile definition.

#### remove-type-from-profile

Remove a type from the local app profile definition. Application type cannot be removed.

##### Signature

```
> app-tools remove-type-from-profile <type>
```

###### Arguments

1. type

##### Options

None.

##### Return

The local app profile definition.

### App Metadata Commands

#### edit-title

Edit the app title.

##### Signature

```
> app-tools edit-title <title>
```

##### Arguments

1. title

##### Options

None.

##### Return

Message stating the title has been changed to \<title\>.

#### view-title

View the app title.

##### Signature

```
> app-tools view-title
```

##### Arguments

None.

##### Options

None.

##### Return

The app title.

#### edit-description

Edit the app description.

##### Signature

```
> app-tools edit-description <description>
```

##### Arguments

1. description

##### Options

None.

##### Return

Message stating description has been changed to \<description\>.

#### view-description

View the app description.

##### Signature

```
> app-tools view-description
```

##### Arguments

None.

##### Options

None.

##### Return

The app description.

#### edit-version

Edit the app version.

##### Signature

```
> app-tools edit-version <version>
```

##### Arguments

1. version

##### Options

None.

##### Return

Message stating the app version has been changed to \<version\>.

#### view-version

View the app version.

##### Signature

```
> app-tools view-version
```

##### Arguments

1. version

##### Options

None.

##### Return

The app version.

## Remote Commands

### App Publishing Commands

#### publish-app

Publishes the app to the namespace specified by the environment or to the global app store if the -g flag is specified. This command must be run in the app folder.

Notes:

* Publish-ready app files must be located in a /www folder in the root of the app directory so that the publish-app command can zip it up and send it to the cloud.
* Need to have version, name, profile, and title specified in the package.json when publishing (use the app metadata commands and profile commands above to do this).
* LICENSE, index.html, and package.json are required and must be located in the root of the app directory.
* Only users with the admin profile are allowed to publish apps.
* Max zip file size is 20mb.
* Max number of files is 1024.
* On publish, the cloud creates the profile specified by the package.json's profile definition and then assigns the profile to the developer who published the app.
* If autoVersionUpdate flag in package.json is set to true, each publish will bump up the patch version of the app.
* If you want to publish the app globally, the app must already be published in your custom namespace.

##### Signature

```
> app-tools publish-app [env-options]
```

##### Arguments

None.

##### Options

See environment options above.

long        | short     | arg                                 | meaning
----------- | --------- | ----------------------------------- | -------------
global        | g         |    | publish to global namespace

##### Return

Message stating the app has been published, profile has been created and assigned to the developer who published it.

### App Removing Commands

#### remove-app

Remove app from the cloud.

##### Signature

```
> app-tools remove-app <app-name> [env-options]
```

##### Arguments

1. app name

##### Options

See environment options above.

##### Return

Message stating the app has been successfully removed.

### Global App Instalation/Update Commands

#### install-app

Install a global app into a custom namespace.

Note:

* --name flag is optional. If name is not specified, it defaults to the original name specified by the publisher (ex. if the app's global name is testNamespace.appname, appname will be the name given to the app in your namespace).
* An app can be installed into a namespace multiple times as long as the name given to the app (specified by the --name flag) is unique.

##### Signature

```
> app-tools install-app <global app name> --name <app name> [env-options]
```

##### Arguments

1. global app name

##### Options

See environment options above.

long        | short     | arg                                 | meaning
----------- | --------- | ----------------------------------- | -------------
name        |          |    | unique name of the app for your namespace

##### Return

The metadata for the newly installed global app.

#### update-app

Update an already installed global app.

##### Signature

```
> app-tools update-app <app-name> [env-options]
```

##### Arguments

1. app name

##### Options

See environment options above.

##### Return

The metadata for the updated global app.

### Informational Commands

Get data about the deployed app from the cloud.

#### list-apps

This command lists all the apps that you can see in your specified environment that are currently deployed in the cloud. If the -g flag is specified, the command lists all the global apps available for you to install.

##### Signature

```
> app-tools list-apps -g [env-options]
```

##### Arguments

None.

##### Options

See environment options above.

long        | short     | arg                                 | meaning
----------- | --------- | ----------------------------------- | -------------
global      | g         |    | list the global apps

##### Return

A list of apps currently in your namespace or if the -g flag is specified the apps currently in the global store. Each app entry will show its meta data.

### Profile Commands

Remote commands dealing with the profile associated with the deployed app.

#### assign-profile-to-user

Assign the deployed app's profile to an existing user in the cloud.

##### Signature

```
> app-tools assign-profile-to-user <username> --name <app-name> [env-options]
```

##### Arguments

1. username

##### Options

long        | short     | arg                                 | meaning
----------- | --------- | ----------------------------------- | -------------
name      |          |  app name  | Name of the app's profile you wish to assign the user.

See environment options above.

##### Return

Message stating the specified app's profile has been assigned to the specified user.
