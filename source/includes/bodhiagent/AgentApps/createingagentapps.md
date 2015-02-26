#### Creating an App

###Agent App Structure

You can create an application for the agent by following the steps below. 

App Structure

Apps have 9 major categories:

* Descriptive Information
* Logger Settings
* App Settings
* Extensions
* Services
* Sources
* Pipelines
* Handlers
* The init function

These categories are described below. 

### Starting Structure
1. Create a file called app.js.
2. Insert the following code into the app.js file.

````
  //- Descriptive Information
  name   : 'app-name',
  version: '0.0.1',
  
  //- Logger Settings
  logger : {
    filename: 'logger-filename.log',
    level   : '' // The level of logging for the app
  },
  
  //- App Settings
  settings: [
    {property  : '',
     value     : ''},
  ],
  
  //- Extensions
  extensions: [
    {file      : ''}
  ],
  
  //- Services
  services: [
  	{
  	 name     : '',
  	 provider : '',
  	} 
  ],

  //- Sources
  sources: [
    { 
    name   : '',
    factory: '',
    provider: {
        bind: '',
        listen : '',
        close  : ''
      },
      bindings: {'eventName'}
    }
  ],
  
  //- Pipelines
  pipelines: [
    {
      name: 'name-of-pipeline',
      subscriptions: ['name-of-event-that-the-pipeline-subscribes-to'],
      steps: [
        {fn: 'extension:name-of-function', props: {key: 'value'},
        {fn: 'extension:name-of-function', props: {key: 'value'},
      ]
    }
  ],

  //- Handlers
  handlers: [
  	name: 'name-of-handler',
  	subscriptions: 'name-of-event-the-handler-subscribes-to',
  	fn: '',
  	props: { name: '$key:value' }

  ],

  //- init function, this function is executed after the agent is done with setup
  init: function(done) {
    // statements here
    done();
  }
  
}
````

### 1. Descriptive Info
This contains identification information for your app.

##### Sample
````
  name   : 'app-name',
  version: '0.0.1',
  dir    : '',
  enabled: 

````

Property | Type | Required |   Description | 
------| --------- | ------ | -------------
name | string | Yes   | Your name for the application | 
version | string | Yes	   | The version number for the application
dir | string | Yes | Root filesystem path for the application
enabled | Boolean | Preferred | Whether the app is enabled or not
provider | string | Preferred | Your organization's name


### 2. Logger Info

These properties determine the log filename and amount of detail that would be recorded to the log file. 

The levels of logging are as follows, listed from the least amount of detail to the most.

1. error
2. warning
3. info
4. verbose
5. debug

Note: The logger cannot include a reference to the settings, since it is loaded prior to the settings.

#####Sample
Property | Type | Required | Description | 
------| --------- | ------ | -------------
level | string | Yes   | Your name for the application | 
version | string | Yes	   | The version number for the application



###3. App Settings

Your app can have settings by declaring them within the settings object. These settings can then be used throughout your application's code. These values will take the highest precedence in the processing of settings. The precedence rules are:

1. App.js settings object (highest precedence)
2. Any settings within the js/json files in the settings folder
3. Any settings added by an extension (lowest precedence)


#####Sample
````
[ {property: 'keys:consumerKey', value: 'wWbo8MBQ0nQ' },
  {property: 'rootPath', value: path.join(process.cwd(), 'input') }]
````

Property | Type | Required | Description | 
------| --------- | ------ | -------------
property | string | Yes   | Your name for your property| 
value | string, function, Boolean, number, object | Yes	   | The value of your setting



###4. Extensions
Your application may use one or more extensions. Extensions can provide potential configuration components or actual runtime components. Extensions are a good way to design resuable components that can be shared and reused across projects. 


#####Sample
````
extensions: [ file: {}]
````

Extensions are loaded in the order in which they are specified. 

###5. Services
Your app can contain a service. A service is an object that represents a concrete extension of the API.

#####Sample
````
[ { name: 'keys:consumerKey', value: 'wWbo8MBQ0nQ' },
  {property: 'rootPath', value: path.join(process.cwd(), 'input') }]
````
#####Specification
Property | Type | Required |   Description | 
------| --------- | ------ | -------------
name | string | Yes   | Your name of your service | 
provider | string | Yes	   | A function or reference to a plugin that creates an object
args | array of strings, functions, objects, booleans | Optional | a list of the dependencies used by the service
factory | string (constructor, function, literal)| Optional | An enumeration that describes alternate instantiation behavior for the service

#####Implicit Properties
Name | Description |
------| ---------
this.name | the name of the service
this.logger | A reference to the context's logger
this.publish | a handle to publish a message to the context


###6. Sources
A source is an object that sources external events. By creating a source, you can bind events to listeners and start functions and pipelines once the events have been emitted.

#####Sample
````
[ {
   name: 'sampleSource',
   provider: 'compris:dir',
   args: ['$settings:rootPath'],
   bindings: { 'created' : 'read' }
   } ]
```` 
#####Specification
Property | Type | Required |   Description | 
------| --------- | ------ | -------------
name | string | Yes   | Your name of your service | 
provider | string | Yes	   | A function or reference to a plugin that creates an object
args | array of strings, functions, objects, booleans | Optional | a list of the dependencies used by the service
factory | string (constructor, function, literal)| Optional | An enumeration that describes alternate instantiation behavior for the service
