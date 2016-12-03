
# CLI Reference - Bons.ai

The Bonsai Command Line Interface (CLI) is a text based tool that enables you to configure and control the Bonsai Artificial Intelligence Engine. The CLI is especially useful for automation and connection to other tools. Currently, there are some actions that can only be performed using the CLI, such as loading your inkling file and connecting your simulator.  


```
$ bonsai command --help
```
Use `bonsai command --help` to get information about a specific command. You can use bonsai --help to view a list of groups and commands.

The Bonsai CLI is hierarchical.

![][1]

The Bonsai CLI command hierarchy.

## Configure Command
```
$ bonsai configure _accessKey_
```
**configure** sets up authentication between you, as a user, and the server. This enables the server to verify that you are allowed to write Inkling code to a specific BRAIN. You can find your access code in your account settings at .

## Brain Group Commands
```
$ bonsai brain create _brainName_
```
**create **generates a new brain and names it (brainName).

Brain names can include:
- letters
- numbers
- dashes

It is case insensitive, but case aware.
```
$ bonsai brain load _brainNameinklingFile_.ink
```
**load** loads an Inkling file (inklingFile.ink) to a specific BRAIN (brainName).

## train group commands
```
$ bonsai brain train start _brainName_
```
**start** turns on/enables training mode for a specific BRAIN (brainName). The BRAIN trains whenever the simulator is connected. If the simulator is disconnected, the BRAIN remains in training mode, and it will train again where it left off when the simulator is reconnected.
```
$ bonsai brain train stop _brainName_
```
**stop** turns off training mode for a specific BRAIN (brainName).

## Bonsai CLI --help output
```
$ bonsai --help
```
usage: bonsai [-h] {brain,configure} ...

Command line interface for the Bonsai Artificial Intelligence Engine.

positional arguments:
    {brain, configure}
       brain            Commands that operate on a BRAIN
       configure        Configure this Bonsai CLI

optional arguments:

```
$ bonsai configure --help
```
> Usage: bonsai configure [OPTIONS]

>  Authenticate with the BRAIN Server.

```
$ bonsai brain --help
```
> usage: bonsai brain [-h] {load,train} ...
>
> positional arguments:
    {load,train}
>   load               Uploads inkling file(s) to a BRAIN.
>   train              Trains a BRAIN.

```
$ bonsai brain train --help
```
> Usage: bonsai brain train [-h] {start,stop} ...
>
> positional arguments:
 {start,stop,status}

>   start              Starts training a BRAIN. Must connect simulator before starting  
   stop               Stops training a BRAIN.  
   status             Gets training status on the specified BRAIN

```
$ bonsai brain train status --help
```
> Usage: bonsai brain train status [OPTIONS] BRAIN_NAME

> Gets training status on the specified BRAIN.  
> Options:  --help  Show this message and exit.

```
$ bonsai brain train start --help
```
> Usage: bonsai brain train start [OPTIONS] BRAIN_NAME
 Trains the specified BRAIN.
>
> Options:  --help  Show this message and exit.

```
$ bonsai brain train stop --help
```
> Usage: bonsai brain train stop [OPTIONS] BRAIN_NAME
> Stops training on the specified BRAIN.
>
> Options:  --help  Show this message and exit.

‍

[1]: https://daks2k3a4ib2z.cloudfront.net/57bf257ce45825764c5cb54b/57e9bbd37af2be7632479217_bonsaiAI.png
