####Bodhi Command Line Interface Tools


Command Line Tools for the Bodhi Cloud

###Installation

The Bodhi cli tools require a nodejs runtime and are installed using the node package manager (npm).

````
> npm install -g bodhi-cli
````

On *nix based systems and Macs, a global install command **MUST** be run using sudo.

````
> sudo npm install -g bodhi-cli
````
Once the tools are installed, verify the installation using the version command. 
The command SHOULD respond with a semantic version of the tools: M is the major version, m is the minor version, and b is the build increment.

````
> bodhi -V
  M.m.b (e.g. 1.2.15)
````

###Create a bodhi-cli workspace

Create a directory for your bodhi-cli workspace. 
Change directory to the new bodhi-cli workspace.

**NOTE** This is the directory where you will run all of your bodhi-cli commands.

````
> mkdir [workspace]
> cd [workspace]
````
Initialize your bodhi-cli workspace. 

This will create a rbc-project.json which will store all your environment info. It will also create an /apps directory where your apps will reside (for app-tools) and a /model where all your type definitions will reside (for bodhi-types).

````
> bodhi init
/path/to/new/project/root
````
###Create a new environment

This command will create a new environment

````
> bodhi create [ENVIRONMENT NAME]
[ENVIRONMENT NAME]  
````

###Add a new environment to the project
Add a new environment to your rbc-project.json file. You will need to know you namespace credentials.

````
> bodhi new [ENVIRONMENT NAME] -s <api.endpoint> -n <namespace> -u <user> -p <password>
  
````
Open up rbc-project.json and see that the information entered with the bodhi new command is there and formatted.

For example: <br>
 
````
> bodhi new Testing -s api.bodhi-space.io -n QA_Name -u fred -p apple
Testing
````
In the rbc-project.json file you will see the information that the bodhi new command as inserted in the file.

````  
{
  "version": "0.7.10",
  "environments": {
    "Testing": {
      "uri": "api.bodhi-space.io",
      "username": "fred",
      "password": "apple",
      "namespace": "QA_Name"
    }
  }
}

````
**NOTE:**
Once you do this, all commands will be used under the default environment unless you specify otherwise with the -e flag.

#####Set the Default Environment
Set a default environment so that if you do not specify an environment for a command, it uses the default environment.

````
> bodhi set-default Testing
Testing
````
In the rbc-project.json file you will see the thet the default evironment has been inserted in to the rbc-project.json file.

````
{
  "version": "0.7.10",
  "environments": {
    "Testing”: {
      "uri": "api.bodhi.space",
      "username": "Teddy",
      "password": "apple",
      "namespace": "QA_testing"
    }
  },
  "default": "Testing”
}
````
#####Get the Default Environment

Check to see if we set the default environment correctly.

````
> bodhi set-default Testing
Testing
````
###General Usage

````
> bodhi [options] <command> [arguments ..]
````

###Options

*	Options are prefixed with `-` or `--` to separate them from arguments.  
*	Options can be specified anywhere on the command line __AFTER__ the tool designation.
*	Each command or action defines the options it uses.
*	**NOTE:** the options are consistent in naming convention and usage across the commands.

short |long  | arg | description
:------: | :------: |:-----:| :-------------
-V   |--version |  none | request the version of a tool
-v   |--verbose |  none |execute the command with intermediate output
-e | --environment | [environment] | the environment to use
-s | --uri | [url] | the service provider uri
-u | --username, --user | [username] |the remote username
-p | --password | [password] | the remote user's password
-n | --namespace | [namespace] | the active namespace
none   |--view |  none |present the view in console colors
none   |--no-color |  none |do not use color
none   |--flat |  none |provide flat json structure
none   |--status|  none |include the staus
-d   |--debug   |  none |execute the command in debug mode
-f   |--force   |  none |force the command to ignore saftey considerations
-H   |--help    |  none |request help in the form of usage instructions

The following commands are considered equivalent.

````
bodhi -e my-environment -v command
````
````
bodhi -v command -e my-environment
````
````
bodhi command -v -e my-environment
````

###Arguments
The first entry is the name of the tool. The second argument is the command. All subsequent arguments are command specific.

###Command Organization

The commands are grouped into a sub group.
The following Commands groups are;

* **Project Commands**
* **Environment Commands**
* **Environment Detail Commands**
* **HTTP Options Commands**

###Project Commands

* pwd
* init
* set-default
* get-default

###pwd

__Aliases__: _home_

This command will print the home directory of the current project.

````
> bodhi pwd

````

#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | none | none  

#####Command Variations

````
> bodhi pwd
> bodhi pwd -h
> bodhi pwd --help
> bodhi pwd -v
> bodhi pwd --verbose
> bodhi pwd -d
> bodhi pwd --debug

````
Response | Description
:-------: | :----------
/path/to/project/root | Platform specific directory path of the current project.


###init

This command will establish the current directory as a new project by creating a new rbc-project.json file.
 
````
> bodhi init [options]
````

**NOTE:** This command will fail safely if an existing rbc-project.json file exists up the directory tree. A user may create a project in a subfolder by using the --force command line option.

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--force  |  none   | Force the initialization of the rbc-project.json
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
> bodhi init -f
> bodhi init --force
> bodhi init -v
> bodhi init --verbose
> bodhi init -d
> bodhi init --debug
````
#####Arguments

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | none | creates a new rbc-project.json file in the current directory
-f	| --force | none | forces bodhi-cli to reinitialize the rbc-project.json file in the current directory

#####Return Response

Response | Description
:-------: | :----------
/path/to/new/project/root | Platform specific directory path to the newly initialized project.
Cowardly refusing to overwrite an existing project file | a project file already exists in the current directory.

###set-default

This command will set the environment supplied as the default working environment.

````
> bodhi set-default [environment]
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
none	| none | [environment] | set the environment supplied as the default working environment
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--force  |  none   | FOrce the initialization of the rbc-project.json
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
> bodhi set-default [Environment] -h
> bodhi set-default [Environment] --help
> bodhi set-default [Environment] -v
> bodhi set-default [Environment] -verbose
> bodhi set-default [Environment] -d
> bodhi set-default [Environment] -debug

````
#####Arguments

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | [environment] | set the environment supplied as the default working environment

#####Return Response

Response | Description
:-------: | :----------
/path/to/new/project/root | The name of the environment that is now the default.
Unknown Connection undefined | the [environment] was not supplied

###get-default

This command will get the directory supplied as the default working directory.

````
> bodhi get-default
````

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--force  |  none   | FOrce the initialization of the rbc-project.json
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
> bodhi get-default [Environment] -h
> bodhi get-default [Environment] --help
> bodhi get-default [Environment] -v
> bodhi get-default [Environment] -verbose
> bodhi get-default [Environment] -d
> bodhi get-default [Environment] -debug
````
#####Return Response
Response | Description
:-------: | :----------
/path/to/new/project/root | Returns the default working environment.
Default Connection currently unspecified | the default evironment is not defined in the rbc-project.json file.

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
* list
* view
* whoami
* whereami
* uri
* user
* namespace

###Environment Options

short |long |  meaning
:----:      | :-----: | -------
-s     |--uri       |  request help in the form of usage instructions
-u     |--username  |  execute the command with intermediate output
-n | --namespace | Selet the namespace for the environment
-d     |--debug  |  execute the command in debug mode
-f     |--force |  force the command to ignore safety considerations

###new

__Aliases__: _create_

This command will create a new environment in the project

````
> bodhi new <env-name> [env-options] [processing-options]

````
#####Arguments

arg | env-option    | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] | env-options |  processing-options| returns the new environment name 

#####Return Response

Response | Description
:-------: | :----------
<env-name> | The name of the newly created environment
undefined | No environment name given

###rename

__Aliases__: _mv_, _move_

This command will rename an existing environment and optionally update its configuration if environment options are present.

````
> bodhi rename <from> <to> [env-options] [processing-options]

````
#####Arguments

1. from - the name of the environment to rename
2. to   - the new name for the environment

args | env-option    | processing-options | description
:------:| :---------: | :------: | :-------------
[from]  [to] | [env-options] |  [processing-options]| returns the new environment name 

#####Return Response

Response | Description
:-------: | :----------
<env-name> | The new name of the existing environment
undefined | No environment name given

###copy

__Aliases__: _cp_, _clone_

This command will copy an existing environment and optionally update the copy with new setting if environment options are present.

````
> bodhi copy <from> <to> [env-options] [processing-options]

````
#####Arguments

1. from - the name of the environment to copy
2. to   - the name of the new environment

args | env-option    | processing-options | description
:------:| :---------: | :------: | :-------------
[from]  [to] | [env-options] |  [processing-options]| returns the new environment name 

#####Return Response

Response | Description
:-------: | :----------
<env-name> | The new name of the newly created environment
Connection [to environment] alread exists | The environment being copied to already exists 
undefined | No environment name given

###edit

__Aliases__: _update_, _modify_

This command changes an exiting environment's settings based on the environment options that are supplied.

````
> bodhi edit <environment> [env-options] [processing-options]

````

#####Arguments

1. environment - the name of the environment to change

args | env-option    | processing-options | description
:------:| :---------: | :------: | :-------------
[environment]| [env-options] |  [processing-options]| returns the new environment name 

#####Return Response

Response | Description
:-------: | :----------
<env-name> | The name of the environment that was modified
undefined | No environment name given

###remove

__Aliases__: _rm_, _del_

````
> bodhi remove <environment> [env-options] [processing-options]
<env-name>
````

#####Arguments

1. environment - the name of the environment to remove

args | env-option    | processing-options | description
:------:| :---------: | :------: | :-------------
[environment]| [env-options] |  [processing-options]| the environment name that is to be removed

#####Return Response

Response | Description
:-------: | :----------
<env-name> | The name of the environment that was removed
undefined | No environment name given

###list

__Aliases__: _ls_, _ll_, _dir_

Print the names of a project's environments

#####Arguments

1. environment - the name of the environment to remove

#####Return Response

Response | Description
:-------: | :----------
<env-name> | The name of the environment that was removed
undefined | No environment name given

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

