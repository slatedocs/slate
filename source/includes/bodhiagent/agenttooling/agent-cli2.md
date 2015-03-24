####Agent-CLI


The agent-cli provides administrators, support team members, and developers a tool for interacting with an agent from the command line. It allows the ability to get information, makes configuration changes and to interaction with the agent at a more direct level.

###General Usage

The general structure of the agent-cli commands are as follows:

````
c:\[working directory]>agent-cli [options] <action> [arguments]
````
###Options

*	Options are prefixed with `-` or `--` to separate them from arguments. 
*	Each command or action defines the options it uses. 
*	**NOTE:** the options are consistent in naming convention and usage across the commands.

#####Common Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h | --help |  none   | print help about the command
-v | --verbose | none   | print more detailed output
-q   | --quiet   | none   | print essential output
-f  | --config  | filename   | fully qualified path of the agent's configuration file to use
-h    |--home    | path   | fully qualified path of the agent's working directory
-F   | --force   | none   | directive to override safety logic

###Arguments
*	The agent-cli interprets the first argument (non-option) as the action command. 
*	All subsequent arguments are command specific. 

###Command Organization	

The commands are grouped into a sub group.
The following Commands groups are;

* **Informational Commands**
* **Lifecycle Commands**
* **Diagnostic Commands**
* **Usage Commands**
* **Configuration Commands**
* **Agent Application Commands**
* **Update & Remove Commands**

###Informational Commands

* 	help
*  	version
* 	info

###help

The command line provides built in helper functions.

#####Navigation Help
For a descriptive list of the agent-cli commands 

````
c:\[working directory]>agent-cli --help
````
#####Return Response

Response | Description
:----------| :----------
List of agent-cli commands | all the commands are listed
error: unknown option [options] | Incorrect option
 
 
###version

Displays the version information of the agent-cli.

#####Command Variations
````
c:\[working directory]>agent-cli -V
c:\[working directory]>agent-cli --version 
````
**NOTE:** The output is a simple version identifier following the semantic versioning rules of major, minor, and build.

````
Major.minor.build (e.g. 1.0.51)
````
#####Return Response

Response | Description
----------| ----------
error: unknown option [options] | Incorrect option
 
###info

Used to display information of the Agent-cli.

* Displays the agent-cli splash screen
* Displays the version of the agent-cli

#####Command Variations

````
c:\[working directory]>agent-cli info
````
#####Return Response

Response | Description
:----------| :----------
error: unknown option [options] | Incorrect option
 
 
###Lifecycle Commands

Lifecycle commands allow an administrator to change and check the run state of an agent.

* start
* status
* stop
* set-name
* set-connection
* set-logger
* set-management

###start

Used to attempt to start an agent.

* Allows the selection of which agent configuration file to use
* Allows the selection of the agent working directory
* Allows the selection of the agent pidFile to use
* Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli start [options] 
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
none   | --home    |  directory path   | fully qualified path of the agent's working directory
none |--pidFile |  filename   | fully qualified filename of the agent's pidFile
-v   |--verbose |  none   | provides more detailed information output
-q   |--quiet   |  none   | provides only essential information output

#####Command Variations
````
c:\[working directory]>agent-cli start -h
c:\[working directory]>agent-cli start —-help
c:\[working directory]>agent-cli start -f c:\[working directory]\agent1.js
c:\[working directory]>agent-cli start —-config c:\[working directory]\agent1.js
c:\[working directory]>agent-cli start —-home c:\
c:\[working directory]>agent-cli start —-pidFile c:\[working directory]\agent.pid
c:\[working directory]>agent-cli start -v
c:\[working directory]>agent-cli start —verbose
c:\[working directory]>agent-cli start -q
c:\[working directory]>agent-cli start —-quiet
````
#####Return Response

Response | Description
----------| ----------
Error: connect EADDRNOTAVAIL | the connection url in the configuration file is bad
error: unknown option [options] | Incorrect option

###status

Used to retrieve the status of a running agent.

* Allows the selection of the agent configuration file to use
* Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli status [options] 
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli status —h
c:\[working directory]>agent-cli status —-help
c:\[working directory]>agent-cli status -f c:\[working directory]\agent1.js
c:\[working directory]>agent-cli status —-config c:\[working directory]\agent1.js
c:\[working directory]>agent-cli status -v
c:\[working directory]>agent-cli status —verbose
````
#####Return Response

Response | Description
----------| ----------
agent available		|	agent is running and available
agent unavailable	|	agent has stopped
agent unable to start using fully qualified configuration path| No configuration file at fully qualified configuration path
error: unknown option [options] | Incorrect option

###stop

Used to gracefully stop or shutdown an agent.

* Allows the selection of the agent configuration file to use
* Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli stop [options] 
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli stop —h
c:\[working directory]>agent-cli stop —-help
c:\[working directory]>agent-cli stop -f c:\[working directory]\agent1.js
c:\[working directory]>agent-cli start —-config c:\[working directory]\agent1.js
c:\[working directory]>agent-cli start -v
c:\[working directory]>agent-cli start —verbose
````
#####Return Response

Response | Description
----------| ----------
agent stopping now ...| agent is shutting down gracefully updated
agent is unavailable | agent is stopped
agent unable to start using fully qualified configuration path| No configuration file at fully qualified configuration path
error: unknown option [options] | Incorrect option

###set-name

Used to configure the name of an agent.

* Allows the setting of the name of the agent
* Allows the selection of the agent configuration file to use
* Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli set-name [options] <name>
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli set-name —h
c:\[working directory]>agent-cli set-name —-help
c:\[working directory]>agent-cli set-name Fred
c:\[working directory]>agent-cli set-name -f c:\[working directory]\agent1.js Teddy
c:\[working directory]>agent-cli set-name —config c:\[working directory]\agent1.js Herb
c:\[working directory]>agent-cli set-name -v Fred
c:\[working directory]>agent-cli set-name --verbose Fred
````
#####Return Response

Response | Description
----------| ----------
agent updated | the configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option [options] | Incorrect option

###set-connection

Used to configure a connection to an agent.

* Allows the setting of the http url for the connection
* Allows the selection of the agent configuration file to use
* Allows the setting of the timeout value
* Allows the setting of the proxy http url
* Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli set-connection [options] connection]
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
none   |--timeout  |  value   | specifies the connections timeout value
none   |--proxy  |  proxy   | specifies the http proxy url
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli set-connection —h
c:\[working directory]>agent-cli set-connection —-help
c:\[working directory]>agent-cli set-connection https://api.redbookcloud.com
c:\[working directory]>agent-cli set-connection -f c:\[working directory]\agent1.js
c:\[working directory]>agent-cli set-connection —-config c:\[working directory]\agent1.js
c:\[working directory]>agent-cli set-connection --timeout 20000
c:\[working directory]>agent-cli set-connection —-proxy http://proxy.redbookcloud.com
c:\[working directory]>agent-cli set-connection -v https://api.redbookcloud.com
c:\[working directory]>agent-cli set-connection --verbose https://api.redbookcloud.com
````
#####Return Response

Response | Description
----------| ----------
agent updated | the agent configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option [options] | Incorrect option

###set-logger

Used to configure the logging of an agent.

* 	Allows the setting of the log file location 
* 	Allows the selection of the agent configuration file to use
*  	Allows the setting of the level of logging information
* 	Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli set-logger [options]
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified path of the agent's configuration file to use
none   |--file  |  filename   | fully qualified filename of the the log file location
none   |--level  |  level   | specifies the log level (error, warn, info, verbose, debug)
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli set-logger —h
c:\[working directory]>agent-cli set-logger —-help
c:\[working directory]>agent-cli set-logger Fred
c:\[working directory]>agent-cli set-logger -f c:\BohiAgent\agent1.js
c:\[working directory]>agent-cli set-logger —-file c:\[working directory]\test.log
c:\[working directory]>agent-cli set-logger -f c:\BohiAgent\agent1.js
c:\[working directory]>agent-cli set-logger --level error
c:\[working directory]>agent-cli set-logger —-level warn
c:\[working directory]>agent-cli set-logger —-level info
c:\[working directory]>agent-cli set-logger —-level verbose
c:\[working directory]>agent-cli set-logger —-level debug
c:\[working directory]>agent-cli set-logger -v
c:\[working directory]>agent-cli set-logger —-verbose
````
#####Return Response

Response | Description
----------| ----------
agent updated | the agent configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option [options] | Incorrect option

###set-management

Used to configure the management endpoint for an agent.

* 	Allows the selection of the agent configuration file to use
*  	Allows the setting of the http port
*  	Allows the setting of the http address to listen on
* 	Allows the setting of the level of detail to output

````
c:\[working directory]>agent-cli set-management [options]
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified path of the agent's configuration file to use
none   |--port  |  port address   | specifies the management http port address
none   |--connection  |  url:port   | specifies the mnagement url and port address
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli set-management https://api.bodhi.space
c:\[working directory]>agent-cli set-management —h
c:\[working directory]>agent-cli set-management —-help
c:\[working directory]>agent-cli set-management -f c:\[working directory]\agent1.js
c:\[working directory]>agent-cli set-management —-config c:\[working directory]\agent1.js
c:\[working directory]>agent-cli set-management —-port 4444
c:\[working directory]>agent-cli set-management —-connection https://api.bodhi.space:4444
c:\[working directory]>agent-cli set-management -v https://api.bodhi.space
c:\[working directory]>agent-cli set-management -- verbose https://api.bodhi.space
````
#####Return Response

Response | Description
----------| ----------
agent updated | the agent configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option [options] | Incorrect option

###Diagnostic Commands

Diagnostic commands are used by an administrator to troubleshoot an agent that is having trouble entering a running state or to test environmental specific details uniformly across platforms.

* check-core
* check-config
* check-connection
* check-route

###check-core

Used to retrieve information of the agent-core that is being used

* Displays the version of the current agent.
* Displays the working directory of the current agent.

````
c:\[working directory]>agent-cli check-core [options]
````

#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands

#####Command Variations
````
c:\[working directory]>agent-cli check-core
c:\[working directory]>agent-cli check-core —h
c:\[working directory]>agent-cli check-core —-help
````
###check-config

Used to check for configuration problems in the agent. 

* The agent will load and process all configuration files, 
* Displays agent apps that are installed
* Will not cause agent to enter into a ready state. 
* **NOTE:** This command is safe to run even if there is a agent currently running.

````
c:\[working directory]>agent-cli check-config [options]
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  full filename   | specifies the agent's configuration file to use
none   | --home    |  directory path   | fully qualified path of the agent's working directory
-v   |--verbose |  none   | prints more detailed information output
-q   |--quiet   |  none   | prints only essential information output

#####Command Variations
````
c:\[working directory]>agent-cli check-config
c:\[working directory]>agent-cli check-config —h
c:\[working directory]>agent-cli check-config —-help
c:\[working directory]>agent-cli check-config -f c:[working directory]\agent1.js
c:\[working directory]>agent-cli check-config —-config c:\[working directory]\agent1.js
c:\[working directory]>agent-cli check-config —-home c:\[working directory]
c:\[working directory]>agent-cli check-config -v
c:\[working directory]>agent-cli check-config —-verbose
c:\[working directory]>agent-cli check-config -q
c:\[working directory]>agent-cli check-config —-quiet
````
#####Return Response

Response | Description
----------| ----------
error: Error loading the agent file c:'\[working directory]\agent.js' | there is an issue with the agent.js 
error: Error: Cannot find module c:\[working directory]\agent.js | THE agent.js file is missing or has been renamed
error: unknown option [options] | Incorrect option

###check-connection

Used to check for connection issues with an agent.

````
c:\[working directory]>agent-cli check-connection [options]
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands

#####Command Variations
````
c:\[working directory]>agent-cli check-config
c:\[working directory]>agent-cli check-config —h
c:\[working directory]>agent-cli check-config —-help
````

The provided URL will go through the following checks:

1. Check the URL format
2. Check the DNS resolution from the agent's host
3. Check the TCP port is reachable by opening up a connection on host:port
4. Issue a HTTP GET against the ping endpoint of the system

#####Return Response

Response | Description
----------| ----------
error: unknown option [options] | Incorrect option

###check-route

Used to check for network problems (firewalls & proxy rules) from the perspective of the agent runtime. 

````
c:\[working directory]>agent-cli check-route <scheme://host:port/path>
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli check-route http://localhost:4444/#/dashboard
c:\[working directory]>agent-cli check-route —h
c:\[working directory]>agent-cli check-route —-help
c:\[working directory]>agent-cli check-route -v http://localhost:4444/#/dashboard
c:\[working directory]>agent-cli check-route —-verbose http://localhost:4444/#/dashboard
````
The provided URL will go through the following checks:

1. Check the URL format
2. Check the DNS resolution of host/IP
3. Check that the TCP port reachable by opening up a connection on host:port
4. If scheme is http of https then issue a HTTP GET against the specified URL

#####Return Response

Response | Description
----------| ----------
Got <scheme://host:port/path> | resolved the provided <scheme://host:port/path>
null unresolved | problem with the <host:port/path>
error: unknown option [options] | Incorrect option


###Usage Commands

* console

###console
Used to start the web console in the default browser that is set for the system. 

````
c:\[working directory]>agent-cli console
````
#####Options

short |long |  arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands

#####Command Variations
````
c:\[working directory]>agent-cli console
c:\[working directory]>agent-cli console -h
c:\[working directory]>agent-cli console --help
````
#####Return Response

Response | Description
----------| ----------
error: unknown option [options] | Incorrect option

###Configuration Commands

* reset
* revoke
* unassign
* init

###reset

Used to reset an agent's state by deleting the .agent file from the specified working directory.

````
c:\[working directory]>agent-cli reset [options]
````
**NOTE:** Using this command will delete the .agent file which contains the agent's identity

#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
none   | --home    |  directory   | fully qualified path of the agent's working directory
-f   | --force    |  none   | forces the agent to reset regardless of start
-H   | --HARD    |  none   | forces the reset the name and namespace of an agent
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli reset
c:\[working directory]>agent-cli reset -h
c:\[working directory]>agent-cli reset --help
c:\[working directory]>agent-cli reset --home c:\[working directory]
c:\[working directory]>agent-cli reset -F
c:\[working directory]>agent-cli reset -force
c:\[working directory]>agent-cli reset -H
c:\[working directory]>agent-cli reset -hard
c:\[working directory]>agent-cli reset -v
c:\[working directory]>agent-cli reset --verbose
````
#####Return Response

Response | Description
----------| ----------
Agent reset | .agent file as been deleted
No agent available at working directory | agent.js file missing from the working directory
error: unknown option [options] | Incorrect option

###revoke
Used to revoke an agent's access token.

* **NOTE:** This command will leave all other agent data intact.

````
c:\[working directory]>agent-cli revoke [options]
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
none   | --home |  directory   | fully qualified path of the agent's working directory
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli revoke
c:\[working directory]>agent-cli revoke -h
c:\[working directory]>agent-cli revoke --help
c:\[working directory]>agent-cli revoke --home c:\[working directory]
c:\[working directory]>agent-cli revoke -v
c:\[working directory]>agent-cli revoke --verbose
````
#####Return Response

Response | Description
----------| ----------
Authorization revoke | the Authorization token as been removed
error: unknown option [options] | Incorrect option

###unassign
Used to remove the agent's association to a namespace.

````
c:\[working directory]>agent-cli unassign [options]
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
none   | --home    |  directory   | fully qualified path of the agent's working directory
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli unassign
c:\[working directory]>agent-cli unassign -h
c:\[working directory]>agent-cli unassign --help
c:\[working directory]>agent-cli unassign --home c:\[working directory]
c:\[working directory]>agent-cli unassign -v
c:\[working directory]>agent-cli unassign --verbose
````
#####Return Response

Response | Description
----------| ----------
No agent available at working directory | agent.js file missing from the working directory
error: unknown option [options] | Incorrect option

###init
Used to initialize or create the agent's configuration file.

````
c:\[working directory]>agent-cli init [options]
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-F   |--force |  none   | forces the creation of the agent.js
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli init
c:\[working directory]>agent-cli init -h
c:\[working directory]>agent-cli init --help
c:\[working directory]>agent-cli init --config c:\[working directory]\agent.js
c:\[working directory]>agent-cli init -f
c:\[working directory]>agent-cli init --force
c:\[working directory]>agent-cli init -v
c:\[working directory]>agent-cli init --verbose
````
#####Return Response

Response | Description
----------| ----------
Agent created | An agent configuration file as being created in the working directory
Agent already exist Use -F or --force to recreate | Configuration file already exists
error: unknown option [options] | Incorrect option

###Agent Application Commands
* download
* install-app
* configure-app
* uninstall-app
* update
* remove

#####Here are the steps for using these commands;

1. Download the application package to the system
2. Install the application package into the agent
3. Configure the application package with the correct settings

When the application package is no longer needed;

1. Uninstall the application package from the agent

If at anytime an update is need for a package;

1. Update the specific package

To remove a package from the system;

1. Remove the application package for the system



###Application Commands
###download
Used to download a remote module.

````
c:\[working directory]>agent-cli download [options] <app>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-F   |--force |  none   | forces the creation of the agent.js
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli download agent-app-weather
c:\[working directory]>agent-cli download -h
c:\[working directory]>agent-cli download --help
c:\[working directory]>agent-cli download --f c:\[working directory]\agent.js
c:\[working directory]>agent-cli download -v agent-app-weather
c:\[working directory]>agent-cli download --verbose agent-app-weather
````
#####Return Response

Response | Description
----------| ----------
Unable to locate the application [application] | Name is not found or is incorrect
error: unknown option [options] | Incorrect option

###install-app
Used to install an application into the agent.

````
c:\[working directory]>agent-cli install-app [options] <app>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-n   |--name |  name of app   | the name of the app
-F   |--force |  none   | forces the creation of the agent.js
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli install-app agent-app-weather
c:\[working directory]>agent-cli install-app -h
c:\[working directory]>agent-cli install-app --help
c:\[working directory]>agent-cli install-app --f c:\[working directory]\agent.js
c:\[working directory]>agent-cli install-app --config c:\[working directory]\agent.js
c:\[working directory]>agent-cli install-app --n agent-compris
c:\[working directory]>agent-cli install-app --name agent-compris
c:\[working directory]>agent-cli install-app --F c:\[working directory]\agent.js
c:\[working directory]>agent-cli install-app --force c:\[working directory]\agent.js
c:\[working directory]>agent-cli install-app -v agent-app-weather
c:\[working directory]>agent-cli install-app --verbose agent-app-weather
````
#####Return Response

Response | Description
----------| ----------
Error: Can not find module [application] from [working directory]  | Name is not found or is incorrect
error: unknown option [options] | Incorrect option

###enable-app
Used to enable the app for the agent.

````
c:\[working directory]>agent-cli enable-app [options] <app>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli enable-app agent-compris
c:\[working directory]>agent-cli enable-app -h
c:\[working directory]>agent-cli enable-app --help
c:\[working directory]>agent-cli enable-app --f c:\[working directory]\agent.js agent-compris
c:\[working directory]>agent-cli enable-app --config c:\[working directory]\agent.js agent-compris
c:\[working directory]>agent-cli enable-app -v agent-compris
c:\[working directory]>agent-cli enable-app --verbose agent-compris
````
#####Return Response

Response | Description
----------| ----------
App [app] not registered with agent| App is not found or is incorrect
error: unknown option [options] | Incorrect option

###disable-app
Used to disable the app for the agent.

````
c:\[working directory]>agent-cli disable-app [options] <app>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli disable-app agent-compris
c:\[working directory]>agent-cli disable-app -h
c:\[working directory]>agent-cli disable-app --help
c:\[working directory]>agent-cli disable-app --f c:\[working directory]\agent.js agent-compris
c:\[working directory]>agent-cli disable-app --config c:\[working directory]\agent.js agent-compris
c:\[working directory]>agent-cli disable-app -v agent-compris
c:\[working directory]>agent-cli disable-app --verbose agent-compris
````
#####Return Response

Response | Description
----------| ----------
App [app] not registered with agent| App is not found or is incorrect
error: unknown option [options] | Incorrect option

###list-apps
Used to list the app for the agent that are installed.

````
c:\[working directory]>agent-cli list-apps [options]
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli list-apps 
c:\[working directory]>agent-cli list-apps -h
c:\[working directory]>agent-cli list-apps --help
c:\[working directory]>agent-cli list-apps --f c:\[working directory]\agent.js 
c:\[working directory]>agent-cli list-apps --config c:\[working directory]\agent.js 
c:\[working directory]>agent-cli list-apps -v 
c:\[working directory]>agent-cli list-apps --verbose 
````
#####Return Response

Response | Description
----------| ----------
error: unknown option [options] | Incorrect option

###configure-app
Used to configure the app for the agent.

````
c:\[working directory]>agent-cli configure-app [options] <app>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-F   |--force |  none   | forces the reconfiguration of the app
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli configure-app compris
c:\[working directory]>agent-cli configure-app -h
c:\[working directory]>agent-cli configure-app --help
c:\[working directory]>agent-cli configure-app -F c:\[working directory]\agent.js compris --force
c:\[working directory]>agent-cli configure-app --config c:\[working directory]\agent.js compris
c:\[working directory]>agent-cli configure-app compris --f
c:\[working directory]>agent-cli configure-app compris --force 
c:\[working directory]>agent-cli configure-app compris -v
c:\[working directory]>agent-cli configure-app compris --verbose
````
#####Return Response

Response | Description
----------| ----------
the app [app] already exists | something
unable to find application in c:\BodhiAgent | could not find application in the confiuration file agent.js
error: unknown option [options] | Incorrect option

###uninstall-app
Used to uninstall a downloaded app for the agent.

````
c:\[working directory]>agent-cli uninstall-app [options] <app>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli uninstall-app compris
c:\[working directory]>agent-cli uninstall-app -h
c:\[working directory]>agent-cli uninstall-app --help
c:\[working directory]>agent-cli uninstall-app --f c:\[working directory]\agent.js compris
c:\[working directory]>agent-cli uninstall-app --config c:\[working directory]\agent.js compris
c:\[working directory]>agent-cli uninstall-app -v compris
c:\[working directory]>agent-cli uninstall-app --verbose compris
````
#####Return Response

Response | Description
----------| ----------
App [application] removed from agent| the application has been uninstall from the agents configuration file
App not registered with the agent | error: unknown option [options] | Incorrect option

###Update & Remove Commands

* update
* remove

###update
Used to update to the latest version of a package or module.

````
c:\[working directory]>agent-cli update [options] <package>
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli update agent-app-compris
c:\[working directory]>agent-cli update -h
c:\[working directory]>agent-cli update --help
c:\[working directory]>agent-cli update agent-app-compris -v
c:\[working directory]>agent-cli update agent-app-compris --verbose
````
#####Return Response

Response | Description
----------| ----------
agent-core@x.x.x node_modules\agent-core | version number and location of the console module
updated package [package]| the specific package was successfully updated
error: unknown option [options] | Incorrect option

###remove
Used to update to the package from the system.

````
c:\[working directory]>agent-cli update-console [options]
````
#####Options

short | long | arg    | description
:------:| :---------: | :------: | :-------------
-h   | --help |  none   | prints a descriptive list of the commands
-v   |--verbose |  none   | prints more detailed information output

#####Command Variations
````
c:\[working directory]>agent-cli remove
c:\[working directory]>agent-cli update-console -h
c:\[working directory]>agent-cli update-console --help
c:\[working directory]>agent-cli update-console -v
c:\[working directory]>agent-cli update-console --verbose
````
#####Return Response

Response | Description
----------| ----------
npm WARN uninstall not installed in[working directory\node_modules: "package" package removed | package not found 
[package] removed | the specified package was successfully remove
error: unknown option [options] | Incorrect option


