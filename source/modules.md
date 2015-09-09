---
title: Dexter module creation

search: true

---

# About Dexter modules
## What's a module?

Modules in Dexter are the building blocks you'll use to assemble your Apps.  They're expressions of the principal of doing one thing and doing it well: each is designed to have a single, clear task that works independently of the rest of your code.  It's the job of the App to decide how these behaviors interact - the modules themselves only care about what kind of input they get and emitting consistent output.

<aside class="success">
Modules are just specialized NodeJS libraries with a bit of special sauce in the form of extra metadata, baked-in tests, and an SDK to help speed development.  Most can be used independently of Dexter, and can be incorporated into any other NodeJS / [Browserified](http://browserify.org/) application.
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
1. **package.json**: This is a regular [nodejs package definition](https://docs.npmjs.com/files/package.json).  This lets you use a Dexter module just like you would any other NodeJS package - you can npm install --save to your hearts content, add your module to a public or private NPM server, and otherwise distribute it outside of Dexter.
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
    run: function(step, dexter) {
        //See if we left off from a previous run
        var lastFoo = step.global('lastFoo', null),
            thisFoo = lastFoo || 0,
            foos = step.input('foo');
        this.log('Looked for cached foo: :lastFoo, starting at :thisFoo',
            { lastFoo: lastFoo, thisFoo: thisFoo });
        //Have we gone too far?
        if(thisFoo > foos.length) {
            return this.fail('Not enough foo!');
        }
        //Do our thing
        this.runFoo(foos[thisFoo]);
        thisFoo ++;
        //Are we done yet?
        if(thisFoo === foos.length) {
            return this.succeed();
        }
        //Let's go again!
        dexter.setGlobal('lastFoo', thisFoo);
        this.replay();
    }
}
```

Before dexter modules are run, they're wrapped up by a [BaseModule](#basemodule) class that provides the tools you need to integrate your code into Dexter Apps.

That means if you write a class that exports something like:

`{ getData: fn, run: fn }`

...once it gets inside the Dexter App, it ends up looking like:

`{ getData: fn, run: fn, log: fn, succeed: fn, fail: fn, log: fn }`

This implicit wrapping process lets you focus on the details of your module, and even run your module outside of Dexter without worrying about managing Dexter's dependencies!

<aside class="warning">
If your module exports properties named succeed, fail, log, or run, your module will not work!
</aside>

## Inputs
> Code

```javascript
module.exports = {
    dump: function() {
        console.log.apply(console, arguments);
        console.log('--------');
    },
    run: function(step) {
        var inputs = step.inputs(),
            singleExisting = step.input('singleExisting').first(),
            singleMissing = step.input('singleMissing').first(),
            singleMissingDefaulted = step.input('singleMissingDefaulted', 'singleDefault').first(),
            
            multipleExisting = step.input('multipleExisting').toArray(),
            multipleMissing = step.input('multipleMissing').toArray(),
            multipleMissingDefaulted = step.input('multipleMissingDefaulted', 'multipleDefault').toArray(),
            
            multipleExistingZero = step.input('multipleExisting')[0],
            multipleExistingFirst = step.input('multipleExisting').first(),
            multipleMissingZero = step.input('multipleMissing')[0],
            multipleMissingFirst = step.input('multipleMissing').first();
            
        this.dump(inputs);
        this.dump(singleExisting, singleMissing, singleMissingDefaulted);
        this.dump(multipleExisting, multipleMissing, multipleMissingDefaulted);
        this.dump(multipleExistingZero, multipleExistingFirst, multipleMissingZero, multipleMissingFirst);
    }
};
```

> Result

```javascript
{ singleExisting: 'Foo', multipleExisting: ['Bar', 'Baz'] }
'-------'
{ 'Foo', null, 'singleDefault' }
'-------'
{ ['Bar', 'Baz'], [], ['multipleDefault'] }
'-------'
{ 'Bar', 'Bar', undefined, null }
```

The real power of Dexter lies in its ability to mix and match outputs from a variety of sources in order to provide input data for a given module.  Well designed modules therefore must be able to accommodate as broad a spectrum of inputs as possible.

All module inputs are, under the hood, wrapped up in a single object `{}`.  That object has properties for each input defined in the module's meta.json file `{ input1: null, input2: null}`.  As an app is configured, the user creating the app maps different data sources to each of those inputs `input1 = output1, input2 = output2, {output 1: 1}, {output 2: 2}`.  When the app is executed, those mappings are evaluated, and the results bound to the input object `{input1: 1, input2: 2}`.

The real fun begins when input data is mapped from sources that have multiple outputs `[{output1: 1}, {output1: 2}], {output2: 3}`.  Our input system is flexible, so all the possible inputs get aggregated into our input object `{ input1: [1,2], input2: [3] }`.  It's also possible that some configured mappings will produce no data at all `{ input2: 3 }`.

It's the job of you as the module creator to figure good rules for dealing with this variety of input data.  Is a particular input critical enough to warrant killing an App if it's missing?  How do you deal with misaligned amounts of input?  Which inputs can you only deal with 1 of, and which are safe to handle as arrays?

Inputs can either be accessed directly by extracting them via `step.inputs()`, or wrapping individual inputs in a Dexter [data collection](#data-collections) by calling `step.input(key)`.  You can verify that you have the data you need through any combination of assertions (assertion errors will cause the app to abort), explicit failures (calling `this.fail(...)` lets you give specific reasons for the error), or by providing defaults (calls to `input(key, default)` with a good fallback default value).

## Outputs
> Module 1: User fetcher

```javascript
module.exports = {
    run: function() {
        this.succeed({ email: 'joe@example.com', name: 'Joe' });
    }
};
```

> Module 2: Link fetcher

```javascript
module.exports = {
    run: function() {
        this.succeed([
            { url: 'http://rundexter.com', title: 'Dexter' },
            { url: 'http://reddit.com', title: 'Why my project is late' }
        ]);
    }
};
```

> Module 3: Message

```javascript
//Imports are:
// to = dexter.step('module_1').output('email');
// urls = dexter.step('module_2').output('url');
module.exports = {
    run: function(step) {
        var to = step.input('to'),
            urls = step.input('url');
        console.log(to.toArray(), urls.toArray());
        return this.succeed();
    }
};
//In the log:
// ['joe@example.com'] ['http://rundexter.com', 'http://reddit.com']
```    

In keeping with the theme of doing one thing and doing it well, Dexter assumes all modules will output a single kind of object that reflects its goals.  Does the module get Slack history?  Then the output should look like `{ user, text, link }`.  Does it get a list of stock prices?  The output should look like `{ symbol, name, price, change }`.  You describe what that object looks like in your `meta.json` file: each property of the object gets a record in its "outputs" collection.

That doesn't mean you're restricted to returning a single object.  If your module didn't produce any output, just return nothing.  If it produced multiple data points, return a collection of your output objects.  So long as each object has properties that are recognizable from your `meta.json:outputs` definitions, Dexter will be able to parse the outputs and pass them along as needed.

What you *don't* want to do is to define and return complex object properties.  Dexter's power lies in the ability to map the output from one module to the input of another, and to let the user decide how to make those associations meaningful.  In order for you output to be understood by the widest variety of other modules, each object property should be a basic type (string/numeric good, binary/object bad) and well named (email/url good, o_fsk_n/egweg902 bad).

That doesn't mean you *can't* move around complex objects.  If you're building a pool of apps that perform image manipulation, you should create a series of modules that base64 encode image binaries and moves them around for processing.  If you're doing an AWS automation App, you should have IAM objects as a basic type that your modules understand.  Just know that most other modules won't know what you



## Data collections

Calls to step.input(key, default) and step.output(key, default) return data wrapped up by a Dexter collection, which makes managing an uncertain amount of data easier.

Function|Description
---------|--------
first() | Gets the first item in the collection, or null if the collection is empty
toArray() | Exports the entire collection as a native Array, which will be empty if there's no underlying data
each(callback) | Executes callback against each item in the collection


Property|Description
---------|--------
length | How many items are in the collection
[0...length] | Access the collection like an array, returns `undefined` if the index doesn't exist.

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
# Module functions
## BaseModule
When you create a module, it implicitly extends a Dexter BaseModel before it's run.  The BaseModel provides several functions that are required for your Module to run in a Dexter App.

## BaseModule.run(step, dexter)

Parameter|Type|Description
---------|--------|-----------
step | DexterStep |  Information about how this module should be used
dexter | DexterApp | Global information about the state of the whole App being run

This is the main entry point to your module.  By the time this has been run, Dexter has assembled your inputs based on the user's requirements and made them available to you via `step`.  In case you need some broader context about how things are running, however, you can see the entire data definition for the currently running App via the dexter parameter.

<aside class="warning">
You don't need to run this function yourself - Dexter automatically runs it when necessary!
</aside>

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

If you have any useful information you want to make available to other modules, you'll want to return it here.  Dexter assumes that you're returning an object of some kind, and that the object only has properties that match those you've defined in your [meta.json's output section](#anatomy-of-a-module).  If you've got multiple such objects, that's cool too - just return an array of objects that match your spec instead.  Dexter will still know how get and share data from the list of objects with other modules.

Note that you should only call succeed once, and after you do, the wrapper running the function will quickly shut down, making any code your run afterwards a bit of a gamble.  Calling `return this.succeed()` as shown in the code samples is one way to guarantee that you only make one call and don't cause a race condition afterwards, though you can use careful code flow to do the same if you'd prefer.

<aside class="success">
<p>Your response object properties can technically be *anything* - strings, arrays, objects - pretty much any non-binary, non-stream, non-executable value is fair game!</p>
<p>Keep in mind, however, that a lot of Dexter's power comes from the ability of unrelated modules to be able to communicate with one another.  If you return an object or an array as one of your response object properties, other modules will need to know how to deal with the *specific* object or array you're returning, limiting how useful your module will be.  If you return basic values like strings or numbers, your module will be much more flexible and useful in the Dexter ecosystem.</p>
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

Note that you should only call succeed once, and after you do, the wrapper running the function will quickly shut down, making any code your run afterwards a bit of a gamble.  Calling `return this.fail()` as shown in the code samples is one way to guarantee that you only make one call and don't cause a race condition afterwards, though you can use careful code flow to do the same if you'd prefer.

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
//Shows up in the console as:
// 'Found foo **Object(...)** and bar 42'
//where the foo object is an interactive console object and 42 is a colored number
```

A logger is a programmer's best friend, and the Dexter logger gives you a  ton of power.  Every time you write a log, Dexter saves all the data you provide alongside a snapshot of the App at that point in time.  You can then recall and play back your logs for a particular run of an App as needed.

In its most basic form, you can pass a simple `msg` string into the logger.  Note that this is the exact same as callling `log({ message: msg })`.

If you've got some specific information you want to keep track of, you can pass it along as well.  Our log playback tools will give some special treatment to any `message` property you send along (it'll show it in front of the rest of the logged data in the Dexter console), but it's optional if you don't want it.

The `message` property gets additional special treatment by allowing you to format your log message in a way that takes advantage of the modern browser console.  You can actually embed specific data that you pass along by referencing its key after a colon, allowing you to easily see that data in the browser console.  This is useful if you want to be able to monitor specific logged variables at a glance in the console.

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
There is currently a 50-step limit built into Dexter.  That's more than enough for most Apps, *unless* you're relying heavily on replay to accomplish your goals.  If you think you'll need to replay enough times to worry about that limit, you might want to consider another strategy, like queue and fetch combined with timers.
</aside>

# App data
## dexter
This is the 2nd parameter passed into your module's `run()` function, and represents a high-level view into all that's gone on in your app so far.

It's also the accessor you use to map inputs and add switch cases when wiring up your App - more on that in the App UI section!

## dexter.clone()
```javascript
var d2 = dexter.clone();
d2.setGlobal('test', 1);
assert.notEqual(d2.global('test'), dexter.global('test')
```
Make a deep copy of the entire Dexter structure.  This is mainly useful if you need to pass the structure off to a subprocess and need to ensure that it doesn't make any changes.

## dexter.instance(key, default)
```javascript
var url = 'http://mylogger.example.com/?msg=Hello&from='
    + dexter.instance('instance_id', '(unknown)');
```
Fetch some runtime information about this *instance* of an App.  

Key|Type|Description
---------|--------|-----------
instance_id | string | A unique id for this particular run of the App.  Useful if you want track data on a per-run basis.
active_step | string | The ID of the step that's currently running.  For your modules, this is the same as step.config('id')


## dexter.environment(key, default) 
```javascript
if(!dexter.environment('slack_token')) {
    return this.fail('A slack_token environment variable is required for this module');
}
var slack = new Slack(dexter.environment('slack_token'));
```
Fetch any private App variables that have been registered.

Right now we're in the process of giving you as a module developer a way to communicate to App developers which keys your module requires.  For now, just test for the keys' presence and return an informative message indicating the requirement.

## dexter.user(key, default)
```javascript
var email = step.input(email, dexter.user('email'));
```

Basic information about the user who's running the App

Key|Type|Description
---------|--------|-----------
profile.id | int | The Dexter system ID for the user
profile.email | string | The user's email
profile.image | string | A fully qualified URL pointing to the user's profile image
profile.api_key | string | The API key used by the user to access Dexter services (SMS, SMTP, etc.)


## dexter.workflow(key, default)
```javascript
var log = new ParseLog({ msg: 'Module start', workflow: dexter.workflow('id', '(unknown)') });
log.save();
```

Details about the App itself.  Details about the *instance* of the App being run come from `instance()`.

Key|Type|Description
---------|--------|-----------
id | string | Dexter system ID for the workflow
title | string | User-friendly title 
description | string | Longer description about what the App does

## dexter.url(key, default)
```javascript
var dexterUrl = dexter.url('home');
```

URLs used to access internal Dexter resources.  These are better used through the actual helper functions and modules rather than directly by your modules.

Key|Type|Description
---------|--------|-----------
home | string | Dexter's homepage
logger | string | An endpoint used to track in-App logs
reporter | string | If this workflow is being run on a timer, the App calls back to the reporter to let it know it's done.


## dexter.global(key, default)
```javascript
var cacheKey = step.module('name') + '_cache',
    cache = dexter.global(cacheKey, null);
if(!cache) {
    cache = this.calculate();
    dexter.setGlobal(cacheKey, cache);
}
this.succeed({ data: cache });
```

Fetch globally stored information assigned during the use of this app.  We're not placing any restrictions on how you use this, so you should do so both carefully and sparingly.

Available keys and values are determined by individual modules and will vary from App to App.

## dexter.globals()
```javascript
var globalKeys = Object.keys(dexter.globals()),
    myKey = 'aKeyIWantToUse';
if(globalKeys.indexOf(myKey) !== false) {
    return this.fail('Global key ' + myKey + ' already in use!');
}
```

Get the entire collection of in-use global data in a single object.


## dexter.setGlobal(key, value)
```javascript
var cacheKey = step.module('name') + '_cache',
    cache = dexter.global(cacheKey, null);
if(!cache) {
    cache = this.calculate();
    dexter.setGlobal(cacheKey, cache);
}
this.succeed({ data: cache });
```

An App-wide data store for the entire instance of the app.  This is the ONLY place you can store information explicitly between steps and modules.  We're not placing any restrictions on how you use this, so you should do so both carefully and sparingly.

Any serializeable data can be assigned to a global (string, numeric, object, array, etc.).  Unless you have a good reason not to, it's a good practice to namespace your global variables for your particular module. 

## dexter.step(id)
```javascript
var linkedStep = dexter.step('linked-step', null),
    data = step.input('data', (linkedStep) ? linkedStep.input('data') : null);
return this.complete({ data: this.process(data) });
```

Get a specific step from the workflow.  There shouldn't be any real reason to use this, but if you do, it outputs either an AppStep (the same thing as the 1st parameter to `run()` or null;
    

## step

This is the first parameter passed to your module's `run()` function, and probably the most important.  It contains both the configuration of your step for the current App as well as the data that's been assigned to it.

## step.clone()
```javascript
var stepClone = step.clone();
```

Make a deep copy of the entire step.  Possibly useful for handing off to other applications or libraries if you're concerned they might modify the data.

## step.config(key, default)
```javascript
var stepId = step.config('id'),
    instanceId = dexter.instance('id'),
    storageKey = instanceId + '.' + stepId;
var record = new ParseLog({ msg: 'Module start', src: storageKey });
log.save();
```

Fetch configuration information about this module at its current spot in the workflow.

Key|Type|Description
---------|--------|-----------
id | string | A unique ID for the step (related to but not guaranteed to be the same as the module name)
next | object | An collection of information about the possible next steps after this one
title | string | A human-friendly name for the step
type | string | What kid of step it is - currently either 'trigger' or 'module'
type_name | string | The specific step type, based on type.  For modules, this is the module name.

## step.prev()
```javascript
var prev = step.prev();
if(prev.module('name') === 'foo') {
    return this.fail('Cannot run foo before bar.  That would be inconceivable.');
}

Get the step that ran before this one.

## step.trigger()
```javascript
var trigger = step.trigger();
if(trigger.config('type_name') == 'timer' && this.lastRan() > moment().subtract(1, 'hours')) {
    return dexter.global('my_cache');
} else {
    return this.liveData();
}
```

Get the trigger step upstream from this step.

## step.module(key, default)
```javascript
var name = step.module('package.name', '(unknown)')
    , title = step.module('meta.title', '(unknown)')
    , text = 'Run from ' + title + ' (' + name + ')';
var record = new ParseLog({ msg: text });
```

Gets information about the module associated with the step.

Key|Type|Description
---------|--------|-----------
git_url | string | A fully-qualified URL to the primary git repository for this module
is_global | integer | "1" if this is a Dexter module, "0" if this is a user module
meta.* | misc | Access to any of the data in the module's meta.json file
package.* | misc | Access to any of the data in the module's package.json file
name | string | Shortcut for "package.name"
title | string | Shortcut for "package.title"
type | string | Either "global" for Dexter modules or "user" for user modules.
created_at | string | Date when the module was first made
updated_at | string | Date when the module was last updated in Dexter
user_id | int | User ID of the module's maintainer

<aside class="warning">
Note that for trigger steps, these values will always return the default, as triggers have no modules.
</aside>

## step.input(key, default)
```javascript
var email = step.input('email', 'default@example.com').first(),
    messages = step.input('message'),
    message = messages.toArray().join('<br>');
this.queueEmail(email, 'You have messages', message);
return this.succeed();
```

Fetch an input bound to this step in the App editor.

Unlike most other functions

## step.inputs()
## step.output(key, default)
## step.outputs()
## collection
## collection.first()
## collection.toArray()
## collection.each()