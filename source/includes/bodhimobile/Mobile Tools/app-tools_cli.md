####app-tools
app-tools is a command line tool, bundled with bodhi-cli, that allows app developers to quickly generate
an app and publish it to the cloud so that it can be viewed on the mobile container.

### Local Commands

### App Creation Commands

### new-app

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

### Profile Action Options

long      | meaning
----      | -------
select    | select action allowed on type
update    | update action allowed on type
delete    | delete action allowed on type
insert    | insert action allowed on type
aggregate | aggregate action allowed on type


### view-profile-def

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

### add-type-to-profile

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

### remove-type-from-profile

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

### edit-title

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

### view-title

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

### edit-description

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

### view-description

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

### edit-version

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

### view-version

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

### Remote Commands

### App Publishing Commands

### publish-app

Publishes the app to the namespace specified by the environment. This command must be run in the app folder.

Notes:

* Publish-ready app files must be located in a /www folder in the root of the app directory so that the publish-app command can zip it up and send it to the cloud.
* Need to have version, name, profile, and title specified in the package.json when publishing (use the app metadata commands and profile commands above to do this).
* LICENSE, index.html, and package.json are required and must be located in the root of the app directory.
* Only users with the admin profile are allowed to publish apps.
* Max zip file size is 20mb.
* Max number of files is 1024.
* On publish, the cloud creates the profile specified by the package.json's profile definition and then assigns the profile to the developer who published the app.

Within an application's package.json file, there is a settings object which contains valuable metadata about the application which the Global App Store and mobile container use to properly display the application.



### Package.json -- General Info

Use the settings JSON object to communicate the meta data about an app. See definitions below:

**offline=true/false**  
Offline controls whether the container will cache application information for offline use. If offline=true and the user launches the application, any data that was previously loaded will be available when the device is offline. This will also enable queuing of data to write to the Bodhi Cloud if the app has write permissions.

**single_container_app=true/false**  
single_container_app the container know whether the app should be displayed with a menu (a collection of apps) or as a standalone single app.
Bodhi Mobile has single_container_app = false. Bodhi Reveal has single_container_app = true

**hide_from_global_store=true/false**  
hide_from_global_store controls whether the app is available to the general public to see in the global app store. Apps like Settings which cannot be removed should have hide_from_global_store=true

**new_type_required=true/false**  
new_type_required tells the installer of the app in the global app store if the app will run 'out of the box' or if new custom types need to be installed on the namespace.
NOTE:: if new_type_required=true, troubleshooting_url should be required

**troubleshooting_url='http://tools.bodhi.space/xxxx'**  
The troubleshooting_url is the URL where the customer can find additional information about how to install custom types on their namespace to get an app to function correctly. This can also be used to FAQ's or any other outbound troubleshooting you would like to provide to your customers.

**categories { }**  
The categories array allows you to give the Bodhi app store taxonomical information about how your app relates to other applications. 
Examples include financial, inventory, mangegement

**global_store_icon='/xxx/xxx.png'**  
The global_store_icon is the icon that the Global App Store will use for display purposes. This file should be included in the app folder that is published via app tools.

**screenshots{ }** 
The screenshots array contains relative paths to screenshots which the Global App Store will use for display purposes. This files should be included in the app folder that is published via app tools.


##### Signature

```
> app-tools publish-app [env-options]
```

##### Arguments

None.

##### Options

See environment options above.

##### Return

Message stating the app has been published, profile has been created and assigned to the developer who published it.

### Informational Commands

Get data about the deployed app from the cloud.

### list-apps

This command lists all the apps that you can see in your specified environment that are currently deployed in the cloud.

##### Signature

```
> app-tools list-apps [env-options]
```

##### Arguments

None.

##### Options

See environment options above.

##### Return

A list of apps currently in the cloud. Each app entry will show its meta data.

### get-profile

This command shows the profile that is associated with your deployed app. This command must be run in the app folder.

##### Signature

```
$> app-tools get-profile [env-option]
```
##### Arguments

None.

##### Options

See environment options above.

##### Return

The profile the deployed app is currently associated with.

### Profile Commands

Remote commands dealing with the profile associated with the deployed app.

##### assign-profile-to-user

Assign the deployed app's profile to an existing user in the cloud. This command must be run in the app folder.

##### Signature

```
> app-tools assign-profile-to-user <username> [env-options]
```

##### Arguments

1. username

##### Options

See environment options above.

##### Return

The user definition.