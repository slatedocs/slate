## Logged in user

```js
$(document).ready(function(){
  $.ajax({
    url: 'https://demo.controlshiftlabs.com/api/graph/me.json',
    dataType: 'jsonp',
  })
  .done(function(data) {
    console.log(data);
  });
});

```

> The above code would user details for a signed in user. The returned JSON would be structured like this:

```json
{
   "status":"authenticated",
   "me":{
      "first_name":"John",
      "last_name":"Smith",
      "email":"john@smith.com"
   },
   "petitions":[
      {
         "slug":"sample-campaign",
         "title":"Sample Campaign",
         "created_at":"2016-03-25T15:37:28.849-04:00",
         "updated_at":"2016-03-25T15:37:35.304-04:00"
      }
   ],
   "events":[
      {
         "slug":"sample-campaign",
         "title":"Sample Campaign",
         "created_at":"2016-03-25T15:37:28.849-04:00",
         "updated_at":"2016-03-25T15:37:35.304-04:00"
      }
   ],
   "chapters":[
      {
         "name":"Brooklyn bruisers",
         "slug":"brooklyn-bruisers",
         "created_at":"2015-05-14T15:53:03.901-04:00",
         "updated_at":"2016-03-25T15:40:44.661-04:00"
      }
   ]
}
```

> Response for a visitor who is not logged in:

```json
{
  "status":"not_authenticated",
  "message":"user is not signed in"
}
```
We provide a specialized jsonp endpoint to return information about the currently signed in user. Customers can use this endpoint to power features where information about the current user's petitions, sign in status, and other information about their account is displayed on external sites. Some examples of the sorts of functionality that this could be used to provide include:

* Conditionally show either a login link for unauthenticated users or a link to the user's my account page in the header of external pages.
* Show information about a user's campaigns when someone visits an external site, or a prompt to start a campaign if the currently signed in user has none.
* Show a direct link to a user's local group from an external site rather than linking to a generic search for your group page.

<aside class="notice">
You must whitelist your hostname prior to using this end point. Read more below.
</aside>

### HTTP Request

`GET http://demo.controlshiftlabs.com/api/graph/me.json`

### Whitelisting a Hostname

We authenticate requests to the current user endpoint by validating the hostname set in the http referer header against a whitelist. The whitelist is set of hostnames that scripts can be served from. If you request the endpoint from a script served from a non-whitelisted hostname you'll get an error message. This is necessary to prevent cross site scripting attacks that would allow someone to display logged in user information on unauthorized sites.

You can add hostnames to the whitelist through a self-serve interface in the "Settings" area of your instance. Settings > Add Hostname > enter a Hostname, and click save.

The hostname must be a hostname string like "localhost" "www.google.com" or the like. Wildcards or full http urls are not supported.

When you access the graph api endpoint from a page served from a whitelisted hostname the browser will automatically set a referrer header on those requests. We use this referrer header to validate the server the script was served from against the whitelist. You can verify that a whitelisted hostname is working properly with the curl command line tool:

`curl --referer http://localhost/ http://demo.controlshiftlabs.com/api/graph/me.json`

The above should return a json blob indicating that the user is not signed in if localhost is whitelisted. Otherwise you'll get a not whitelisted error.

For authenticated users we currently return their first and last names, email addresses, and lists of petitions they've created, events they've created and local groups they are a member of.

