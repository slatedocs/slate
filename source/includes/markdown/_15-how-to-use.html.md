<hr class="full-line">
<section class="full-section">
<section>

# How to use the API

> Request

```
https://app.asana.com/api/1.0/users/me
```

_If you're familiar with building against APIs, you can jump to our [examples](/docs/examples)._

<span class="description">
If you’re new to developing on APIs, this is a great place to start.  You’ll learn in this guide how to make the simplest Asana API request -- getting your user information. 
</span>

To get started

1. Be [logged into Asana](https://app.asana.com).
2. Go to this URL: <a href="https://app.asana.com/api/1.0/users/me?opt_pretty&opt_client_name=hello_world_browser" target="_blank">https://app.asana.com/api/1.0/users/me</a>

`me` is a User Identifier that refers to the logged in user. A User Identifier can be either `me`, an email_address, or the gid of the user.

> Response

```json
{
  "data": {
    "gid": "12e345a67b8910c11",
    "email": "jonsnow@example.com",
    "name": "Jon Snow",
    "photo": {
      "image_21x21": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_21x21.png",
      "image_27x27": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_27x27.png",
      "image_36x36": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_36x36.png",
      "image_60x60": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_60x60.png",
      "image_128x128": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_128x128.png"
    },
    "resource_type": "user"
  }
}
```

And Congratulations! You’ve just made your first Asana API request.

Let’s unpack what just happened. The base URL for all requests to the Asana API is `https://app.asana.com/api/1.0`. We want information about users, so we go down a level to the `https://app.asana.com/api/1.0/users` resource. Within the set of all users in Asana, We’re specifically looking to get information about our own account, so we get more specific by adding `/me` to get `https://app.asana.com/api/1.0/users/me`. The `/me` part would ordinarily be an identifier (a long number) or email address of the user, but we've created this shorthand for getting the current user of Asana's API, whomever that may be. Put it together and you have the above path to get your user information from Asana.

Since every API request you make will start with the same base URL ('https://app.asana.com/api/1.0'), we'll just talk about what comes next in the URL -- which is often referred to as a 'resource' or 'path'. For instance, when we say `/users/me` it's actually shorthand for the entire URL which would be `https://app.asana.com/api/1.0/users/me`.

After requesting information from the API, you will receive a response in [JSON](https://en.wikipedia.org/wiki/JSON) format, which can be read and understood by both humans and computers. It's structured in a particular way so programs can rely on a consistent format for the data.

Our API is documented for what resources are available and what sort of return data to expect. For example, here are the [docs for the `/users` endpoint](/docs/get-a-user) which we just called. This is where you can discover what's possible with our API.

Now, let’s make the same call to `/users/me` more like software would. Before we do so, we’ll need to get access outside of your web browser to the API.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

## Authentication Quick Start

<span class="description">
Similarly to entering your username/password into a website or logging into Asana with Google, when you access your Asana data via the API you need to authenticate.  In the above example, you were already logged into Asana in your browser so you were able to authenticate to the API with credentials stored by your browser.
</span >

If you want to write a script that interacts with the Asana API, the easiest method is to get a Personal Access Token (PAT), which you can think of as your unique password for accessing the API.

### App or PAT?

If your app needs to perform actions on behalf of users, you should use [OAuth](/docs/oauth).

**Getting a Personal Access Token (PAT)**

> Example PAT

```
0/68a9e79b868c6789e79a124c30b0
```

1. Open the Developer App Management page by [using this permalink](https://app.asana.com/-/developer_console) or following these steps:

   - From within Asana, click your profile photo from the top bar and select **"My Profile Settings"**

   - Click the **"Apps"** tab

   - Click **"Manage Developer Apps"**

2. Click **"+ Create New Personal Access Token"**

3. Type a description of what you’ll use the Personal Access Token for.

4. Click **"Create"**

5. Copy your token. You will only see this one time, but you can always create another PAT later.

_**Note**: treat your PAT like you would a password. Do not share it or display it online_.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

## Using Terminal

<a id="accessing-the-api-in-the-terminal"></a>

> curl Request

```
curl https://app.asana.com/api/1.0/users/me \
  -H "Authorization: Bearer 0/123456789abcdef"
```

<span class="description">
We’ll use cURL, a command line[^1] program to make HTTP requests. MacOS and many Linux distributions have cURL pre-installed, and it’s [available for download](https://curl.haxx.se/dlwiz/?type=bin) on Windows and many other operating systems.  If you’re curious, you can learn more about cURL [in its own documentation](https://curl.haxx.se/docs/httpscripting.html). 
</span>

**Let’s do this:**

> Response

```json
{
  data: {
    gid: "<your gid>",
    email: "<your email>"
    name: "<your name>",
    ...
  }
}
```

1. Open a terminal (instructions for [Mac](https://www.wikihow.com/Open-a-Terminal-Window-in-Mac) and [Windows](https://www.wikihow.com/Open-the-Command-Prompt-in-Windows))

2. Copy/paste the cURL request on the right (make sure to enter your personal access token instead of the placeholder after the word "Bearer", or else you'll get a "Not Authorized" message):

3. Press Enter

Nice work! You just wrote a cURL command.

In our API documentation, we will often write examples as cURL commands since it's a middle-of-the-road approach to accessing our API: more flexible than using a browser, but user-friendly enough to be quick and easy to do.

You’re ready to start coding!

Asana has [client libraries](/docs/official-client-libraries) in several popular coding languages. Using these libraries has several advantages (like managing authorization and retrying errors) that make them a good place to go from here. Let’s take a look at making the same `/users/me` request in Python, JavaScript, and Ruby (feel free to skip ahead to your favorite of the three languages).

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

## Using Postman

<a id="accessing-the-api-with-postman"></a>

<blockquote>
<div class="postman-run-button"
data-postman-action="collection/import"
data-postman-var-1="f3c8e2599dfa2a9c39f0"></div>
<script type="text/javascript">
  (function (p,o,s,t,m,a,n) {
    !p[s] && (p[s] = function () { (p[t] || (p[t] = [])).push(arguments); });
    !o.getElementById(s+t) && o.getElementsByTagName("head")[0].appendChild((
      (n = o.createElement("script")),
      (n.id = s+t), (n.async = 1), (n.src = m), n
    ));
  }(window, document, "_pm", "PostmanRunObject", "https://run.pstmn.io/button.js"));
</script>
</blockquote>

<span class="description">
You can quickly get started on Asana's API with the [API Explorer](/docs/api-explorer). However, if you want a more robust experience hitting the API, we recommend using [Postman](https://learning.postman.com/docs/getting-started/introduction/). You can get started with the 'Run in Postman' button!
</span>

Once you have the collection, you should [create an environment](https://learning.getpostman.com/docs/postman/environments_and_globals/manage_environments/).

You'll want to set:

1. `authentication_token` to a Personal Access Token (PAT). If you don't have one yet, visit our [Authentication Quick Start](/docs/authentication-quick-start).
2. `workspace` to your workspace's gid. You can find this value via a logged-in browser by going to [https://app.asana.com/api/1.0/users/me/workspaces](https://app.asana.com/api/1.0/users/me/workspaces), or you can hit that endpoint using your PAT.
3. Any other gids you want to easily access.
   1. For example, you can set `task` to the gid of a task that you regularly test with, `project` to the gid of a private sandbox project, and `user` to the string 'me'.

No need to edit your environment for requests on different objects, simply navigate to the endpoint you want to use, and change the `{{object}}` to any gid you want.

Importing this collection gives you a snapshot of the API at this time. To stay up to date with API changes, you'll have to re-import the collection by hitting the 'Run in Postman' button, and choosing to override your existing collection. This means if you want to save custom requests, you should do so in a different collection.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
</section>
