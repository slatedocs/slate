---
title: Dexter module creation

search: true

---

# About Dexter modules
## What's a module?

Modules in Dexter are the building blocks you'll use to assemble your Apps.  Modules are expressions of the principal of doing one thing and doing it well: each is an isolated behavior designed to operate independantly of any other behavior.  It's the job of the App to decide how these behaviors interact - the modules themselves don't care.

<aside class="success">
Modules are essentially specialized NodeJS libraries with a bit of special sauce in the form of detailed metadata, baked-in tests, and an SDK to help speed development.  Most should be able to be used as a library in any other NodeJS application!
</aside>

## Anatomy of a module
> index.js

```javascript
module.exports = {
    run: function(dexter, context) {
        context.succeed();
    }
};
```
> package.json

```json
{
  "name": "my_dexter_module",
  "description": "A minimal example Dexter module",
  "version": "0.0.1"
}
```
> meta.json

```json
{
    "title": "My Dexter Module",
    "icon": "heart",
    "max_inputs": 1,
    "inputs": [
        { "id": "url", "title": "Page URL", "type": "string" },
        { "id": "term", "title": "Search term", "type": "string" }
    ],
    "outputs": [
        { "id": "links", "title": "Found links", "type": "string" }
    ]
}
```

Only 3 files are mandatory for a Dexter module:

1. **index.js**: This is the main touchpoint for your application.  At a minimum, it needs to export a single function "run(dexter, context)" and call "context.succeed()".  It takes 2 parameters: "dexter", which is a bundle of data regarding the current workflow, and "context", which is used for flow control.  "dexter" is a powerful data access tool which you can read about [here](todo), while context has 2 simple functions:
    * **succeed(data)**: Pass an object with your outputs to make that output available to the rest of the workflow
    * **fail(error)**: Pass either a string or an Error to indicate that the process failed

1. **package.json**: This is a regular nodejs package definition.  You can npm install --save to your hearts content!

1. **meta.json**: Special definitions used by Dexter are stored here.
    * **title (string, required)**: The user-friendly title of your module
    * **icon (string, optional)**: A [FontAwesome icon](http://fortawesome.github.io/Font-Awesome/cheatsheet/) that will show up alongside your module in the App editor.
    * **max_inputs (integer, optional, default 1)**: How many inputs your module will accept.  Dexter will never give you more data than you're able to handle.
    * **inputs (array, optional)**: Definitions for any inputs your module accepts.  Each item in the array should have 3 properties:
        * *id (string)*: The input's code-friendly key (ex: first_name)
        * *title (string)*: The input's user-friendly name (ex: First Name)
        * *type (string)*: A basic type (string, integer, array)
    * **outputs (array, optional)**: Definitions for any outputs your module generates.  Just like inputs, each object in the array has 3 properties:
        * *id (string)*: The input's code-friendly key (ex: first_name)
        * *title (string)*: The input's user-friendly name (ex: First Name)
        * *type (string)*: A basic type (string, integer, array)

## Types of modules

There are three types of modules in Dexter:

### Core modules

Core modules are meta-modules that exist only to guide and modify the flow of data through an App.  They tend to have special behaviors and features that other modules lack or shouldn't have to care about.

### Dexter modules

These are the Dexter-blessed, built-in tools of the Dexter app ecosystem.  They're available to every power user and developer in Dexter, and cover a broad range of behaviors.

### User modules

User modules are modules you've made for your own apps.  You build them with the same tools we've used to build the vast library of Dexter modules, and you can use them the same in the App editor.  The only difference between User modules and Dexter modules lies in distribution: only *you* can use your user modules.

# Tutorial: RSS Filter
## Create the module
> Creating the module
```shell
dexter create "`whoami`_rssfilter"
```

We'll start by creating a new module.  First, make sure you've [set up the SDK tools](sdk.html) - you should be able to run:

`dexter list_keys`

and see your machine's public key on the list.

After that, you can use the dexter CLI tool to create your program.  Namespacing your program using your name is a good idea - right now all Dexter user modules share a namespace, so collisions can be a problem.

After you've done that, you'll want to give your module a friendly name - this goes in the module's meta.json file



## Basic programming
## Isolate inputs
## Create fixtures
## Test
## Deploy
# Best Practices
# Module API
## module.init()
## module.run(dexter, context)
# Data API
## dexter
## dexter.clone()
## dexter.instance(key, fallback)
## dexter.environment(key, fallback) 
## dexter.user(key, fallback)
## dexter.workflow(key, fallback)
## dexter.url(key, fallback)
## dexter.private(key, fallback)
## dexter.global(key, fallback)
## dexter.globals()
## dexter.step(id)
## dexter.data(id)
## step
## step.clone()
## step.config(key, fallback)
## step.prev()
## step.trigger()
## step.module()
## step.input(key, fallback)
## step.inputs()
## step.inputMap(fn)
## step.output(key, fallback)
## step.outputs()
## step.outputMap(fn)
