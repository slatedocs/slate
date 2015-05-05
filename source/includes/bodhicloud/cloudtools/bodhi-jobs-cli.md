Bodhi-Jobs CLI Tool
=============

A Command Line Tool for Bodhi Cloud/Bodhi Job Engine. These commands communicate directly with the Bodhi Cloud API and some of them communicate indirectly with the Bodhi Job Engine.

##Installation

Bodhi-jobs CLI is included with the Bodhi cli tools. See the Bodhi cli documentation for installation instructions.

##General Usage of Commands

````
> bodhi-jobs <command> [options][arguments ..]

````

##Project Commands


* register
* unregister
* setup
* remove
* schedule
* cancel

###register

This command posts information about the job's npm package to the Bodhi Cloud API, placing it in the JobRegistry type. No arguments are options are needed. When this command is run, the CLI will prompt the user for information about the npm package to register, including the package name, who is registering the package, and a brief description of the purpose of the package. On success, the Bodhi Cloud API will respond with status code 201, indicating that the post to the JobRegistry type was successful.

````
> bodhi-jobs register
````

###unregister


This command (unsurprisingly) is the opposite of register. When a package is no longer needed, the unregister command deletes it's information from the JobRegistry type in the Bodhi Cloud API. On success, the Bodhi Cloud API will respond with status code 204, indicating that the delete was successful.

````
> bodhi-jobs unregister --name [package name]
````


###setup

After registering an npm package, the next step is the setup command, which prompts the user for a name for the job and then posts the job info to the Bodhi Cloud API Job type. On success, the Bodhi Cloud API will respond with status code 201, indicating that the setup info was posted to the Job type successfully.

````
> bodhi-jobs setup --name [package name]
````

###remove

The remove command is roughly the opposite of setup. When a job is no longer needed, running this command deletes the job from the Bodhi Cloud API Job type. It also cancels the job if it is currently running on the Bodhi Job Engine. NOTE: The user specifies the JOB name, not the package name, when running this command. This is the name the user assigned to the job during the setup step. On success, the CLI will indicate that the job was canceled and removed.

````
> bodhi-jobs remove --name [job name]
````
###schedule

The schedule command is used to run the job on the Bodhi Job Engine, either at specific intervals or ASAP. To run a job ASAP, the command looks like this:

````
> bodhi-jobs schedule --name [job name] --now
````

To run a job on a set interval the command looks like this:

````
> bodhi-jobs schedule --name [job name] --repeat '1 hour'
````
The user can specify a time interval in seconds, minutes, hours, or days. The example command will run the job hourly, with the first run beginning roughly 1 hour after the schedule command is executed. This command runs the job every 75 seconds:

````
> bodhi-jobs schedule --name [job name] --repeat '75 seconds'
````
This command runs the job every 30 minutes:

````
> bodhi-jobs schedule --name [job name] --repeat '30 minutes'
````
This command runs the job every 2 days:

````
> bodhi-jobs schedule --name [job name] --repeat '2 days'
````
###cancel

The cancel command is the opposite of the schedule command. It removes the job from the Bodhi Job Engine and sets it to inactive.

````
> bodhi-jobs cancel --name [job name]
````

###available

Lists all the job packages registered with the Bodhi Cloud API and stored in the JobRegistry type.

````
> bodhi-jobs available
````

###list

Lists all the jobs that have been setup in the Bodhi Cloud API and stored in the Job type.

````
> bodhi-jobs list
````

###get

Displays info about a specific job that has been setup in the Bodhi Cloud API and stored in the Job type.

````
> bodhi-jobs get --name [job name]
````

