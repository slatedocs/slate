# CLI Reference

The Bonsai Command Line Interface (CLI) is a text based tool that enables you to configure and control the Bonsai Artificial Intelligence Engine. The CLI is especially useful for automation and connection to other tools. Currently, there are some actions that can only be performed using the CLI, such as loading your Inkling file and connecting your simulator.  

```shell
$ bonsai command --help
```

Use `bonsai command --help` to get information about a specific command. You can use bonsai --help to view a list of groups and commands.

The Bonsai CLI is hierarchical.

![The Bonsai CLI][1]

The Bonsai CLI command hierarchy.

## Configure Command

```
$ bonsai configure
```

**configure** sets up authentication between you, as a user, and the server. This enables the server to verify that you are allowed to write Inkling code to a specific BRAIN. You can find your access code in your account settings at .

## Brain Commands

###### Create

```
$ bonsai create brainName
```

**create** generates a new brain and names it (brainName).  It also
sets the assumed brain name for later commands.

Brain names can include:

* letters
* numbers
* dashes

It is case insensitive, but case aware.

###### Load

```
$ bonsai load
```

**load** loads an Inkling file into the current brain.  The project
file in the current directory (`bonsai_brain.bproj`) determines which
inkling file to load.  You can specify --brain brainName, or --project
/brain/project to use another brain.

## Train group commands

###### Start

```
$ bonsai train start
```

**start** turns on/enables training mode for the current BRAIN. The BRAIN trains whenever the simulator is connected. If the simulator is disconnected, the BRAIN remains in training mode, and it will train again where it left off when the simulator is reconnected.

###### Stop

```
$ bonsai train stop
```

**stop** turns off training mode for the current BRAIN.

## Bonsai CLI --help output

###### `bonsai --help`

```
bonsai --help
Usage: bonsai [OPTIONS] COMMAND [ARGS]...

  Command line interface for the Bonsai Artificial Intelligence Engine.

Options:
  --help     Show this message and exit.
  --version  Show the version and exit.

Commands:
  brain      Create, delete BRAINs.
  configure  Authenticate with the BRAIN Server.
  create     Create a BRAIN and set the default BRAIN.
  list       List BRAINs owned by the current user.
  load       Loads an inkling file into the given BRAIN.
  sims       Retrieve information about simulators.
  train      Start and stop training on a BRAIN.
```

###### `bonsai configure --help`

```
$ bonsai configure --help
Usage: bonsai configure [OPTIONS]

  Authenticate with the BRAIN Server.

Options:
  --help  Show this message and exit.
```

###### `bonsai configure --help`

```
$ bonsai configure --help
Usage: bonsai configure [OPTIONS]

  Authenticate with the BRAIN Server.

Options:
  --key TEXT  Provide an access key.
  --help      Show this message and exit.
```

###### `bonsai create --help`

```
$ bonsai create --help
Usage: bonsai create [OPTIONS] BRAIN_NAME

  Creates a BRAIN and sets the default BRAIN for future commands.

Options:
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

###### `bonsai train --help`

```
$ bonsai train --help
Usage: bonsai train [OPTIONS] COMMAND [ARGS]...

  Start and stop training on a BRAIN, as well as get training status
  information.

Options:
  --help  Show this message and exit.

Commands:
  start   Trains the specified BRAIN.
  status  Gets training status on the specified BRAIN.
  stop    Stops training on the specified BRAIN.
```

###### `bonsai train status --help`

```
$ bonsai train status --help
Usage: bonsai train status [OPTIONS] BRAIN_NAME

  Gets training status on the specified BRAIN.

Options:
  --brain TEXT    Override to target another BRAIN.
  --json          Output status as json.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

###### `bonsai train start --help`

```
$ bonsai train start --help
Usage: bonsai train start [OPTIONS] BRAIN_NAME

  Trains the specified BRAIN.

Options:
  --brain TEXT    Override to target another BRAIN.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

###### `bonsai train stop --help`

```
$ bonsai train stop --help
Usage: bonsai train stop [OPTIONS] BRAIN_NAME

  Stops training on the specified BRAIN.

Options:
  --brain TEXT    Override to target another BRAIN.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
‍```
```

[1]: https://daks2k3a4ib2z.cloudfront.net/57bf257ce45825764c5cb54b/57e9bbd37af2be7632479217_bonsaiAI.png "The Bonsai CLI"
