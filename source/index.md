---
title: Welcome to Dexter

search: false

---
# Getting Started

Dexter is a platform that makes it easy for developers to connect third-party APIs and build apps that automate your digital life. Everyday we use a handful of tools that do one thing and do it well, whether that’s ordering lunch or messaging the office a meme. However, more complex tasks require a combination of different solutions. Dexter is here to simplify connecting these services. With Dexter, you can connect the web the way you want.

## Hello World

To get started you need a Dexter account. Dexter is currently in private beta so you'll need an invite code. If you don't have one you can request one at [rundexter.com](https://rundexter.com/#section-6). Once you have an account, sign up and take the walkthrough to build your first app. 

## Detailed Walkthrough

The walkthrough gives you the basic instructions as you click through, but here's some more info in case you get stuck, confused, or just want to know more: 

1. **Create a New App** - Dexter is both for builders and consumers. We start with the building. Click the new app button on the top right of your screen. 

1. **Name Your App** - The tutorial autopopulates the title and description field with the details of the app we're going to build: a <a href="http://www.google.com/search?q=define:bookmarklet" target="_blank">bookmarklet</a> that sends the url of the website on your desktop screen to your mobile phone via text message so that you can take it with you on the road!

1. **Place Your First Trigger** - A trigger step is simply a way for the outside world to communicate with a Dexter app and kickoff some data processing. In this tutorial the trigger is the bookmarklet since it's going to let us know when you want your text message. The way we notify the workflow about a trigger is to drag it onto the light gray bar at the top of the canvas. That's our trigger bar! 

1. **Place Your First Module** - A module does the heavy lifting. It takes the data from the previous step(s) -- in this case the bookmarklet -- and acts on it. For our first app we want to send ourselves a text message. How is that done? Well by dragging the Dexter SMS module onto the canvas and dragging the orange outlet on the bookmarklet to the input of the Dexter SMS step. 

1. **Connect The Data** - The last step is telling Dexter how the data moves in between steps. To do this, we click the configure button and bring up the configure panel. Does this panel remind you of the back of your VCR? Good, that's what we meant to do. Each module has outputs and inputs. In this case the bookmarklet module outputs the URL of the page you're on. The Dexter SMS module accepts a phone number and a message. In order to tell the Dexter app that we want to send the URL from the bookmarklet step to the dexter sms step, we connect them. And that's it you're done! There are a few details we're leaving out and for the uber curious, here they are: 

  1. You'll notice that the phone number input on the Dexter SMS module is filled in. That's because it's in *user* mode, denoted by the radio buttons on the right panel. That means that the user will have to enter it when they subscribe to your app. If you always wanted to receive the message yourself, regardless of who clicked the button, you could put the input into text mode by clicking on the `A` radio button. Then you can type in your phone number. User mode will get a little clearer when we get to the use page. The little hand denotes 'map' mode which is how we mapped the URL to the Message field. 

  1. The left panel shows all the data you can grab. In this simplistic example we only have the data from the bookmarklet available, but as you add more steps to your apps you'll get to toggle where the source data is coming from. 

1. **Use Your App** - Click the Use App button on the main nav and you'll get taken to your share page. This page is publically accessible and anyone can use your app, but you're the only one with the rights to edit it. Let's test it out. Click the Use This App button. Remember how we put the Phone Number into "user" mode, well, as a result, the wizard prompts us for our phone number. Go ahead and enter your phone number and hit finish. Once that's done, you'll see some new usage instructions for your app. Remember that bookmarklet that you dragged onto the canvas? Well, Dexter knows to generate a unique bookmarklet for every user and give them instructions to drag it onto their bookmarklet bar. Once you've dragged the button to your bookmarklet bar, give it a click - you should get a text message with a link to the page that you're on! 

Congratulations on building your first app! You've just scratched the surface, want more? Read On! 

# What Is A Dexter App?

An app is simply a collection of JavaScript modules arranged in a meaningful way on the editor canvas. When we drag a module onto the canvas, we say that we are instantiating that module or forming a step in the application. 


## Steps

Steps are arranged by connecting one step to the next in the sequential order that data should be processed. In Dexter terms, we call This sequence a stream, which we cover in greater detail in the next section. 

There is one special step, called a **trigger step**. A trigger step is simply a way for the outside world to communicate with a Dexter app and kickoff some data processing. In its simplest form it is a URL that any external app can access via a `POST` request with arbitrary data that initiates the request. Dexter has some common triggers built-in (and we will add more regularly). Still, for any custom needs, you can always use the webhook trigger to pass in any type of data that you like. 

## Streams
A stream begins with a trigger step and is followed by one or more process steps. A stream does not have any formal termination point, but an execution of any given stream will complete when there are no more steps left. An app can have multiple streams.

## Module Types

There are three types of modules in Dexter:

<ol>
    <li>

<strong>Core modules</strong>

<br/>

Core modules are special. There are some cases where the simplistic behavior of modules presents a challenge to building a fully featured app. So we have carved out a space to deliver some magical methods to you. These will continue to expand, but here is what is available now: 

<br/>
<br/>

Queue - Sometimes while building a Dexter app you want to collect information that you're not ready to act on yet. Let's say you want to store a bunch of URLs from the bookmarklet trigger, but you don't want to do anything with them until a timer trigger is activated later. The queue step lets you stash that data for later use via the fetch step. The queue step takes a single parameter, "class_name", which is the name that you'll reference in your fetch step.  

<br/>
<br/>

Fetch - The fetch module is queues partner, it takes one parameter, "class_name", which tells Dexter which queued up data you want to retrieve. After a fetch step is executed all downstream steps will have access to the steps upstream of a queue with matching names. 

<br />
<br />

Switch - Sometimes in the course of assembling a stream you want to execute a different step depending on the evaluation of a condition. The switch step enables this by allowing you to specify up to 5 different conditions and branching a stream at a given point. 

    </li>

    <li>

<strong>Dexter modules</strong>

<br/>

These are the Dexter-blessed, built-in tools of the Dexter app ecosystem. They're available to every power user and developer in Dexter, and cover a broad range of behaviors.
    </li>

    <li>

<strong>User modules</strong>

<br/>

User modules are modules you've made for your own apps. You build them with the same tools we've used to build the vast library of Dexter modules, and you can use them the same in the App editor. The only difference between User modules and Dexter modules lies in distribution: only *you* can use your user modules.

    </li>

</ol>

# SDK Overview

Dexter is a completely open system. The Dexter SMS module you dragged onto the canvas in the tutorial is open source and you can view it in our <a href="http://github.com/rundexter/dexter-sms" target="_blank">Github repository</a>. Anyone can contribute new modules via our client tools. We are working hard to expand our library with more and more third party integrations to minimize the amount of code every app developer needs to write. 

Want to help? Dexter apps are composed of an interconnected series of modules, each of which has a specific job to do. Together with the Dexter community, our goal is to build modules that cover the range of tasks that you might do with a third party provider -- like send a Slack message, add a song to a Spotify playlist, archive an item in Gmail, and more! 

## How it works

The Dexter SDK lets you create your own module, which is just a slightly enhanced Node.js library. You declare what kind of serializable input and output your module receives and sends, respectively.

When you're done, you push your code  into Dexter, using a custom git server. You can use either the sdk `dexter push` or a regular git program `git push dexter master` to send the code along.

Once it's in our system, it'll show up in the App editor as another module for you to use. You'll be able to wire it up however you want and run it alongside the built-in modules.

You can make and use as many custom modules as you like - the sky's the limit!

## Setting Up Your Environment

```shell
# install the Dexter client
$ npm install rundexter -g
```

To get started you need to have a working installation of <a href="https://nodejs.org" target="_blank">Node.js</a>. Dexter has been tested with `Node.js v0.12.5`, but it will likely work with other versions as well. 

## Log in
```shell
$ dexter login { your email }
# Enter your password when prompted
```
Before you do anything, you'll need to log in with your rundexter.com credentials. That lets us know who you are, so we can make the next steps happen.

## Make a key
```shell
$ ssh-keygen -f ~/.ssh/id_rsa -N ""
```

You’ll need to have an SSH key of some flavor (RSA or DSA). You might already have one - they’re useful things, and you’ve probably needed one before. They’re probably in ~/.ssh/ and called id_rsa and id_rsa.pub. If you don’t have one, make one now. You can run the given sample code to create a key, and [read more on the subject](https://help.ubuntu.com/community/SSH/OpenSSH/Keys) if you're interested.

## Send your key
```shell
# You can pass a path to a specific key here if you'd like
$ dexter add_key
# Make sure we got it!
$ dexter list keys
```

In order to be able to push your code to us, you’ll have to register your SSH key with us. We’ll use the default key if you have one, or you can give us a specific key you’d like you use. You can also register more than one key (on this machine or multiple machines) if you’d like.

# SDK Reference

## Authentication 
### dexter login
> Example

```shell
~/rundexter$ dexter login code@rundexter.com
Password: ****
Add your public key for GIT access? (yes) no
If you change your mind, you can always add it later
dexter add_key <keyname>(optional) Add an SSH key to the system

```
Parameter|Required|Description
---------|--------|-----------
email_required | true | Your email

Log into your rundexter.com account using the website's email and password.

Dexter remembers your credentials by adding a record to ~/.netrc, a fairly standard credential storage file used by FTP, Heroku, and a variety of other tools. Even though it's a plain-text file, don't worry!  We don't put your password in there, just an API key that only means something to the Dexter tools.

<aside class="notice">
This will always prompt for a password, which MUST be entered interactively.
</aside>

### dexter add_key
> Example: Default key

```shell
~/rundexter$ dexter add_key
Your key is now available on dexter!
```
> Example: Custom key

```shell
~/rundexter$ dexter add_key ~/dexter.rsa.pub
Your key is now available on dexter!
Make sure your .ssh/config is set to use this key for rundexter.com
```

Parameter|Required|Description
---------|--------|-----------
path | false |  Path to the key file

Add a public key file to the system. This file will be used to authenticate your access to the Dexter deployment servers when you publish code.

If left out, Dexter will first look for a file in ~/.ssh/id_rsa.pub, then in ~/.ssh/id_dsa.pub

Adding keys is useful if you want to have multiple people work on a single module, or if you work from multiple computers with varying security requirements (a work and a personal computer, for instance).

### dexter remove_key
> Example: Single match

```shell
~/rundexter$ dexter remove_key 3792y+
Matching keys removed: 1
```

> Example: Multiple matches (error)

```shell
~/rundexter$ dexter remove_key AAA
Request failed: More than one key was found that matches this query - please be more specific
```

Parameter|Required|Description
---------|--------|-----------
pattern | true |  A string pattern found in the key you want to delete

Remove a key from rundexter.com that you no longer want to have access to the Dexter deployment servers. The provided pattern can exist anywhere in the key, or it can be the entire key. Use the list_keys command if you need to figure out a good pattern to use, or pass in your machine name if you think it's unique.

We'll look for the pattern you provide in all of your registered keys, but we'll only delete a key if it's the only match we find. In case the pattern you give us matches more than one key, we'll ask you to be more specific instead of wiping them all out!

Removing a key doesn't prevent you from re-adding that key in the future.

### dexter list_keys
> Example

```shell
~/rundexter$ dexter list_keys
ssh-rsa AAA.........82Fregr= dexter@rundexter.com

ssh-dsa AAA.........38eeer2= dexter@rundexter.com
```

Show all the keys you've registered with rundexter.com

## Module Operations

### dexter check_name
> Example (available)

```shell
~/rundexter$ dexter check_name foobar
Package name is available
```

> Example (unavailable)

```shell
~/rundexter$ dexter check_name dexter-sms
Someone else owns this package already
```

Parameter|Required|Description
---------|--------|-----------
name | true |  The module name you're checking

Check to see if a given module name is taken. Dexter modules live in a global namespace, so if someone else has used a name, you can't also use it.

### dexter init
> Example (this folder)

```shell
~/rundexter$ dexter init
Initializing Dexter remote in /home/dexter/projects/my-dexter-module
Your dexter remote is ready
~/rundexter$ git remote -v
dexter  git@git.rundexter.com:/my-dexter-module (fetch)
dexter  git@git.rundexter.com:/my-dexter-module (push)
```

> Example (another folder)

```shell
~/rundexter$ dexter init /srv/app/dexter/module
Initializing Dexter remote in /srv/app/dexter/module
Your dexter remote is ready
~/rundexter$ git remote -v
dexter  git@git.rundexter.com:/server-dexter-module (fetch)
dexter  git@git.rundexter.com:/server-dexter-module (push)
```

Parameter|Required|Description
---------|--------|-----------
path | false |  The path to the git instance


Set up an existing git repository for use with the dexter command-line tool. So long as the target directory *looks* like a dexter module (i.e. it has valid package and meta json files), init will create a remote named "dexter" for you.

### dexter create
> Example

```shell
~/rundexter$ dexter create foobar
Initializing project as Dexter DocGuy (code@rundexter.com)
Created repo in /home/dexter/foobar
lodash@3.10.1 node_modules/lodash
Added .gitignore
Added README.md
Added fixtures/default.js
Added fixtures/env.example.js
Added form/README.md
Added form/checkout.form
Added form/run.form
Added form/settings.form
Added index.js
Added meta.json
Added package.json
Created initial commit [Oid 5e0536cebca0811079d4f3ec87f940839854cca4]
Initializing Dexter remote in /home/dexter/foobar
Your dexter remote is ready
```

Parameter|Required|Description
---------|--------|-----------
name | true |  The name of the new Dexter module

Create a skeleton for a new Dexter module. The following things happen:

1. The given name is first checked to make sure it's available
1. A module skeleton is copied and modified to match the given name
1. A local git repository is created for the module and its skeleton contents added as a first commit
1. The dexter remote is configured

### dexter run
> Example (default)

```shell
# runs fixtures/default.js
~/rundexter$ dexter run
{
    "foo": "bar"
}
```

> Example (custom)

```shell
# runs fixtures/barWithBaz.js
~/rundexter$ dexter barWithBaz
{
    "bar": "baz"
}
```

Parameter|Required|Description
---------|--------|-----------
name | true |  The name of the fixture to run

Execute the function using a built-in fixture. Every Dexter module is created with a default fixture which is used if you don't explicitly identify which fixture to run.

### dexter push
> Example

```shell
~/rundexter$ dexter push
Adding your module to Dexter...
Counting objects: 13, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (11/11), done.
Writing objects: 100% (13/13), 3.21 KiB | 0 bytes/s, done.
Total 13 (delta 0), reused 0 (delta 0)
---> Processing push
---> Sending to your environment
---> Push processed!
---> Success! Your module is now available in the Dexter Editor!
To git@git.beta.rundexter.com:/foobar
 * [new branch]      master -> master
```

Push your module to Dexter. This will update your code on our servers and deploy it for use by all Things and future Things in the system.

Note that deployment is largely tied to your module's version #. For example, let's say you do the following:

1. Create a module foobar at version 0.1
1. Add foobar to a Thing called Hello World.
1. Update foobar by with a new "baz" function and bump the version to 0.2
1. Add foobar to a Thing called Welcome Universe.

When this process is complete, "Hello World" will still be using foobar 0.1, and "Welcome Universe" will be using 0.2. You would have to explicitly update "Hello World" in order for it to start using foobar 0.2.

# Module API 

Modules in Dexter are the building blocks you'll use to assemble your Apps. They're expressions of the principal of doing one thing and doing it well: each is designed to have a single, clear task that works independently of the rest of your code. It's the job of the App to decide how these behaviors interact - the modules themselves only care about what kind of input they get and emitting consistent output.

<aside class="success">
Modules are just specialized Node.js libraries with a bit of special sauce in the form of extra metadata, baked-in tests, and an SDK to help speed development. Most can be used independently of Dexter, and can be incorporated into any other Node.js / [Browserified](http://browserify.org/) application.
</aside>

## Anatomy of a module

Only 3 files are mandatory for a Dexter module:

> The Entrypoint

```javascript
/*
 * index.js
 */
module.exports = {
    run: function(step, dexter) {
        this.succeed();
    }
};
```

- **index.js**: This is the main touchpoint for your application. At a minimum, it needs to export a single function "run(step, dexter)" and call "this.succeed()". We'll go into more detail about this later on.

<div></div>

> The Node.js Module Descriptor (package.json)

```json
{
  "name": "my_dexter_module",
  "description": "A minimal example Dexter module",
  "version": "0.0.1"
}
```

- **package.json**: This is a regular [Node.js package definition](https://docs.npmjs.com/files/package.json). This lets you use a Dexter module just like you would any other Node.js package - you can npm install --save to your hearts content, add your module to a public or private NPM server, and otherwise distribute it outside of Dexter.

<div></div>

> The Dexter Descriptor (meta.json)

```json
{
    "title": "My Dexter Module",
    "icon": "heart",
    "inputs": [{ 
        "id": "url",
        "title": "Page URL", 
        "type": "string" 
    }, { 
        "id": "term",
        "title": "Search term",
        "type": "string" 
    }],
    "outputs": [{ 
        "id": "links",
        "title": "Found links",
        "type": "string" 
    }]
}
```

- **meta.json**: Special definitions used by Dexter are stored here.
    * **title (string, required)**: The user-friendly title of your module
    * **icon (string, optional)**: A [FontAwesome icon](http://fortawesome.github.io/Font-Awesome/cheatsheet/) that will show up alongside your module in the App editor.
    * **inputs (array, optional)**: Definitions for any inputs your module accepts. Each item in the array should have 3 properties:
        * *id (string)*: The input's code-friendly key (ex: first_name)
        * *title (string)*: The input's user-friendly name (ex: First Name)
        * *type (string)*: A basic type (string, integer, array)
    * **outputs (array, optional)**: Definitions for any outputs your module generates. Just like inputs, each object in the array has 3 properties:
        * *id (string)*: The input's code-friendly key (ex: first_name)
        * *title (string)*: The input's user-friendly name (ex: First Name)
        * *type (string)*: A basic type (string, integer, array)

## The guts of a Dexter module
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

The real power of Dexter lies in its ability to mix and match outputs from a variety of sources in order to provide input data for a given module. Well designed modules therefore must be able to accommodate as broad a spectrum of inputs as possible.

All module inputs are, under the hood, wrapped up in a single object `{}`. That object has properties for each input defined in the module's meta.json file `{ input1: null, input2: null}`. As an app is configured, the user creating the app maps different data sources to each of those inputs `input1 = output1, input2 = output2, {output 1: 1}, {output 2: 2}`. When the app is executed, those mappings are evaluated, and the results bound to the input object `{input1: 1, input2: 2}`.

The real fun begins when input data is mapped from sources that have multiple outputs `[{output1: 1}, {output1: 2}], {output2: 3}`. Our input system is flexible, so all the possible inputs get aggregated into our input object `{ input1: [1,2], input2: [3] }`. It's also possible that some configured mappings will produce no data at all `{ input2: 3 }`.

It's the job of you as the module creator to figure good rules for dealing with this variety of input data. Is a particular input critical enough to warrant killing an App if it's missing?  How do you deal with misaligned amounts of input?  Which inputs can you only deal with 1 of, and which are safe to handle as arrays?

Inputs can either be accessed directly by extracting them via `step.inputs()`, or wrapping individual inputs in a Dexter [data collection](#data-collections) by calling `step.input(key)`. You can verify that you have the data you need through any combination of assertions (assertion errors will cause the app to abort), explicit failures (calling `this.fail(...)` lets you give specific reasons for the error), or by providing defaults (calls to `input(key, default)` with a good fallback default value).

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

In keeping with the theme of doing one thing and doing it well, Dexter assumes all modules will output a single kind of object that reflects its goals. Does the module get Slack history?  Then the output should look like `{ user, text, link }`. Does it get a list of stock prices?  The output should look like `{ symbol, name, price, change }`. You describe what that object looks like in your `meta.json` file: each property of the object gets a record in its "outputs" collection.

That doesn't mean you're restricted to returning a single object. If your module didn't produce any output, just return nothing. If it produced multiple data points, return a collection of your output objects. So long as each object has properties that are recognizable from your `meta.json:outputs` definitions, Dexter will be able to parse the outputs and pass them along as needed.

What you *don't* want to do is to define and return complex object properties. Dexter's power lies in the ability to map the output from one module to the input of another, and to let the user decide how to make those associations meaningful. In order for you output to be understood by the widest variety of other modules, each object property should be a basic type (string/numeric good, binary/object bad) and well named (email/url good, o_fsk_n50/aws_9009939923f_useast1 bad).

That doesn't mean you *can't* move around complex objects. If you're building a pool of apps that perform image manipulation, you should create a series of modules that base64 encode image binaries and moves them around for processing. If you're doing an AWS automation App, you should have IAM objects as a basic type that your modules understand. Just know that most other modules won't know what you're talking about!

You can read more about outputs under [BaseModule::succeed](#basemodule-succeed-data).


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

## Module functions
When you create a module, it implicitly extends a Dexter BaseModel before it's run. The BaseModel provides several functions that are required for your Module to run in a Dexter App.

### BaseModule.run(step, dexter)

Parameter|Type|Description
---------|--------|-----------
step | DexterStep |  Information about how this module should be used
dexter | DexterApp | Global information about the state of the whole App being run

This is the main entry point to your module. By the time this has been run, Dexter has assembled your inputs based on the user's requirements and made them available to you via `step`. In case you need some broader context about how things are running, however, you can see the entire data definition for the currently running App via the dexter parameter.

<aside class="warning">
You don't need to run this function yourself - Dexter automatically runs it when necessary!
</aside>

### BaseModule.succeed(data)
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

If you have any useful information you want to make available to other modules, you'll want to return it here. Dexter assumes that you're returning an object of some kind, and that the object only has properties that match those you've defined in your [meta.json's output section](#anatomy-of-a-module). If you've got multiple such objects, that's cool too - just return an array of objects that match your spec instead. Dexter will still know how get and share data from the list of objects with other modules.

Note that you should only call succeed once, and after you do, the wrapper running the function will quickly shut down, making any code your run afterwards a bit of a gamble. Calling `return this.succeed()` as shown in the code samples is one way to guarantee that you only make one call and don't cause a race condition afterwards, though you can use careful code flow to do the same if you'd prefer.

<aside class="success">
<p>Your response object properties can technically be *anything* - strings, arrays, objects - pretty much any non-binary, non-stream, non-executable value is fair game!</p>
<p>Keep in mind, however, that a lot of Dexter's power comes from the ability of unrelated modules to be able to communicate with one another. If you return an object or an array as one of your response object properties, other modules will need to know how to deal with the *specific* object or array you're returning, limiting how useful your module will be. If you return basic values like strings or numbers, your module will be much more flexible and useful in the Dexter ecosystem.</p>
</aside>

### BaseModule.fail(details)
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

Note that you should only call succeed once, and after you do, the wrapper running the function will quickly shut down, making any code your run afterwards a bit of a gamble. Calling `return this.fail()` as shown in the code samples is one way to guarantee that you only make one call and don't cause a race condition afterwards, though you can use careful code flow to do the same if you'd prefer.

### BaseModule.log(details)
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

A logger is a programmer's best friend, and the Dexter logger gives you a  ton of power. Every time you write a log, Dexter saves all the data you provide alongside a snapshot of the App at that point in time. You can then recall and play back your logs for a particular run of an App as needed.

In its most basic form, you can pass a simple `msg` string into the logger. Note that this is the exact same as calling `log({ message: msg })`.

If you've got some specific information you want to keep track of, you can pass it along as well. Our log playback tools will give some special treatment to any `message` property you send along (it'll show it in front of the rest of the logged data in the Dexter console), but it's optional if you don't want it.

The `message` property gets additional special treatment by allowing you to format your log message in a way that takes advantage of the modern browser console. You can actually embed specific data that you pass along by referencing its key after a colon, allowing you to easily see that data in the browser console. This is useful if you want to be able to monitor specific logged variables at a glance in the console.

### BaseModule.replay()
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

One of the downsides of working with APIs is that many of them have limits on how often you can use them. If you're using such a stingy API,  you need to be aware of how much data you can actually handle in a 60s long Dexter module.

Replay is the tool to use if this occurs. Calling replay will rerun the current module with the exact same inputs it was originally given. By using the App's global state management tools, your module can keep running until it finishes what it set out to do.

Some other scenarios where replay might be useful:
* Waiting for an API endpoint to become available
* Waiting for slowly updated data to change
* Waiting for scarce resources to free up

<aside class="warning">
There is currently a 50-step limit built into Dexter. That's more than enough for most Apps, *unless* you're relying heavily on replay to accomplish your goals. If you think you'll need to replay enough times to worry about that limit, you might want to consider another strategy, like queue and fetch combined with timers.
</aside>

## App data
### dexter
This is the 2nd parameter passed into your module's `run()` function, and represents a high-level view into all that's gone on in your app so far.

It's also the accessor you use to map inputs and add switch cases when wiring up your App - more on that in the App UI section!

### dexter.clone()
```javascript
var d2 = dexter.clone();
d2.setGlobal('test', 1);
assert.notEqual(d2.global('test'), dexter.global('test')
```
Make a deep copy of the entire Dexter structure. This is mainly useful if you need to pass the structure off to a subprocess and need to ensure that it doesn't make any changes.

### dexter.instance(key, default)
```javascript
var url = 'http://mylogger.example.com/?msg=Hello&from='
    + dexter.instance('instance_id', '(unknown)');
```
Fetch some runtime information about this *instance* of an App. 

Key|Type|Description
---------|--------|-----------
instance_id | string | A unique id for this particular run of the App. Useful if you want track data on a per-run basis.
active_step | string | The ID of the step that's currently running. For your modules, this is the same as step.config('id')


### dexter.environment(key, default) 
```javascript
if(!dexter.environment('slack_token')) {
    return this.fail('A slack_token environment variable is required for this module');
}
var slack = new Slack(dexter.environment('slack_token'));
```
Fetch any private App variables that have been registered.

Right now we're in the process of giving you as a module developer a way to communicate to App developers which keys your module requires. For now, just test for the keys' presence and return an informative message indicating the requirement.

### dexter.user(key, default)
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


### dexter.workflow(key, default)
```javascript
var log = new ParseLog({ msg: 'Module start', workflow: dexter.workflow('id', '(unknown)') });
log.save();
```

Details about the App itself. Details about the *instance* of the App being run come from `instance()`.

Key|Type|Description
---------|--------|-----------
id | string | Dexter system ID for the workflow
title | string | User-friendly title 
description | string | Longer description about what the App does

### dexter.url(key, default)
```javascript
var dexterUrl = dexter.url('home');
```

URLs used to access internal Dexter resources. These are better used through the actual helper functions and modules rather than directly by your modules.

Key|Type|Description
---------|--------|-----------
home | string | Dexter's homepage
logger | string | An endpoint used to track in-App logs
reporter | string | If this workflow is being run on a timer, the App calls back to the reporter to let it know it's done.


### dexter.global(key, default)
```javascript
var cacheKey = step.module('name') + '_cache',
    cache = dexter.global(cacheKey, null);
if(!cache) {
    cache = this.calculate();
    dexter.setGlobal(cacheKey, cache);
}
this.succeed({ data: cache });
```

Fetch globally stored information assigned during the use of this app. We're not placing any restrictions on how you use this, so you should do so both carefully and sparingly.

Available keys and values are determined by individual modules and will vary from App to App.

### dexter.globals()
```javascript
var globalKeys = Object.keys(dexter.globals()),
    myKey = 'aKeyIWantToUse';
if(globalKeys.indexOf(myKey) !== false) {
    return this.fail('Global key ' + myKey + ' already in use!');
}
```

Get the entire collection of in-use global data in a single object.


### dexter.setGlobal(key, value)
```javascript
var cacheKey = step.module('name') + '_cache',
    cache = dexter.global(cacheKey, null);
if(!cache) {
    cache = this.calculate();
    dexter.setGlobal(cacheKey, cache);
}
this.succeed({ data: cache });
```

An App-wide data store for the entire instance of the app. This is the ONLY place you can store information explicitly between steps and modules. We're not placing any restrictions on how you use this, so you should do so both carefully and sparingly.

Any serializable data can be assigned to a global (string, numeric, object, array, etc.). Unless you have a good reason not to, it's a good practice to namespace your global variables for your particular module. 

### dexter.step(id)
```javascript
var linkedStep = dexter.step('linked-step', null),
    data = step.input('data', (linkedStep) ? linkedStep.input('data') : null);
return this.complete({ data: this.process(data) });
```

Get a specific step from the workflow. There shouldn't be any real reason to use this, but if you do, it outputs either an AppStep (the same thing as the 1st parameter to `run()` or null;
    

## Step

This is the first parameter passed to your module's `run()` function, and probably the most important. It contains both the configuration of your step for the current App as well as the data that's been assigned to it.

### step.clone()
```javascript
var stepClone = step.clone();
```

Make a deep copy of the entire step. Possibly useful for handing off to other applications or libraries if you're concerned they might modify the data.

### step.config(key, default)
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
next | object | A collection of information about the possible next steps after this one
title | string | A human-friendly name for the step
type | string | What kind of step it is - currently either 'trigger' or 'module'
type_name | string | The specific step type, based on type. For modules, this is the module name.

### step.prev()
```javascript
var prev = step.prev();
if(prev.module('name') === 'foo') {
    return this.fail('Cannot run foo before bar. That would be inconceivable.');
}

Get the step that ran before this one.

### step.trigger()
```javascript
var trigger = step.trigger();
if(trigger.config('type_name') == 'timer' && this.lastRan() > moment().subtract(1, 'hours')) {
    return dexter.global('my_cache');
} else {
    return this.liveData();
}
```

Get the trigger step upstream from this step.

### step.module(key, default)
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

### step.input(key, default)
```javascript
var email = step.input('email', 'default@example.com').first(),
    messages = step.input('message'),
    message = messages.toArray().join('<br>');
this.queueEmail(email, 'You have messages', message);
return this.succeed();
```

Fetch an input bound to this step in the App editor.

Unlike most other functions, this returns a [Dexter collection](#data-collections) object instead of a raw value. This wrapper helps you navigate multiple or missing inputs as you prepare to run your module. You can read more about inputs [here](#inputs)

### step.inputs()
```javascript
var inputs = step.inputs(),
    inputKeys = Object.keys(inputs),
    types = {};
inputKeys.forEach(function(key) {
    types(key) = typeof inputs[key];
});
console.log(types);
//inputs: { x: 1, y: [2,3], z: null }
//log: { x: integer, y: array, z: null }
```

Get the raw input object. This will be a single object with all the input properties defined in your `meta.json:inputs` section and the raw values as parsed by Dexter.

### step.output(key, default)
```javascript
var output = step.trigger().output('url');
console.log(output.length, output.toArray())
//outputs: [{ url: 'http://google.com' }, { url: 'http://yahoo.com' }]
//log: 2 ['http://google.com', 'http://yahoo.com']
```

Extract a single property's worth of output data from a step. This isn't often used inside of a module, but *is* often used inside a switch statement to compare information. Like inputs, this returns a [Dexter collection](#data-collections)

### step.outputs()
```javascript
var outputs = step.outputs(),
    outputKeys = Object.keys(outputs),
    types = {};
outputKeys.forEach(function(key) {
    types(key) = typeof outputs[key];
});
console.log(types);
//outputs: { x: 1, y: [2,3], z: null }
//log: { x: integer, y: array, z: null }
```

Get the raw output object. This will be a single object with all the output properties emitted by the module, which should match the outputs defined in that module's `meta.json:outputs` section.

# Miscellaneous

## Debugging your app when it is live

Modules send messages to the Dexter logging component and those messages will appear in your developer console when your app is executing. In chrome, you should open up developer tools to view the messages; in firefox, you can use firebug or the native tools. 

