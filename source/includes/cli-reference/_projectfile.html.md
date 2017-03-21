# Projects and Config Files

The Bonsai command-line interface works with three files.  A `.bonsai` file in
your user directory, a project file in the directory containing the Inkling 
files and simulator configuration for a BRAIN, and a `.brains` file that links
a project file to a BRAIN in the same directory as the project file.

## .bonsai file

```ini
[DEFAULT]
port = 443
username = bonsaiuser
accesskey = 55555555-5555-5555-5555-555555555555
webport = 443
webhost = beta.bons.ai
host = api.bons.ai
usessl = True
```

The `.bonsai`, located in your user directory, file stores your username and an access token for access to the
Bonsai servers.


## .bproj file

```json
{
    "files": [
        "mybrain.ink"
    ],
    "training": [{
        "command": "python my_simulator.py",
        "simulator": "openai.gym"
    }]
}
```

Project files are created in the same directory as your Inkling files when
you download or create a BRAIN with the CLI. The project file has a name like
`bonsai_brain.bproj` and contains a JSON object that ties together the Inkling
files and simulator configuration needed to train a BRAIN.

 * `files` is a list of files or directories to search for inkling files. All
the Inkling listed is concatenated together to form the inkling for this BRAIN.
There must be at least one valid path in the `files` list.

 * `training` is a list of objects.  The `simulator` field of that object
points to a pre-configured simulation container inside the platform. The
`command` field describes the command to run to start the simulator.

## .brains file

```json
{
    "brains": [{
        "default": true,
        "name": "mybrain"
    }]
}

```

The `.brains` file links a project to a BRAIN on the server. You can link one
project to many BRAINs.  The file is located in the same directory as a
project file.


 * `name` is a name of one of this user's BRAINs.

 * `default` marks a named BRAIN as the default BRAIN to use with command
   operations.



