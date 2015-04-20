####Bodhi Command Line Interface 


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
#####**NOTE:**
Once you do this, all commands will be used under the default environment unless you specify otherwise with the -e flag.

#####Set the Default Environment
Set a default environment so that if you do not specify an environment for a command, it uses the default environment.

````
> bodhi set-default Testing
Testing
````
In the rbc-project.json file you will see that the default evironment has been inserted in to the rbc-project.json file.

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
###General Usage of Commands

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
none   |--color |  none | use color
none   |--no-color |  none |do not use color
none   |--flat |  none |provide flat json structure
none   |--status|  none |include the staus
-d   |--debug   |  none |execute the command in debug mode
-f   |--force   |  none |force the command to ignore saftey considerations
-H   |--help    |  none |request help in the form of usage instructions

The following commands are considered equivalent.

````
> bodhi -e my-environment -v command

> bodhi -v command -e my-environment

> bodhi command -v -e my-environment
````

###Arguments
The first entry is the name of the tool. The second argument is the command. All subsequent arguments are command specific.

###Command Organization

The commands are grouped into subgroups.
The following Commands groups are;

* **Project Commands**
* **Environment Commands**
* **Environment Detail Commands**
* **HTTP Option Commands**

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
#####Arguments

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | none | displays current directory

#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | none | none  
-v   |--verbose |  none |execute the command with intermediate output
-d   |--debug   |  none |execute the command in debug mode
-H   |--help    |  none |request help in the form of usage instructions

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi pwd
> bodhi pwd -h
> bodhi pwd --help
````

Response | Description
:-------: | :----------
/path/to/project/root | Platform specific directory path of the current project.


###init

__Aliases__:

This command will establish the current directory as a new project by creating a new rbc-project.json file.
 
````
> bodhi init [options]
````
#####Arguments

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | none | creates a new rbc-project.json file in the current directory
-f	| --force | none | forces bodhi-cli to reinitialize the rbc-project.json file in the current directory

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
````
#####Return Response

Response | Description
:-------: | :----------
/path/to/new/project/root | Platform specific directory path to the newly initialized project.
Cowardly refusing to overwrite an existing project file | a project file already exists in the current directory.

###set-default

__Aliases__:

This command will set the environment supplied as the default working environment.

````
> bodhi set-default [environment]
````
#####Arguments

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none	| none | [environment] | set the environment supplied as the default working environment

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--force  |  none   | Force the initialization of the rbc-project.json
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi set-default [Environment] -h
> bodhi set-default [Environment] --help
````
#####Return Response

Response | Description
:-------: | :----------
/path/to/new/project/root | The name of the environment that is now the default.
Unknown Connection undefined | the [environment] was not supplied

###get-default

__Aliases__:

This command will get the directory supplied as the default working directory.

````
> bodhi get-default
````
#####Arguments

short | long | arg    | description
:------:| :---------: | :------: | :-------------
none | none | none | 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi get-default -h
> bodhi get-default --help
> bodhi get-default -v
> bodhi get-default -verbose
````
#####Return Response
Response | Description
:-------: | :----------
/path/to/new/project/root | Returns the default working environment.
Default Connection currently unspecified | the default evironment is not defined in the rbc-project.json file.

###Environment Commands

### General Command Signature

````
> bodhi <command> <environment> [env-options] [processing-options]
````
###Commands
* new
* list
* view
* rename
* clone
* edit
* remove

###Environment Options

short |long |  meaning
:----:| :-----: | -------------
-s     |--uri       |  the service url to use
-u     |--username  |  the remote username to use
-p     |--password  |  the remote user password to use
-n 	| --namespace | Select the namespace for the environment
-d     |--debug  |  execute the command in debug mode
-f     |--force |  force the command to ignore safety considerations
-a | --agent | the Client user agent
-D | --data | A data string to supply
-F | --file | the file that contains the json

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

````
> bodhi new [ENVIRONMENT NAME] -s <api.endpoint> -n <namespace> -u <user> -p <password> --debug
````

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi new [Environment]
> bodhi create [Environment]
 
> bodhi new [Environment] --help
> bodhi create [Environment] --help

> bodhi new [Environment] -s <api.endpoint> -n <namespace>
> bodhi create [Environment] -s <api.endpoint> -n <namespace>
````
#####Return Response

Response | Description
:-------: | :----------
<environment name> | The names of the environments of the project
undefined | No environment name given

###list

__Aliases__: _ls_, _ll_, _dir_

Print the names of a project's environments

````
> bodhi list <environment> [processing-options]
````
#####Arguments

1. environment - the name of the environment to remove

arg | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [processing-options]| the environment name that is to be removed

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es)

````
> bodhi list [Environment] --debug
> bodhi ls [Environment] --debug
> bodhi ll [Environment] --debug
> bodhi dir [Environment] --debug
````
#####Return Response

Response | Description
:-------: | :----------
<list of environments> | The names of the environments of the project
undefined | No environment name given

A JSON array containing the names

#####Returned JSON Structure
````
[
  "env",
  "env2",
  "env3"
]
````
###view

__Aliases__: _print_

Print the structure of the named enviroment

````
> bodhi view <environment> [processing-options]
````
#####Arguments

args | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [processing-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi view [Environment] --debug
> bodhi print [Environment] --debug
````
#####Return Response

Response | Description
:-------: | :----------
<A JSON object> | representation of the current environment
undefined | No environment name given

#####Returned JSON Structure

````
{
  "uri":"uri",
  "username":"username",
  "password":"password",
  "namespace":"namespace"
}
````
#####Return Response

Response | Description
:-------: | :----------
<env-name> | The name of the newly created environment
undefined | No environment name given

###edit

__Aliases__: _modify_

This command changes an exiting environment's settings based on the environment options that are supplied.

````
> bodhi edit <environment> [env-options] [processing-options]
````
#####Arguments

1. environment - the name of the environment to change

arg | env-option    | processing-options | description
:------:| :---------: | :------: | :-------------
[environment]| [env-options] |  [processing-options]| returns the new environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi edit [Environment] -u username
> bodhi modify [Environment] -u username
````
#####Return Response

Response | Description
:-------: | :----------
<env-name> | The name of the environment that was modified
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

arg1 | arg2 | env-option    | processing-options | description
:------:| :---------: |:---------: | :------: | :-------------
[from] | [to] | [env-options] |  [processing-options]| returns the new environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--force  |  none   | force the command
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi rename [from_Environment] [to_Environment]
> bodhi mv [from_Environment] [to_Environment]
> bodhi move [from_Environment] [to_Environment]
````
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

1. from - the name of the environment to rename
2. to   - the new name for the environment

arg1 | arg2 | env-options   | processing-options | description
:------:| :---------: |:---------: | :------: | :-------------
[from] | [to] | [env-options] |  [processing-options]| returns the new environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--force  |  none   | force the command
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi copy [from_Environment] [to_Environment]
> bodhi cp [from_Environment] [to_Environment]
> bodhi clone [from_Environment] [to_Environment]
````
#####Return Response

Response | Description
:-------: | :----------
<env-name> | The new name of the newly created environment
Connection [to environment] already exists | The environment being copied to already exists 
undefined | No environment name given

###remove

__Aliases__: _rm_

````
> bodhi remove <environment> [env-options] [processing-options]
<env-name>
````
#####Arguments

1. environment - the name of the environment to remove

arg | env-options    | processing-options | description
:------:| :---------: | :------: | :-------------
[environment]| [env-options] |  [processing-options]| the environment name that is to be removed

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi remove [Environment] --debug
> bodhi rm [Environment] --debug
````
#####Return Response

Response | Description
:-------: | :----------
removed the environment <env-name> | The name of the environment that was removed
undefined | No environment name given

###Environment Detail Commands

### General Command Signature

````
> bodhi <command> <environment> [env-options] [processing-options]
````
#####Commands
* user
* whereami
* url
* namespace

###user

__Aliases__: _whoami__

Print the user of the named enviroment

````
> bodhi user <environment> [processing-options]
````
#####Arguments

args | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [processing-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi user [Environment] --debug
> bodhi whoami [Environment] --debug
````
#####Return Response

Response | Description
:-------: | :----------
<A JSON object> | representation of the current environment
undefined | No environment name given

#####Returned JSON
````
{
  "uri":"uri",
  "username":"username",
  "password":"password",
  "namespace":"namespace"
}
````
###url

__Aliases__: _uri__

Print the url of the named enviroment

````
> bodhi url <environment> [processing-options]
````
#####Arguments

args | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [processing-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi url [Environment] --debug
> bodhi uri [Environment] --debug
````
#####Return Response

Response | Description
:-------: | :----------
<A JSON object> | representation of the current environment
undefined | No environment name given

#####Returned JSON
````
{
  "uri":"uri",
  "user":"user",
  "password":"password",
  "namespace":"namespace",
}
````
###namespace

__Aliases__:

Print the namespace of the named enviroment

````
> bodhi namespace <environment> [processing-options]
````
#####Arguments

args | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [processing-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi namespace [Environment] --debug
````
#####Return Response

Response | Description
:-------: | :----------
<A JSON object> | representation of the current environment
undefined | No environment name given

#####Returned JSON
````
{
  "uri":"uri",
  "user":"user",
  "password":"password",
  "namespace":"namespace",
}
````
###whereami

__Aliases__:

Print the structure of the named enviroment

````
> bodhi whereami <environment> [processing-options]
````
#####Arguments

args | processing-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [processing-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi whereami --debug
````
#####Return Response

Response | Description
:-------: | :----------
<A JSON object> | representation of the current environment
undefined | No environment name given

#####Returned JSON
````
{
  "uri":"uri",
  "username":"username",
  "password":"password",
  "namespace":"namespace",
  "user": "user"
}
````
###HTTP Option Commands

#####Commands
* ping
* login
* get
* count
* put
* post
* patch
* delete
* head
* options

###Environment(env) Options

short |long |  meaning
:----:| :-----: | -------------
-s     |--uri       |  the service url to use
-u     |--username  |  the remote username to use
-p     |--password  |  the remote user password to use
-n 	| --namespace | Select the namespace for the environment
-d     |--debug  |  execute the command in debug mode
-f     |--force |  force the command to ignore safety considerations
-a | --agent | the Client user agent
-D | --data | A data string to supply
-F | --file | the file that contains the json

###ping

__Aliases__:

ping a named enviroment to see if it can communicate of the network

````
> bodhi login -e <environment> [env-options] [processing-options]
````
#####Arguments

args | env-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi ping -e [environment] [env-options]--debug
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###login

__Aliases__: _authn__

ping a named enviroment to see if it can communicate of the network

````
> bodhi login -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi login -e <environment> [env-options]
> bodhi authn -e <environment> [env-options]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###get

__Aliases__:

Requests data from a specified resource from a named environment

````
> bodhi get -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi get -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###count

__Aliases__:

returns the number rows that match data from a specified resource from a named environment

````
> bodhi count -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi count -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###put

__Aliases__:

Submits data to be stored to a specified URL for a named environment

````
> bodhi get -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi get -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###post

__Aliases__:

Submits data to be processed to a specified resource for a named environment

````
> bodhi post -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-o   | --out |  none   | describe the output
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi get -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###patch

__Aliases__:

Updates a partial resource for a named environment

````
> bodhi patch -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-o   | --out |  none   | describe the output
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi patch -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###delete

__Aliases__:

Deletes a resource for a named environment identified by a URI

````
> bodhi delete -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-o   | --out |  none   | describe the output
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi delete -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###head

__Aliases__:

Verifies if a given resource for a named environment identified by a URI is serviceable, or exists

````
> bodhi head -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-o   | --out |  none   | describe the output
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi head -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

###options

__Aliases__:

Determine the options and/or requirements associated with a resource for a named environment identified by a URI,
without implying a resource action or initisting s resource retrieval

````
> bodhi options -e <environment> [env-options] <path> [--out]
````
#####Arguments

args | env-options | path | processing-open | description
:------:| :---------: | :------: | :-------------
[environment] |  [env-options]| path | process-options | the environment name 

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-o   | --out |  none   | describe the output
-h   | --help |  none   | prints a descriptive list of the commands
-d   |--debug |  none   | prints more detailed debugging information output
-v   |--verbose |  none   | prints more detailed information output
-f   |--force  |  none   | force the command

#####Command Variations
__NOTE:__ The following are all equivalent and show the command and it's alias(es) if any

````
> bodhi options -e <environment> [env-options] <path> [--out]
````
#####Return Response

Response | Description
:-------: | :----------
Connection Failed | unable to communicate to the environment
undefined | No environment name given

