## Quick Start

If you’re new to developing on APIs, this is a great place to start.  You’ll learn in this guide how to make the simplest Asana API request -- getting your user information. 

To get started, be sure you are [logged into Asana](https://app.asana.com).  Next, go to this URL: <a href="https://app.asana.com/api/1.0/users/me?opt_pretty&opt_client_name=hello_world_browser" target="_blank">https://app.asana.com/api/1.0/users/me</a>

Congratulations! You’ve just made your first Asana API request.  

Let’s unpack what just happened. The base URL for all requests to the Asana API is `https://app.asana.com/api/1.0`. We want information about users, so we go down a level to the `https://app.asana.com/api/1.0/users` resource.  Within the set of all users in Asana, We’re specifically looking to get information about our own account, so we get more specific by adding `/me` to get `https://app.asana.com/api/1.0/users/me`. The `/me` part would ordinarily be an identifier (a long number) or email address of the user, but we've created this shorthand for getting the current user of Asana's API, whomever that may be.  Put it together and you have the above path to get your user information from Asana.

Since every API request you make will start with the same base URL ('https://app.asana.com/api/1.0'), we'll just talk about what comes next in the URL -- which is often referred to as a 'resource' or 'path'. For instance, when we say `/users/me` it's actually shorthand for the entire URL which would be `https://app.asana.com/api/1.0/users/me`.

After requesting information from the API, you will receive a resposne in [JSON](https://en.wikipedia.org/wiki/JSON) format, which can be read and understood by both humans and computers. It's structured in a particular way so programs can rely on a consistent format for the data.

Our API is documented for what resources are available and what sort of return data to expect.  For example, here are the [docs for the `/users` endpoint](/#get-a-user) which we just called. This is where you can discover what's possible with our API.

Now, let’s make the same call to `/users/me` more like software would. Before we do so, we’ll need to get access outside of your web browser to the API.

### Authentication Quick Start

Similarly to entering your username/password into a website or logging into Asana with Google, when you access your Asana data via the API you need to authenticate.  In the above example, you were already logged into Asana in your browser so you were able to authenticate to the API with credentials stored by your browser.

If you want to write a script that interacts with the Asana API, the easiest method is to get a Personal Access Token (PAT), which you can think of as your unique password for accessing the API.

**Getting a Personal Access Token (PAT)**

1. Open the Developer App Management page by [using this permalink](https://app.asana.com/-/developer_console) or following these steps:

    * From within Asana, click your profile photo from the top bar and select **"My Profile Settings"**

    * Click the **"Apps"** tab

    * Click **"Manage Developer Apps"**

2. Click **"+ Create New Personal Access Token"**

3. Type a description of what you’ll use the Personal Access Token for.

4. Click **"Create"**

5. Copy your token. You will only see this one time, but you can always create another PAT later.

_**Note**: treat your PAT like you would a password. Do not share it or display it online_. 

### Accessing the API in the Terminal

We’ll use cURL, a command line[^1] program to make HTTP requests. MacOS and many Linux distributions have cURL pre-installed, and it’s [available for download](https://curl.haxx.se/dlwiz/?type=bin) on Windows and many other operating systems.  If you’re curious, you can learn more about cURL [in its own documentation](https://curl.haxx.se/docs/httpscripting.html). 

**Let’s do this:**

1. Open a terminal (instructions for [Mac](https://www.wikihow.com/Open-a-Terminal-Window-in-Mac) and [Windows](https://www.wikihow.com/Open-the-Command-Prompt-in-Windows))

2. Copy/paste the following cURL request (make sure to enter your personal access token instead of the placeholder after the word "Bearer" below, or else you'll get a "Not Authorized" message):

      `curl -H "Authorization: Bearer 0/123456789abcdef" https://app.asana.com/api/1.0/users/me`

3. Press Enter

Nice work! You just wrote a cURL command.

In our API documentation, we will often write examples as cURL commands since it's a middle-of-the-road approach to accessing our API: more flexible than using a browser, but user-friendly enough to be quick and easy to do.

You’re ready to start coding!

Asana has [client libraries](/#official-client-libraries) in several popular coding languages. Using these libraries has several advantages (like managing authorization and retrying errors) that make them a good place to go from here. Let’s take a look at making the same `/users/me` request in Python, JavaScript, and Ruby (feel free to skip ahead to your favorite of the three languages).

### Client Examples
**Python** (v2.x)

To get started, run `pip install asana` or follow the detailed installation instructions on the [GitHub page for the Python client library](https://github.com/Asana/python-asana/).  

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` - the same request as above, but in Python.

```python
import asana

# replace with your personal access token. 
personal_access_token = '0/123456789....'

# Construct an Asana client
client = asana.Client.access_token(personal_access_token)
# Set things up to send the name of this script to us to show that you succeeded! This is optional.
client.options['client_name'] = "hello_world_python"

# Get your user info
me = client.users.me()

# Print out your information
print "Hello world! " + "My name is " + me['name'] + " and I my primary Asana workspace is " + me['workspaces'][0]['name'] + "."

```

Save this file as something descriptive like "hello_world.py"

To run this script in your console, pass it as an argument to the python interpreter, i.e. `python hello_world.py` from the same directory as the file. You should see the message we wrote above with your user information.

As an aside, for clarity `python-asana` will also work with Python 3.x (with small changes to the above example to make it compatible.)

All of the built-in functions can be found in the [/gen folder of the client library](https://github.com/Asana/python-asana/tree/master/asana/resources/gen). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/python" target="_blank">Github examples repository</a>


**JavaScript**

To get started, `npm install asana` or follow the detailed installation instructions on the [GitHub page for the Node client library](https://github.com/Asana/node-asana/).  

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me`. - the same request as above, but in JavaScript.

```javascript
var asana = require('asana');

// replace with your personal access token. 
var personalAccessToken = '0/123456789....';

// Construct an Asana client
var client = asana.Client.create().useAccessToken(personalAccessToken);

// Get your user info
client.users.me()
  .then(function(me) {
    // Print out your information
    console.log('Hello world! ' + 'My name is ' + me.name + ' and my primary Asana workspace is ' + me.workspaces[0].name + '.');
});
```

Save this file as something descriptive like "hello_world.js"

To run this script in your console, pass it as an argument to the node interpreter, i.e. `node hello_world.py` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in functions can be found in the [/gen folder of the client library](https://github.com/Asana/node-asana/tree/master/lib/resources/gen).

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/javascript" target="_blank">Github examples repository</a>


**Ruby**

To get started, `gem install asana` or follow the detailed installation instructions on the [GitHub page for the Ruby client library](https://github.com/Asana/ruby-asana/).  

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me`.

```ruby
require 'asana'

# replace with your personal access token. 

personal_access_token = '0/123456789....'

client = Asana::Client.new do |c|

  c.authentication :access_token, personal_access_token

end

me = client.users.me

puts "Hello world! " + "My name is " + me.name + " and I my primary Asana workspace is " + me.workspaces[0].name + "."
```

Save this file as something descriptive like "hello_world.rb"

To run this script in your console, pass it as an argument to the ruby interpreter, i.e. `ruby hello_world.rb` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in methods can be found in the [/resources folder of the client library](https://github.com/Asana/ruby-asana/tree/master/lib/asana/resources). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/ruby" target="_blank">Github examples repository</a>

-----

Congratulations! You’ve learned three ways to access the Asana API.  If you need inspiration of what to build on the Asana API, take a look at these [common use cases](/#examples-amp-tutorials).  If you get stuck, checkout the [API section of Asana community](https://community.asana.com/c/developersAPI).  Happy coding!


[^1]: What is a "terminal"? When you double-click an icon on your computer, there is a special application that's in charge of launching other applications. On MacOSX, this program is called "Finder", and on Windows it's called "Windows Explorer". A terminal app is a similar app that launches other applications, but rather than double clicking an icon, you type commands into a text-based window.
