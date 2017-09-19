---
title: Instant Access Partner - API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript
  - php

toc_footers:
  - <a href='http://instantaccess.io/partner.php'>Partner Sing Up</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# IA Documentation


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
  <div style="position: relative;">
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


IA uses client id and client secret keys to allow using of IA service.
You can register and get your new Partner keys by contacting us on [yo@instantaccess.io](email:yo@instantaccess.io) and provide use with the callback url to send the authorization code for the authenticated user to your website..

In order to complete the IA integration, you need to add the `code snippet` in your own website in the place you want to use IA in

<aside class="notice">
You must replace <code>IA_PARTNER_CLIENT_ID_KEY</code> with your IA partner client id key.
</aside>

<aside class="notice">
You must replace <code>IA_PARTNER_CLIENT_SECRET_KEY</code> with your IA partner client secret key.
</aside>


# Handling IA Authentication

IA System call one of three methods when finish IA Authentication according to the process status (success, denied or fail, timeout)

## Success

```javascript
    function successIA(usernameOrEmail) {
      // Handle successLogin in IA
      // Example: window.location = 'IACompleteRegisteration.php?iaUser='+usernameOrEmail
    }
```
This method called if your website user finish IA Authentication request successfully and approve your website request
You must implement this method and continue your user signup proccess, IA system will provide all authorized information of the user that your website requested to your callback endpoint with the username & user email before calling this method, You must implement the callback to save these data to use it later, Please check 'Callback Implementation Section'.

You can fetch the user data by ajax from your system or you can reditect for another page in this method and continue Sign Up process because the authorized information for the user must be saved now on your system via your callback url

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
This method called if your website user deny your IA Authentication request on his IA mobile App or the request fail for any other reason.
by default this method is implemented to alert the user with message why it fails, You can change it as you want

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
This method called if your website user didn't take any actions on his IA mobile app to authenticate your service.
by default this method is implemented to alert the user with timeout message

### Query Parameters

Parameter | Description
--------- | -----------
message | It contains timeout message.


# Callback Implementation

## IA System Call your callback after successful approval from the user

```php
$authorizationCode = $_GET['code'];
$state = $_GET['state'];
$stateArr = explode("@@", $state);
$username = $stateArr[0];
$email = $stateArr[1];
```

IA System Call your provided callback URL when the user approve your website request on IA mobile App with two parameters.

### HTTP Request

`GET http://yourwebsite.com/yourCallBackurl?code={AUTHORIZATION_CODE}&state={username}@@{email}`

Parameter | Description
--------- | -----------
code | the Authorization Code that use to fetch the user’s token from IA System
state | this is string represent the username and user email concatenated with '@@' you can split them and use them.

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

Your website must use the provided authorization code in last step to fetch user token and save it in your records of users (database, files, ...etc)

<aside class="success">
Remember — This token you will use everytime you request data for this user from IA system, Please check the next section to know how to use it.
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


## fetching user Information for this user from IA System

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

  // Save it in your DB is the best choice :)
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

Your website must use user token that provided in last step for authentication to fetch user authorized information and save it in your records of users (database, files, ...etc)

<aside class="success">
Remember — You can use this token and fetch the information many times via this api call.
</aside>

### HTTP Request

`GET http://instantaccess.io/api/public/user`

NO Parameters here just set the Headers as following

Header | Description
--------- | -----------
Content-Type | 'application/json'
Authorization | 'Bearer {access_token that provided from last step}'

The data will retrieved in json string as following
