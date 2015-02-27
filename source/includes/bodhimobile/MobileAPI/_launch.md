## Launch Module

This module provides support for opening url in external browser and opening
external map application with specific location coordinates or addresses.

### Tasks

  * `browser` function
  * `map` function

### Functions

#### browser

```javascript
launch.browser( {url:"http://www.google.com"},  
function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`launch.browser( options, errorCallback )`

##### Discussion

Opens links in external browser.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `url`

A String value. The key must contains URL.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### map

```javascript
launch.map( {address:"1 Infinite Loop Cupertino"},  
function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`launch.map( options, errorCallback )`

##### Discussion

Opens external map application with specific location coordinates or
addresses.

##### Arguments

  * `options`required

Object with key-value. Supported keys:

    * `address`

A String value. The key can contains address.

    * `coordinates`

An Object value. The key can contains location coordinates.

Object must contains 2 properties:

      * `latitude` \- latitude. (Float)
      
      * `longitude` \- longitude. (Float)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object