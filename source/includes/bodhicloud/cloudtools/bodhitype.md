
#### Bodhi.Type

##### Introduction
Bodhi.Type is a user interface developed by the Bodhi team to allow customers to view their current data types on the cloud. The tool also allows for users to build new types and extend existing types using a user friendly interface that reads and writes to and from the Bodhi Cloud.

Bodhi.Type is available to all users to view and interact with their data on a specific namespace

##### Getting started

Bodhi.Type is currently available in beta as an OS X [download](https://drive.google.com/file/d/0Bz2KGejeubT9alF5NGNlYzRvZEE/view) .

##### Intended Audience

Bodhi.Type is intended to be a complement to the existing Bodhi CLI. 

##### Steps / tutorial to install (or Using the app)

Download the Bodhi.Type application. Double click on the Bodhi.Type icon to launch the app, or drag into the Applications folder to make the app available via the Launchpad.

##### Using this software

Follow screen prompts to Authenticate via the Preferences menu on the top of your screen. Once authenticated, you should have access to all of the types in your namespace via the left side navigation bar. 

Selecting a type will allow you to inspect the properties of that type. 

![Type Selection](../../images/Bodhi.Type_1.png)

By using the download button, users can download the type as a JSON file.

![Download JSON](../../images/Bodhi.Type_2.png)

By clicking the inspect button, users can be taken to the full API documentation for that type.

![Inspect Type](../../images/Bodhi.Type_3.png)

Users can edit the type by making changes to the types' properties, or adding new properties. 

![Editing Type](../../images/Bodhi.Type_4.png)

When they have completed their changes, users can click the 'Publish' button, which will then take them to a screen showing a JSON representation of their edits. Users will be notified whether their request succeeds or experiences errors before returning to the Type page.

![Publishing Type](../../images/Bodhi.Type_5.png)

Users can also create new types by clicking the New Type button on the topbar. 

![Type Creation](../../images/Bodhi.Type_6.png)


This will take them to the type creation page, a blank form where they can add the name of their new type, select whether or not it is an embedded type or an independent type, and create properties for that type. By clicking the Publish button, they can review their proposed new type, and be notified of the success of their request.

Newly created types should be instantly accessibly via the side navigation bar. Users can then edit or delete the type using the Publish or Delete buttons.

![Type Deletion](../../images/Bodhi.Type_7.png)

##### Future Releases

Future releases should add Windows support, as well as additional options for type creation and modification.