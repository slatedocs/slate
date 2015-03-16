## Voice Module

This module provides access to the speech recognition service.

### Tasks

  * `isRecognitionAvailable` function
  * `recognize` function
  * `stop` function

### Functions

#### isRecognitionAvailable

`voice.isRecognitionAvailable( successCallback , failedCallback )`

##### Discussion

This method checks that Voice recognition available

##### Arguments

  * `succesCallback`

Success callback. Called when function finished without errors

Callback parameter is object which contains key:

    * `available` \- True if application support voice recognition. (Boolean)
    

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object
  
  
#### recognize

```javascript
	var voiceLastRecognizeId = voice.recognize(function(result) {
        started = false;
        recognitionWriteResult(result);
    }, handleError());
```

`voice.recognize( successCallback , failedCallback )`

##### Discussion

This method starts recognizing. For continues recognizing you have call this method after every received results in successCallback (or you will get only 1 recognized result).

##### Arguments

  * `succesCallback`

Success callback. Called when function finished without errors. Callback parameter is object which contains key:

    * `recognized` \- Value with recognized text. (String)

  * `failedCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * A String value. This value used as parameter of `stop` method to stop updating.
  

#### stop

```javascript
	voice.stop(voiceLastRecognizeId, function() {
        notifications.showToast("Voice recognition is stopped", 3, 'center');
    }, handleError());
```

`voice.stop( successCallback , failedCallback )`

##### Discussion

This method stops recognizing.

##### Arguments

  * `succesCallback`

Success callback.

  * `failedCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object