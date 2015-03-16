#### Extending the Agent

###Concept
An Extension is an Object that adds on reusable configuration elements. These configuration elements are call plugins. An extension may provide one or more plugins to the agent or an application. Plugins are used to build runtime components (Sources, Services, Pipelines, Handlers, etc). Extensions are meant to be small reusable chuncks of code that follow in the tradition of Node Modules but conform to a specific interface so they can be loaded by node.js an the agent.

###Specification

An extension must be formally specified in an app or agent configuration file.

###Spec Rules
* An Extension specification MUST include a module or a file key
* A module and file attributes are mutually exclusive
* An Extension specification MAY include (configuration) options

````
extensions: [     
  { module : 'module-id', options : {enabled : true, silent: true}},
  { file   : './path/to/file', options : {env : debug}},
],
````
__Notes on the module id__

Module and file really do the same thing. They are both included for semantic reasons. In general, they are used as follows:

 * module indicates this is a packaged module resolves using the node module algorithm living (most likely) in the node_modules folder of the agent or app directory.
 * file points at a at a JS file that exports a proper extension interface, the root directory of a CommonJS package (the directory containing the package.json

###Options

An extension may receive options at attachment time. Options provide a means for declaring environment specific configuration data to the extension. 

__Note__: Options are not resolved so they SHOULD NOT include references.

###Resolution Rules

* A file path is resolved relative to the specifying containers home directory
* A module or file path that points at a CommonJS package will use the main file or index.js as the extension entry point

For complete detailed information check out the [nodejs docs](http://nodejs.org/api/modules.html) 

###Visibility Rules

* If the extension is loaded by the agent then the agent and all applications can use the extensions plugins. 
* If the extension is declared by the app then only the app can use the extension's plugins.
* If the extension is declared by both the app and the agent the app will use the plugins provided by the extension declared by the app.

###Implementation
* An Extension MUST declare a name
* An Extension SHOULD declare a version
* An Extension MAY declare a description
* An Extension MAY declare a provider
* An Extension MUST be either and object of a function that produces an object
* An Extension MUST expose a method named attach that takes a call callback

###Prototypical Extension

````
module.exports = {
	
	name    : 'my-extension',
	version : 'major.minor.patch',
	provider: 'my organization',
 
	attach: function(options, callback){
        }	
}
````

###Prototypical Extension Module

````
module.extension = function(){
        'use strict';
	return {
		... prototypical extension
	}
}
````

###Binding Mechanism

The attach method adds plugins to a particular container

###Attach Signature

````
attach(options, function(err))
````

argument | type     | required | description
-------- | ------   | ---------| -----------
options  | object   | optional | provides the env specific configurations
callback | function | required | provides a way of returning an runtime error to the container

Callback takes the form of cb(err). The callback MUST be called.

###Context

The value of `this` provides the mechanism for adding plugins to the container. `this` provides the following binding method:

````
this.registerPlugin(namespace, plugin)
`````

argument | type               | required | description
-------- | ------             | ---------| -----------
namespace| string, array      | required | unique naming
plugin   | object or function | required | provides a way of returning an runtime error to the container

###Prototypical Attachment

````
   attach: function(options, callback){
	var container = this;
	try{
             container.registerPlugin(namespace, object)
       	     container.registerPlugin([ns, ns, ns], object)
       	     callback && callback()
	} catch (err){
	     callback && callback(err)
	}
   }	
````
