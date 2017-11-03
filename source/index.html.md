---
title: Instant Access Partner - API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript
  - php

toc_footers:
  - <a href='http://instantaccess.io/partner'>Partner Sign Up</a>

search: true
---

# IA Documentation

<img src="images/headerImg.svg" width="100%"/>

Before you start, you will need 2 keys<br/>
- Client ID Key<br/>
- Client Secret Key<br/><br/>
Contact us at [yo@instantaccess.io](email:yo@instantaccess.io) if you do not have these. You will need to provide us with a callback url to receive user info from our server.


# IA Partner Integration

> To integrate IA on your website, add this code snippet to your website:

```javascript
  <!-- IA Authentication -->
  <script type="text/javascript">
    window.onload = function(e){
      var client_id = 'IA_PARTNER_CLIENT_ID_KEY';
      var client_secret = 'IA_PARTNER_CLIENT_SECRET_KEY';

      function successIA(usernameOrEmail) {
        // Handle successLogin in IA
        // Example: window.location = 'IACompleteRegisteration.php?iaUser='+usernameOrEmail
      }

      function deniedIA(message) {
        alert(message);
      }

      function timeoutIA(message) {
        alert(message);
      }


      document.getElementById('ia-framework-login').src = 'http://52.26.104.251/api/partner/authorize/view?client_id='+client_id+'&client_secret='+client_secret;
      //listen to ia back
      window.addEventListener('message',function(event) {
        if(event.origin !== 'http://52.26.104.251') return;
        if(event.data.action === 'alert')
          alert(event.data.message);
        else if(event.data.action === 'closeframe') {
          document.getElementById("ia-btn").style.display = "block";
          fade(document.getElementById("ia-framework-login"));
          //document.getElementById("ia-framework-login").style.display = "none";
        }
        else if(event.data.action === 'auth') {
          switch (event.data.status) {
            case 'success':
              successIA(event.data.usernameOrEmail);
              break;
            case 'denied':
              deniedIA(event.data.message);
              break;
            case 'timeout':
              timeoutIA(event.data.message);
              break;
          }
        }
      },false);
    }

    function iaButtonClicked() {
      unfade(document.getElementById("ia-framework-login"));
      //document.getElementById("ia-framework-login").style.display = "block";
      document.getElementById("ia-btn").style.display = "hidden";
    }

    function fade(element) {
      var op = 1;  // initial opacity
      var timer = setInterval(function () {
        if (op <= 0.1){
          clearInterval(timer);
          element.style.display = 'none';
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op -= op * 0.1;
      }, 10);
    }

    function unfade(element) {
      var op = 0.1;  // initial opacity
      element.style.display = 'block';
      var timer = setInterval(function () {
        if (op >= 1){
          clearInterval(timer);
        }
        element.style.opacity = op;
        element.style.filter = 'alpha(opacity=' + op * 100 + ")";
        op += op * 0.1;
      }, 5);
    }
  </script>
  <div style="display: inline-block; position: relative;">
    <button type="button" onclick="iaButtonClicked()" id="ia-btn" style="background-color: #4A4A4A; border-width: 0; padding: 0; width: 56px; height: 56px; border-radius:10px;">
      <img src="http://52.26.104.251/upload/image/whitelogo.svg"/>
    </button>
    <iframe id="ia-framework-login" src="" width="170" height="215" frameBorder="0" style="display:none; border-radius:10px; z-index: 1000; position: absolute; left: 0px; bottom: 0px;"></iframe>
  </div>
  <style>
    #ia-btn:focus {
      outline-width: 0;
    }
    #ia-btn:hover {
      opacity: 0.9;
      cursor: pointer;
    }
  </style>
  <!-- End of login with IA -->
```


Once you are ready, simple add the `code snippet` where you want IA button to appear.

<aside class="notice">
You must replace <code>IA_PARTNER_CLIENT_ID_KEY</code> with your IA partner client id key.
</aside>

<aside class="notice">
You must replace <code>IA_PARTNER_CLIENT_SECRET_KEY</code> with your IA partner client secret key.
</aside>


# Handling IA Authentication

IA System will call one of this three methods when finish IA Authentication according to the status (success, denied or fail, timeout)

## Success

```javascript
    function successIA(usernameOrEmail) {
      // Handle successLogin in IA
      // Example: window.location = 'IACompleteRegisteration.php?iaUser='+usernameOrEmail
    }
```
This method will be called when user finished IA Authentication successfully and approved the request on their IA app.

Simply implement this method and continue your user flow, IA will provide all approved user info to your callback endpoint with the username and user email before calling this method. You can implement the callback to save these data for later use. Please refer to 'Callback Implementation Section'.

You can fetch user data using ajax or reditect to another page in this method and continue your user process. All authorized user info must be saved now on your system via your callback url.

### Query Parameters

Parameter | Description
--------- | -----------
usernameOrEmail | This is the username or email that the user used it to authenticate your service via IA System.

## Denied or Failed

```javascript
      function deniedIA(message) {
        alert(message);
      }
```
This method will be called if your website user denied the IA Authentication request on the IA App or the request fail for any other reason.

By default, this method alerts the user with a failing message, however you can change this to suit your need.

### Query Parameters

Parameter | Description
--------- | -----------
message | It contains the reason of failure if the user denied the process, ...etc.

## Timeout

```javascript
      function timeoutIA(message) {
        alert(message);
      }
```
This method will be called if user failed to respond to IA request over IA App.

By default, this method alerts the user with a timeout message.

### Query Parameters

Parameter | Description
--------- | -----------
message | It contains timeout message.


# Callback Implementation

## Callback

```php
$authorizationCode = $_GET['code'];
$state = $_GET['state'];
$stateArr = explode("@@", $state);
$username = $stateArr[0];
$email = $stateArr[1];
```

When user approved the request over IA App, the Callback URL will be called with two parameters.

### HTTP Request

`GET http://yourwebsite.com/yourCallBackurl?code={AUTHORIZATION_CODE}&state={username}@@{email}`

Parameter | Description
--------- | -----------
code | the Authorization Code that used to fetch the user’s token from IA
state | this string contains the username and email concatenated with '@@', you can split them and use them.

## fetching token for this user from IA System

```php
//setup the request, you can also use CURLOPT_URL
$curl = curl_init('http://instantaccess.io/api/oauth/token');

// SET API request type as post
curl_setopt($curl, CURLOPT_POST, 1);

// Returns the data/output as a string instead of raw data
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query(array('client_id'=>'IA_PARTNER_CLIENT_ID_KEY',
                                                              'client_secret'=>'IA_PARTNER_CLIENT_SECRET_KEY',
                                                              'code'=>'your Authorization Code that provided in the previous step',
                                                              'redirect_uri' => 'your callback url',
                                                              'grant_type'=>'authorization_code')));

$result = curl_exec($curl);

curl_close($curl);

if($result !== FALSE) {
  $data = json_decode($result,true);
  $user_token = $data["access_token"];
}
```

> The above command returns JSON structured like this:

```json
{
  "success": true,
  "message" : "User data items retrieved successfully",
  "data":[
      "phone": "+01111111111111",
      "Email": "test@test.com",
  ],
}
```

Please use the authorization code provided previously to fetch user token and save it in your users record. (database, files, ...etc)

<aside class="success">
This token is required everytime your system requests user info from IA. 
</aside>

### HTTP Request

`POST http://instantaccess.io/api/oauth/token?code={AUTHORIZATION_CODE}&state={username}@@{email}`

Parameter | Description
--------- | -----------
client_id | your IA_PARTNER_CLIENT_ID_KEY
client_secret | your IA_PARTNER_CLIENT_SECRET_KEY
code | your Authorization Code that provided in the previous step
redirect_uri | your callback url
grant_type | always with string value 'authorization_code'


## Fetch User Token

```php
if($result !== FALSE) {
  $data = json_decode($result,true);
  $user_token = $data["access_token"];
}

//setup the request, you can also use CURLOPT_URL
$curl = curl_init('http://instantaccess.io/api/public/user');

// Returns the data/output as a string instead of raw data
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

//Set your auth headers
curl_setopt($curl, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Authorization: Bearer ' . $user_token
    ));

$result = curl_exec($curl);

curl_close($curl);

if($result !== FALSE) {

  $json = json_decode($result);
  $data = $json->data

  // Save it in your DB is the best choice :)
  file_put_contents('ANY FILE PATH', json_encode($data));
}
```

> The above command returns JSON structured like this:

```json
{
  "success": true,
  "message" : "User data items retrieved successfully",
  "data":[
      "phone": "+01111111111111",
      "Email": "test@test.com",
  ],
}
```

Please use the user token to fetch user info from IA system. You can process these info as you usually do (e.g. save in database).

<aside class="success">
You can fetch user info with the user token via this api call at anytime.
</aside>

### HTTP Request

`GET http://instantaccess.io/api/public/user`

NO Parameters here just set the Headers as following

Header | Description
--------- | -----------
Content-Type | 'application/json'
Authorization | 'Bearer {access_token that provided from last step}'

The data will retrieved in json string as following
