###### Kernel Promise

Virtually all functions in modules return instance of RBCPromise object.  
With it you can easy add success and finished callbacks for the function.

### Tasks

  * `then` function
  * `fail` function
  * `success` function

### Here is Video
<iframe src="https://www.youtube.com/embed/PhAZn_eW9KQ" frameborder="0" allowfullscreen></iframe>

### Functions

#### then

```javascript
someModule.someFunction().then( function(info) {  
    alert("Function complete");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCPromise.then( succesCallback, errorCallback )`

###### Discussion

Add success (`succesCallback`) and error (`errorCallback`) callbacks to the
callback's list associated for the function.  
When function will receive the results from application this callbacks will be
called.

###### Arguments

  * `succesCallback`  required

Success callback. Called when function finished without errors

  * `errorCallback` optional

Error Callback. Called when function return error.

###### Return Value

  * `this`

#### fail

```javascript
someModule.someFunction().fail( function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCPromise.fail( errorCallback )`

##### Discussion

Add `errorCallback` to the callback's list associated for the function.  
If function will receive error results from application this callback will be
called.

##### Arguments

  * `errorCallback` required

Error Callback. Called when function return error.

##### Return Value

  * `this`

#### success

```javascript
someModule.someFunction().success( function(info) {  
    alert("Function complete");  
});
```

`RBCPromise.success( succesCallback )`

##### Discussion

Add `succesCallback` to the callback's list associated for the function.  
If function will receive success results from application this callbacks will
be called.

##### Arguments

  * `succesCallback` required

Success callback. Called when function finished without errors

##### Return Value

  * `this`