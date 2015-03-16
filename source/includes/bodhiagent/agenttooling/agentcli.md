####Agent-CLI

The agent-cli provides administrators, support team members, and developers a tool for interacting with an agent.

#####General Usage

The general structure of the agent-cli commands are as follows:

````
c:agent-cli [options] <action> [arguments]
````
######Options

*	Options are prefixed with `-` or `--` to separate them from arguments. 
*	Each command or action defines the options it uses. 
*	**NOTE:** the options are consistent in naming convention and usage across the commands.

######Common Options

short |long |  arg    | description
------| --------- | ------ | -------------
none | --help |  none   | print help about the command
-v | --verbose | -v | none   | print more detailed output
-q   | --quiet   | none   | print essential output
-f  | --config  | filename   | fully qualified path of the agent's configuration file to use
-h    |--home    | path   | fully qualified path of the agent's working directory
-F   | --force   | none   | directive to override safety logic

######Arguments
*	The agent-cli interprets the first argument (non-option) as the action command. 
*	All subsequent arguments are command specific. 

The commands are grouped into a sub group.
The following Commands groups are;

* **Informational Commands**
* **Lifecycle Commands**
* **Diagnostic Commands**
* **Usage Commands**
* **Configuration Commands**
* **Update Commands**

#####Informational Commands

######help

The command line provides built in helper functions.

######Navigation Help
For a descriptive list of the commands 

````
c:agent-cli --help
````
######version

Displays the version information of the agent-cli.

````
c: agent-cli -V
c: agent-cli --version 
````
**NOTE:** The output is a simple version identifier following the semantic versioning rules of major, minor, and build.

````
Major.minor.build (e.g. 1.0.51)
````
######info

Used to display information of the Agent-CLI.

* Displays the agent-cli splash screen
* Displays the version of the agent-cli
* Displays the working directory of the agent

````
c:agent-cli info
````
######Lifecycle Commands

Lifecycle commands allow an administrator to change and check the run state of an agent.

######start

Used to attempt to start an agent.

* Allows the selection of which agent configuration file to use
* Allows the selection of the agent working directory
* Allows the selection of the agent pidFile to use
* Allows the setting of the level of detail to output

````
c: agent-cli start [options] 
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
none   | --home    |  directory path   | fully qualified path of the agent's working directory
none |--pidFile |  filename   | fully qualified filename of the agent's pidFileagent-cli
-v   |--verbose |  none   | provides more detailed information output
-q   |--quiet   |  none   | provides only essential information output

````
c:agent-cli start -h
c:agent-cli start —-help
c:agent-cli start -f c:\BodhiAgent\agent1.js
c:agent-cli start —-config c:\BodhiAgent\agent1.js
c:agent-cli start —-home c:\
c:agent-cli start —-pidFile c:\BodhiAgent\agent.pid
c:agent-cli start -v
c:agent-cli start —verbose
c:agent-cli start -q
c:agent-cli start —-quiet
````
######Return Response

Response | Description
----------| ----------
Error: connect EADDRNOTAVAIL | the connection url  in the configuration file is bad
error: unknown option 'option' | Bad option

######status

Used to retrieve the status of a running agent.

* Allows the selection of the agent configuration file to use
* Allows the setting of the level of detail to output

````
c: agent-cli status [options] 
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli status —h
c:agent-cli status —-help
c:agent-cli status -f c:\BodhiAgent\agent1.js
c:agent-cli status —-config c:\BodhiAgent\agent1.js
c:agent-cli status -v
c:agent-cli status —verbose
````
######Return Response

Response | Description
----------| ----------
agent available		|	agent is running and available
agent unavailable	|	agent has stopped
agent unable to start using fully qualified configuration path| No configuration file at fully qualified configuration path
error: unknown option 'option' | Bad option

######stop

Used to gracefully stop or shutdown an agent.

* Allows the selection of the agent configuration file to use
* Allows the setting of the level of detail to output

````
c:agent-cli stop [options] 
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli stop —h
c:agent-cli stop —-help
c:agent-cli stop -f c:\BodhiAgent\agent1.js
c:agent-cli start —-config c:\BodhiAgent\agent1.js
c:agent-cli start -v
c:agent-cli start —verbose
````
######Return Response

Response | Description
----------| ----------
agent stopping now ...| agent is shutting down gracefully updated
agent is unavailable | agent is stopped
agent unable to start using fully qualified configuration path| No configuration file at fully qualified configuration path
error: unknown option 'option' | Bad option

######set-name

Used to configure the name of an agent.

* Allows the setting of the name of the agent
* Allows the selection of the agent configuration file to use
* Allows the setting of the level of detail to output

````
c:agent-cli set-name [options] <name>
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli set-name —h
c:agent-cli set-name —-help
c:agent-cli set-name Fred
c:agent-cli set-name -f c:\BodhiAgent\agent1.js Teddy
c:agent-cli set-name —config c:\BodhiAgent\agent1.js Herb
c:agent-cli set-name -v Fred
c:agent-cli set-name --verbose Fred
````
######Return Response

Response | Description
----------| ----------
agent updated | the configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option 'option' | Bad option

######set-connection

Used to configure a connection to an agent.

* Allows the setting of the http url for the connection
* Allows the selection of the agent configuration file to use
* Allows the setting of the timeout value
* Allows the setting of the proxy http url
* Allows the setting of the level of detail to output

````
c: agent-cli set-connection [options] connection]
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified filename of the agent's configuration file to use
none   |--timeout  |  value   | specifies the connections timeout value
none   |--proxy  |  proxy   | specifies the http proxy url
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli set-connection —h
c:agent-cli set-connection —-help
c:agent-cli set-connection https://api.redbookcloud.com
c:agent-cli set-connection -f c:\BodhiAgent\agent1.js
c:agent-cli set-connection —-config c:\BodhiAgent\agent1.js
c:agent-cli set-connection --timeout 20000
c:agent-cli set-connection —-proxy http://proxy.redbookcloud.com
c:agent-cli set-connection -v https://api.redbookcloud.com
c:agent-cli set-connection --verbose https://api.redbookcloud.com
````
######Return Response

Response | Description
----------| ----------
agent updated | the agent configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option 'option' | Bad option

######set-logger

Used to configure the logging of an agent.

* 	Allows the setting of the log file location 
* 	Allows the selection of the agent configuration file to use
*  	Allows the setting of the level of logging information
* 	Allows the setting of the level of detail to output

````
c: set-logger [options
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified path of the agent's configuration file to use
none   |--file  |  filename   | fully qualified filename of the the log file location
none   |--level  |  level   | specifies the log level (error, warn, info, verbose, debug)
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli set-logger —h
c:agent-cli set-logger —-help
c:agent-cli set-logger Fred
c:agent-cli set-logger -f c:\BohiAgent\agent1.js
c:agent-cli set-logger —-file c:\BodhiAgent\test.log
c:agent-cli set-logger -f c:\BohiAgent\agent1.js
c:agent-cli set-logger --level error
c:agent-cli set-logger —-level warn
c:agent-cli set-logger —-level info
c:agent-cli set-logger —-level verbose
c:agent-cli set-logger —-level debug
c:agent-cli set-logger -v
c:agent-cli set-logger —-verbose
````
######Return Response

Response | Description
----------| ----------
agent updated | the agent configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option 'option' | Bad option

######set-management

Used to configure the management endpoint for an agent.

* 	Allows the setting of the log file location 
* 	Allows the selection of the agent configuration file to use
*  	Allows the setting of the http port
*  	Allows the setting of the http address to listen on
* 	Allows the setting of the level of detail to output

````
c: set-management [options]
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  filename   | fully qualified path of the agent's configuration file to use
none   |--port  |  port address   | specifies the management http port address
none   |--connection  |  url:port   | specifies the mnagement url and port address
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli set-management https://api.bodhi.space
c:agent-cli set-management —h
c:agent-cli set-management —-help
c:agent-cli set-management -f c:\BodhiAgent\agent1.js
c:agent-cli set-management —-config c:\BodhiAgent\agent1.js
c:agent-cli set-management —-port 4444
c:agent-cli set-management —-connection https://api.bodhi.space:4444
c:agent-cli set-management -v https://api.bodhi.space
c:agent-cli set-management -- verbose https://api.bodhi.space
````
######Return Response

Response | Description
----------| ----------
agent updated | the agent configuration file has be successfully updated
No agent available at <location> | there is no agent configuration file at the specific location
error: unknown option 'option' | Bad option

#####Diagnostic Commands

Diagnostic commands are used by an administrator to troubleshoot an agent that is having trouble entering a running state or to test environmental specific details uniformly across platforms.

######check-core

Used to retrieve information of the agent-core that is being used

* Displays the version of the current agent.
* Displays the working directory of the current agent.

````
c:agent-cli check-core [options]
````

######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands

````
c:agent-cli check-core
c:agent-cli check-core —h
c:agent-cli check-core —-help
````
######check-config

Used to check for configuration problems in the agent. 

* The agent will load and process all configuration files, 
* Displays agent apps that are installed
* Will not cause agent to enter into a ready state. 
* **NOTE:** This command is safe to run even if there is a agent currently running.

````
c:agent-cli check-config [options]
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   |--config  |  full filename   | specifies the agent's configuration file to use
none   | --home    |  directory path   | fully qualified path of the agent's working directory
-v   |--verbose |  none   | prints more detailed information output
-q   |--quiet   |  none   | prints only essential information output

````
c:agent-cli check-config
c:agent-cli check-config —h
c:agent-cli check-config —-help
c:agent-cli check-config -f c:BodhiAgent\agent1.js
c:agent-cli check-config —-config c:\BodhiAgent\agent1.js
c:agent-cli check-config —-home c:\BodhiAgent
c:agent-cli check-config -v
c:agent-cli check-config —-verbose
c:agent-cli check-config -q
c:agent-cli check-config —-quiet
````
######Return Response

Response | Description
----------| ----------
error: unknown option 'option' | Bad option

######check-connection

Used to check for connection issues with an agent.

````
c:agent-cli check-connection [options]
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands

````
c:agent-cli check-config
c:agent-cli check-config —h
c:agent-cli check-config —-help
````

The provided URL will go through the following checks:

1. Check the URL format
2. Check the DNS resolution from the agent's host
3. Check the TCP port is reachable by opening up a connection on host:port
4. Issue a HTTP GET against the ping endpoint of the system

######Return Response

Response | Description
----------| ----------
error: unknown option 'option' | Bad option

######check-route

Used to check for network problems (firewalls & proxy rules) from the perspective of the agent runtime. 

````
c:agent-cli check-route <scheme://host:port/path>
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli check-route http://localhost:4444/#/dashboard
c:agent-cli check-route —h
c:agent-cli check-route —-help
c:agent-cli check-route -v http://localhost:4444/#/dashboard
c:agent-cli check-route —-verbose http://localhost:4444/#/dashboard
````
The provided URL will go through the following checks:

1. Check the URL format
2. Check the DNS resolution of host/IP
3. Check that the TCP port reachable by opening up a connection on host:port
4. If scheme is http of https then issue a HTTP GET against the specified URL

######Return Response

Response | Description
----------| ----------
Got <scheme://host:port/path> | resolved the provided <scheme://host:port/path>
null unresolved | problem with the <host:port/path>
error: unknown option 'option' | Bad option


#####Usage Commands

######console
Used to start the web console in the default browser that is set for the system. 

````
c:agent-cli console
````
######Options

short |long |  arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands

````
c:agent-cli console
c:agent-cli console -h
c:agent-cli console --help
````
######Return Response

Response | Description
----------| ----------
error: unknown option 'option' | Bad option

#####Configuration Commands

######reset

Used to reset an agent's state by deleting the .agent file from the specified working directory.

````
c:agent-cli reset [options]
````
**NOTE:** Using this command will delete the .agent file which contains the agent's identity

######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
none   | --home    |  directory   | fully qualified path of the agent's working directory
-f   | --force    |  none   | forces the agent to reset regardless of start
-H   | --HARD    |  none   | forces the reset the name and namespace of an agent
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli reset
c:agent-cli reset -h
c:agent-cli reset --help
c:agent-cli reset --home c:\BodhiAgent
c:agent-cli reset -F
c:agent-cli reset -force
c:agent-cli reset -H
c:agent-cli reset -hard
c:agent-cli reset -v
c:agent-cli reset --verbose
````
######Return Response

Response | Description
----------| ----------
Agent reset | .agent file as been deleted
No agent available at working directory | agent.js file missing from the working directory
error: unknown option 'option' | Bad option

######revoke
Used to revoke an agent's access token.

* **NOTE:** This command will leave all other agent data intact.

````
c:agent-cli revoke [options]
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
none   | --home |  directory   | fully qualified path of the agent's working directory
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli revoke
c:agent-cli revoke -h
c:agent-cli revoke --help
c:agent-cli revoke --home c:\BodhiAgent
c:agent-cli revoke -v
c:agent-cli revoke --verbose
````
######Return Response

Response | Description
----------| ----------
Authorization revoke | the Authorization token as been removed
error: unknown option 'option' | Bad option

######unassign
Used to remove the agent's association to a namespace.

````
c:agent-cli unassign [options]
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
none   | --home    |  directory   | fully qualified path of the agent's working directory
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli unassign
c:agent-cli unassign -h
c:agent-cli unassign --help
c:agent-cli unassign --home c:\BodhiAgent
c:agent-cli unassign -v
c:agent-cli unassign --verbose
````
######Return Response

Response | Description
----------| ----------
No agent available at working directory | agent.js file missing from the working directory
error: unknown option 'option' | Bad option

######init
Used to initialize or create the agent's configuration file.

````
c:agent-cli init [options]
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-F   |--force |  none   | forces the creation of the agent.js

````
c:agent-cli init
c:agent-cli init -h
c:agent-cli init --help
c:agent-cli init --config c:\BodhiAgent\agent.js
c:agent-cli init -f
c:agent-cli init --force
````
######Return Response

Response | Description
----------| ----------
Agent created | An agent configuration file as being created in the working directory
Agent already exist Use -F or --force to recreate | Configuration file already exists
serror: unknown option 'option' | Bad option

######install-app
Used to install an application into the agent.

````
c:agent-cli install-app [options] <app>
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-F   |--force |  none   | forces the creation of the agent.js

````
c:agent-cli install-app agent-app-weather
c:agent-cli install-app -h
c:agent-cli install-app --help
c:agent-cli install-app --f c:\BodhiAgent\agent.js
c:agent-cli install-app --config c:\BodhiAgent\agent.js
c:agent-cli install-app -v agent-app-weather
c:agent-cli install-app --verbose agent-app-weather
````
######Return Response

Response | Description
----------| ----------
Unable to locate the application [application] | Name is not found or is incorrect
error: unknown option 'option' | Bad option

######install-ext
Used to install an extension into the agent.

````
c:agent-cli install-ext [options] <app>
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-f   | --config    |  directory   | fully qualified filename of the agent's configuration file
-F   |--force |  none   | forces the creation of the agent.js

````
c:agent-cli install-ext agent-ext-csv-to-json
c:agent-cli install-ext -h
c:agent-cli install-ext --help
c:agent-cli install-ext --f c:\BodhiAgent\agent.js
c:agent-cli install-ext --config c:\BodhiAgent\agent.js
c:agent-cli install-ext -v agent-ext-csv-to-json
c:agent-cli install-ext --verbose agent-ext-csv-to-json
````
######Return Response

Response | Description
----------| ----------
Unable to locate the extension [extension] | Name is not found or is incorrect
error: unknown option 'option' | Bad option

#####Update Commands

######update-core
Used to update to the latest version of the agent.

````
c:agent-cli update-core [options]
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli update-core
c:agent-cli update-core -h
c:agent-cli update-core --help
c:agent-cli update-core -v
c:agent-cli update-core --verbose
````
######Return Response

Response | Description
----------| ----------
agent-core@x.x.x node_modules\agent-core | version number and location of the console module
agent-core updated | Agent core was successfully updated
error: unknown option 'option' | Bad option

######update-console
Used to update to the latest version of the web console.

````
c:agent-cli update-console [options]
````
######Options

short | long | arg    | description
------| --------- | ------ | -------------
-h   | --help |  none   | prints a descriptive list of the commands
-v   |--verbose |  none   | prints more detailed information output

````
c:agent-cli update-console
c:agent-cli update-console -h
c:agent-cli update-console --help
c:agent-cli update-console -v
c:agent-cli update-console --verbose
````
######Return Response

Response | Description
----------| ----------
agent-console@x.x.x node_modules\agent-console | version number and location of the console module
agent-console updated | Agent console was successfully updated
error: unknown option 'option' | Bad option



