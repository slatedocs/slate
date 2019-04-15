# Single Sign On(SSO)

Metype enables property owners to manage identity of users by providing a login and sign in service.
Currently Metype allows social logins like Facebook, Twitter and Google Plus.

## SSO - Terminology
* `User`: A person logged in to metype or registering via metype.
* `OAuth`: A mechanishm which authenticates users based on a token/code.
* `Authorization Code`: A code for a client to get authenticated on a server.

## SSO - Prerequisites

```javascript
<!-- Initialization Script -->
<script type='text/javascript'>
  window.talktype = window.talktype || function(f) {
    if (talktype.loaded)
      f();
    else
      (talktype.q = talktype.q || []).push(arguments);
  };
</script>
<!-- Javascript to render the widgets -->
<script src='https://www.metype.com/quintype-metype/assets/metype.js'></script> -->
```

* Sign up for an account @ www.metype.com.
* You will find all your accounts @ www.metype.com/admin if you are signed in.
* You will find the credentials for SSO in the `Embed Metype` Tab on your admin panel.
* Please whitelist your website url in `Allow Multiple Domains` under `Settings` Tab of the admin panel if you are embedding the widget on a website other than the website url provided during account creation. If this is not done you will get an error called `This domain is not whitelisted` on the browser console when you are trying to embed the script. Visually you ll see the `metype` logo appearing and the widget not rendering on the browser.
* Set a callback url for your `Settings` tab under admins panel so that Metype knows the path to which it can redirect to after authenticating the user.
* Setup the initialization script available on the right hand side of this page, in the `<head>` section of your webpage.


## Integration - Authorization Code Flow

```javascript

http://www.metype.com/oauth/authorize?client_id=YOUR_CLIENT_ID&redirect_uri=REDIRECT_URL&response_type=code
```

1) Request for an authorization code by making the following api call.
Please place the url on the right as the href or src of a HTML tag.

```shell--request
POST https://www.metype.com/oauth/token
{
    grant_type: authorization_code,
    client_id: YOUR_CLIENT_ID,
    client_secret: YOUR_CLIENT_SECRET,
    code: PASS_CODE_PARAM_HERE,
    redirect_uri: YOUR_REDIRECT_URI
}
```
```shell--response
{
    "access_token": "TOKEN",
    "token_type": "bearer",
    "expires_in": EXPIRY_IN_SECONDS,
    "created_at": 1526984201
}
```

2) After authorization of the user metype will redirect the user back to the properties redirect url with a `code` parameter which is called a authorization code.
Use this `code` to retrieve a access token to metype api's. The api to retrieve an access token is as on the right.

```shell--request
GET https://www.metype.com/api/v1/current_user.json?access_token=TOKEN
```
```shell-response
{
    current_user: {
        id: 1,
        name: "JOHN DOE",
        avatar: "https://www.example.com/image.png",
        bio: "I am awesome",
        slug: "john-doe"
    }
}
```

3) Using the above token, the property owner can get the user data by accessing the current user api on metype.


This user can be hashed and maintained in a session cookie or repeated requests to metype can be made to get the user details.
The OAuth libraries will handle the rest in the application if you have integrated with one.


## Integration - iframe
Allows Publishers to integrate sso on their website via an iframe.

```javascript
<div class="sso-login-iframe-parent">
<div id="form-login-container" class="form-login-container"></div>
<script type="text/javascript">
    talktype(function() {
        const formContainer = document.getElementById("form-login-container"),
              metypeHost= "https://www.metype.com",
              clientId = "SSO_CLIENT_ID",
              redirectUri = "REDIRECT_URI",
              source = `https://www.metype.com/oauth/authorize?client_id=${clientId}&redirect_uri=${redirectUri}&response_type=code` ;

        talktype.formLoginIframe(formContainer, source, callback);
});
</script>
</div>
```

|Parameter|Type|Mandatory|Description|
| ------------------- |---  |---    |---    |
|SSO_CLIENT_ID|string|Yes|The SSO client identifier which can be found in Embed Codes page on Metype Admin.|
|REDIRECT_URI|string|Yes|The redirect URI(s) which are under **Valid Redirect URIs for Sign-In** in the Settings page on Metype Admin.|
|callback|function|No|A function the client can execute after a successful SSO Login.|



Use the script on the right hand side to load SSO in an iframe.
