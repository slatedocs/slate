## Authentication Module

This module is designed to authenticate users.

### Tasks

  * `supported` property
  * `username` property
  * `authenticated` property
  * `login` function
  * `logout` function
  * `getCredentialsInfo` function
  * `authentication.usernameChanged` event

### Properties

#### supported

```javascript
var supported = authentication.supported;
```

##### Discussion

Returns whether the device supports authentication.

#### username

```javascript
var username = authentication.username;
```

##### Discussion

Returns current authenticated username or **null**. This property changed when
authentication.usernameChanged event received.

#### authenticated

```javascript
var isAuthenticated = authentication.authenticated;
```

##### Discussion

Returns **true** if user already authenticated. Otherwise returns **false**.
This property changed when authentication.usernameChanged event received.

### Functions

#### login

```javascript
var options = {  
    username: "test_user",  
    password: "password"};  
authentication.login( options, function(info) {  
    alert("User (" + info.username + ") authenticated.");  
}, function (error) {  
    alert("Login failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`authentication.login( options, successCallback, errorCallback )`

##### Discussion

Tries to login to server with user credentials.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `username`

A String value. The key must contains string with username.

    * `password`

A String value. The key must contains string with user password.

    * `remember`

A Boolean value. If **true** credentials will be saved and will be used after
application restart.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `username` \- Authorized username. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### logout

```javascript
authentication.logout( function(info) {  
    alert("Finished.");  
}, function (error) {  
    alert("Logout failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`authentication.logout( successCallback, errorCallback )`

##### Discussion

Logout current authorized user and clear all session cookies.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getCredentialsInfo

```javascript
authentication.getCredentialsInfo( function(info) {  
    alert("Last username = " + info.username + "\n"+  
         "Last remember" + info.remember);  
}, function (error) {  
    alert("Failed! code: " + error.code + "\nmessage: " + error.message);  
});
```

`authentication.getCredentialsInfo( successCallback, errorCallback )`

##### Discussion

Gets username and remember flag which used in last successful call of login
method.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `username` \- Username which was used in last login. (String)
    
    * `remember` \- Last used remember flag state. (Boolean)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

### Events

#### authentication.usernameChanged

##### Discussion

Event received when current authentication status changed.

##### Callback Arguments

  * `username` \- Current authenticated username or **null**. (String)