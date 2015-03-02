## Cryptography Module

This module contains cryptographic methods.

### Tasks

  * `hash` function

### Functions

#### hash

```javascript
cryptography.hash( {data:"string", hash:"md5"},  
function(info) {  
    alert("md5('string') = "+info.hash);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`cryptography.hash( options, successCallback, errorCallback )`

##### Discussion

Computes the hash of a string

##### Arguments

  * `options`required

Object with key-value. Supported keys:

    * `data`

A String value. The key must contains string to compute the hash.

    * `hash`

A String value. The key must contains hash algorithm.

Supported algorithms:

      * **md5**

      * **sha1**
      
      * **sha-256**
      
      * **sha-384**
      
      * **sha-512**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains keys:

    * `hash` \- Contains computed the hash. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object