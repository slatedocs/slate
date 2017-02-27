# Commands

[//]: # (How do we want to standardize shell output vs. input? Either could go right/left pane.)
[//]: # (The help text and the description text are currently super redundant.)

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

Use `bonsai COMMAND --help` to get information about a specific command. You can use `bonsai --help` to view a list of options for COMMAND.

## bonsai configure

```
$ bonsai configure
```

`configure` sets up authentication between you (as a user) and the server. This enables the server to verify that you are allowed to write Inkling code to a specific BRAIN.

You can find your access key at [https://beta.bons.ai/accounts/key](https://beta.bons.ai/accounts/key).

```
$ bonsai configure --help
Usage: bonsai configure [OPTIONS]

  Authenticate with the BRAIN Server.

Options:
  --key TEXT  Provide an access key.
  --help      Show this message and exit.
```

## bonsai create

```
$ bonsai create brainName
```

`create` generates a new brain and names it "brainName".  It also sets the assumed BRAIN name for later commands.


```
$ bonsai create --help
Usage: bonsai create [OPTIONS] BRAIN_NAME

  Creates a BRAIN and sets the default BRAIN for future commands.

Options:
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

BRAIN names may include:

* letters
* numbers
* dashes

It is case insensitive, but case aware.

## bonsai brain create

```
$ bonsai brain create brainName
```

`create` generates a new brain and names it "brainName".  It also sets the assumed BRAIN name for later commands.


```
$ bonsai brain create --help
Usage: bonsai brain create [OPTIONS] BRAIN_NAME

  Creates a BRAIN on the server.

Options:
  --help  Show this message and exit.
```

[//]: # (There is no bonsai brain delete yet - CLI v2)


## bonsai load

```
$ bonsai load
```

`bonsai load` loads an Inkling file into the current brain.  The project file in the current directory (`bonsai_brain.bproj`) determines which inkling file to load.  You can specify `--brain brainName`, or `--project /brain/project` to use another brain.

## bonsai train

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

## bonsai train start

```
$ bonsai train start
```

`start` turns on/enables training mode for the current BRAIN. The BRAIN trains whenever the simulator is connected. If the simulator is disconnected, the BRAIN remains in training mode, and it will train again where it left off when the simulator is reconnected.

```
$ bonsai train start --help
Usage: bonsai train start [OPTIONS]

  Trains the specified BRAIN.

Options:
  --brain TEXT    Override to target another BRAIN.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

## bonsai train stop

```
$ bonsai train stop
```

`stop` turns off training mode for the current BRAIN.

```
$ bonsai train stop --help
Usage: bonsai train stop [OPTIONS] BRAIN_NAME

  Stops training on the specified BRAIN.

Options:
  --brain TEXT    Override to target another BRAIN.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

## bonsai train status

```
$ bonsai train status
```

`bonsai train status` is used to see the current training status of your BRAIN.

```
$ bonsai train status --help
Usage: bonsai train status [OPTIONS]

  Gets training status on the specified BRAIN.

Options:
  --brain TEXT    Override to target another BRAIN.
  --json          Output status as json.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```

## bonsai list

```
$ bonsai list
```

`list` shows you the BRAINs you currently own or by a user under a given URL.


```
$ bonsai list --help
Usage: bonsai list [OPTIONS]

  Lists BRAINs owned by current user or by the user under a given URL.

Options:
  --help  Show this message and exit.
```

## bonsai sims list

```
$ bonsai sims list
```

`bonsai sims list` shows you all of the simulators you have connected to the BRAIN server.

```
$ bonsai sims list --help
Usage: bonsai sims list [OPTIONS]

  List the simulators connected to the BRAIN server.

Options:
  --brain TEXT    Override to target another BRAIN.
  --project TEXT  Override to target another project directory.
  --help          Show this message and exit.
```
