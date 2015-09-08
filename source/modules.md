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
    run: function(step, dexter) {
        this.succeed();
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

1. **index.js**: This is the main touchpoint for your application.  At a minimum, it needs to export a single function "run(step, dexter)" and call "this.succeed()".  We'll go into more detail about this later on.
1. **package.json**: This is a regular [nodejs package definition](https://docs.npmjs.com/files/package.json).  You can npm install --save to your hearts content, add your module to a public or private NPM server, or do anything else you would with a normal  nodejs package.
1. **meta.json**: Special definitions used by Dexter are stored here.
    * **title (string, required)**: The user-friendly title of your module
    * **icon (string, optional)**: A [FontAwesome icon](http://fortawesome.github.io/Font-Awesome/cheatsheet/) that will show up alongside your module in the App editor.
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

# The guts of a Dexter module
```javascript
module.exports = {
    run: function(step, module) {
        var lastFoo = step.global('lastFoo', null);
        this.log('Trying to foo a bar', { lastFoo: lastFoo });
        try {
            var foos = foo.bar(lastFoo); //automatically fails
            if(foos == 1) {
                this.succeed({ message: 'Foo successfully barred' });
                dexter.setGlobal('lastFoo', null);
            } else {
                dexter.setGlobal('lastFoo', foos);
                this.replay();
            }
        } catch(e) {
            this.fail(e);
        }
    }
}
```

Before dexter modules are run, they're wrapped up by a BaseModule class that provides the tools you need to integrate your code into Dexter Apps.

That means if you write a class that exports something like:

    { getData: fn, run: fn }

...once it gets inside the Dexter App, it ends up looking like:

    { getData: fn, run: fn, log: fn, succeed: fn, fail: fn, log: fn }

This implicit wrapping process lets you focus on the details of your module, and even run your module outside of Dexter without worrying about managing Dexter's dependencies!

<aside class="warning">
If your module exports properties named succeed, fail, log, or run, your module will not work!
</aside>

Let's take a look at the code this wrapper provides:

## BaseModule.run(step, dexter)

Parameter|Type|Description
---------|--------|-----------
step | DexterStep |  Information about how this module should be used
dexter | DexterApp | Global information about the state of the whole App being run

This is the main entry point to your module.  By the time this has been run, Dexter has assembled your inputs based on the user's requirements and made them available to you via `step`.  In case you need some broader context about how things are running, however, you can see the entire data definition for the currently running App via the dexter parameter.

Note there aren't many good reasons for you to run this function yourself - Dexter will automatically run this function when necessary.

## BaseModule.succeed(data)
> No output

```javascript
return this.succeed();
```

> Single output

```javascript
return this.succeed({ foo: 'Foo', bar: 'Bar' });
```

> Multiple outputs

```javascript
return this.succeed([
    { foo: 'Foo', bar: 'Bar' },
    { foo: 'Baz', bar: null }
]);
```

Parameter|Type|Description
---------|--------|-----------
data | array,object | An object containing your outputs, or an array of objects containing your outputs if necessary

When your module has successfully finished its job, it needs to call `succeed()` to let Dexter know it's safe to continue the current App.

If you have any useful information you want to make available to other modules, you'll want to return it here.  Dexter assumes that you're returning an object of some kind, and that the object only has properties that match those you've defined in meta.json.  If you've got multiple such objects, that's cool too - just return an array of objects instead.  Dexter will still know how get and share data from the list of objects with other modules.

Note that you should only call succeed once, and after you do, the wrapper running the function will quickly shut down.  Calling `return this.succeed()` as shown in the code samples is one way to guarantee a single call, though you can use careful code flow to do the same if you'd prefer.

<aside class="success">
Your response object properties can technically be *anything* - strings, arrays, objects - pretty much anything but streams and functions are fair game!
<br>
Keep in mind, however, that a lot of Dexter's power comes from the ability of unrelated modules to be able to communicate with one another.  If you return an object or an array as one of your response object properties, other modules will need to know how to deal with the *specific* object or array you're returning, limiting how useful your module will be.  If you return basic values like strings or numbers, your module will be much more flexible in the Dexter ecosystem.
</aside>

## BaseModule.fail(details)
> Simple error

```javascript
return this.fail('Something bad  happened');
```

> Detailed error

```javascript
return this.fail({ message: 'Something bad happened', badthing: { foo: 'bar' }});
```

> Error forwarding

```javascript
try {
  foo.bar();
} catch(e) {
  return this.fail(e);
}
```

Parameter|Type|Description
---------|--------|-----------
error | string,Error,object | Details about what went wrong

When something goes badly wrong, fail lets Dexter know to abort the app.

Every call to fail() automatically gets logged, and if you pass an error as the first argument, its stack will be captured if possible.

Note that you should only call fail once, and after you do, the wrapper running the function will quickly shut down.  Calling `return this.fail()` as shown in the code samples is one way to guarantee a single call, though you can use careful code flow to do the same if you'd prefer.  

## BaseModule.log(details)
> Simple log

```javascript
this.log('Querying Foo...');
```

> Detailed log

```javascript
this.log({ message: 'Back from foo', foo: foo.results() });
```

> Formatted log

```javascript
this.log({ message: 'Found foo :foo and bar :bar', foo: foo.results(), bar: 42 });
//Shows up in the console as 'Found foo **Object(...)** and bar 42', where the foo object is an interactive console object and 42 is a colored number
```

A logger is a programmer's best friend, and the Dexter logger gives you a  ton of power.  Every time you write a log, Dexter saves all the data you provide alongside a snapshot of the App at that point in time.  You can then recall and play back your logs for a particular run of an App as needed.

In its most basic form, you can pass a simple `msg` into the logger.  Note that this is the exact same as callling `log({ message: msg })`.

If you've got some specific information you want to keep track of, you can pass it along as well.  Our log playback tools will give some special treatment to any `message` property you send along, but it's optional if you don't think you want it.

The `message` property gets additional special treatment by allowing you to format your log message in a way that takes advantage of the modern browser console.  You can actually embed specific data that you pass along by referencing its key after a colon, allowing you to easily see that data in the browser console.  This is useful if you want to be able to monitor specific logged variables at a glance.

## BaseModule.replay()
```javascript
var lastIndexKey = step.config('id') + '_lastIndex',
    lastIndex = dexter.global(lastIndexKey, 0),
    data = step.input('data'),
    loopTo = lastIndex + 5,
    i;
if(loopTo > data.length) loopTo = data.length;
for(i = lastIndex; i < loopTo; i ++) {
    this.processData(data[i]);
}
if(loopTo === data.length) {
    this.succeed();
} else {
    dexter.setGlobal('lastIndex', loopTo);
    this.replay();
}
```

One of the downsides of working with APIs is that many of them have limits on how often you can use them.  If you're using such a stingy API,  you need to be aware of how much data you can actually handle in a 60s long Dexter module.

Replay is the tool to use if this occurs.  Calling replay will rerun the current module with the exact same inputs it was originally given.  By using the App's global state management tools, your module can keep running until it finishes what it set out to do.

Some other scenarios where replay might be useful:
* Waiting for an API endpoint to become available
* Waiting for slowly updated data to change
* Waiting for scarce resources to free up

<aside class="warning">
There is currently a 50-step limit built into Dexter.  That's more than enough for most Apps, *unless* you're relying heaviliy on replay to accomplish your goals.  If you think you'll need to replay enough times to worry about that limit, you might want to consider another strategy, like queue and fetch combined with timers.
</aside>

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
```node
var requests = require('request')
    , Q = require('q');
module.exports = {
    fetch: function(url) {
        return Q.promise(function(resolve, reject) {
            var request = requests.get(url);
            request.on('success', function(response, stream) {
                resolve({ url: url, stream: stream });
            });
            request.on('error', reject);
            request.run();
        });
    },   
    parse: function(stream) {
        return Q.promise(function(resolve, reject) {
            var parser = require('')
                , items = [];
            parser.load(stream);
            parser.on('item', function(item) {
                items.push(item);
            });
            parser.on('complete', function() {
                resolve(items);
            });
        });
    },
    bundle: function(items) {
        var returnVal = [];
        items.each(function(item) {
            returnVal.push({ title: item.title(), url: item.url() });
        });
        this.complete(returnVal);
    },
    run: function(dexter) {
        var urls = dexter.step().input('url')
            , fetchers = []
            , self = this;
        urls.each(function(url) {
            fetchers.push(self.fetch(url));
        });
        Q.all(fetchers).then(function(results) {
            var parsers = [];
            results.each(function(result) {
                var url = result.url
                    , stream = result.stream
                    ;
                parsers.push(self.stream);
            });
            return Q.all(parsers);            
        })
        .then(function(results) {
            var bundlers = [];
            results.each(function(result) {
                var titl            
        })
        .fail(this.fail);
    }
};
```

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
