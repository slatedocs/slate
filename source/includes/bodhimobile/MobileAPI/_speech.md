## Speech Module

This module provides the ability to send email and sms messages with
attachments (If device supported its) from [App Storage](#app-storage-module).

### Tasks

  * `init` function
  * `speak` function
  * `silence` function
  * `setLanguage` function
  * `getLanguage` function
  * `isLanguageAvailable` function
  * `isSpeaking` function
  * `setPitch` function
  * `setSpeechRate` function
  * `stop` function
  * `shutdown` function


### Functions

#### init

```javascript
	speech.init().then(function(){
		notifications.showToast("Inited", 3, 'center');
  	}).fail(handleError());
```

`messaging.init( successCallback , failedCallback )`

##### Discussion

The method inits Text to Speech engine in device.

##### Arguments

  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object
  
  
#### speak

```javascript
	var options = {};
	options['queueMode'] = 0;
	speech.speak(options , function(){
            notifications.showToast("Text added", 3, 'bottom');
          }, handleError);	
```

`speech.speak( successCallback , failedCallback )`

##### Discussion

The method speaks the passed in text as synthesized speech.

##### Arguments

* `options` required

Object with key-value. Supported keys:

    * `text`required

A String value. The text for speaking

    * `queueMode` optional

An Integer value. The queue mode for speaking.

0 - QUEUE_ADD is queue mode where the new entry is added at the end of the playback queue 
1 - QUEUE_FLUSH is queue mode where all entries in the playback queue (media to be played and text to be synthesized) are dropped and replaced by the new entry.
    

  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### silence

```javascript
	var options = {};
	options['queueMode'] = 0;
	speech.silence(options , function(){
            notifications.showToast("Silence added", 3, 'bottom');
          }, handleError());	
```

`speech.silence( options, successCallback , failedCallback )`

##### Discussion

The method plays silence for the specified amount of time using the specified queue mode.

##### Arguments

* `options` required

Object with key-value. Supported keys:

    * `silence`required

A Double value. The time of silence in seconds

    * `queueMode` optional

An Integer value. The queue mode for speaking.

0 - QUEUE_ADD is queue mode where the new entry is added at the end of the playback queue 
1 - QUEUE_FLUSH is queue mode where all entries in the playback queue (media to be played and text to be synthesized) are dropped and replaced by the new entry.
    

  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### setLanguage

```javascript
	var options = {};
    options['language'] = 'en_US';
	speech.setLanguage(options , function(){
            notifications.showToast("Language selected", 3, 'bottom');
          }, handleError());	
```

`speech.setLanguage( options, successCallback , failedCallback )`

##### Discussion

The method set Language and Country for TTS. The language codes are two-letter lowercase ISO language codes (such as "en") as defined by ISO 639-1. The country codes are two-letter uppercase ISO country codes (such as "US") as defined by ISO 3166-1.

##### Arguments

* `options` required

Object with key-value. Supported keys:

    * `language`required

A String value. Possible values is en_US , en_GB e.t.c.

  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### getLanguage

```javascript
	speech.getLanguage(function(info){
            notifications.showToast("Language is" + info.language, 3, 'bottom');
          }, handleError());	
```

`speech.getLanguage( successCallback , failedCallback )`

##### Discussion

Returns the current selected language to the `succesCallback` with a properties object as a parameter. That object should have a language property with a String value.

##### Arguments
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### isLanguageAvailable

```javascript
	var options = {};
    options['language'] = 'en_US';
	speech.isLanguageAvailable(options, function(info){
		if ( info.languageAvailable ){
            notifications.showToast("Available", 3, 'bottom');
            }
          }, handleError());	
```

`speech.isLanguageAvailable( options, successCallback , failedCallback )`

##### Discussion

Returns the language availability to the `succesCallback` with a properties object as a parameter. That object should have a languageAvailable property with a Boolean value and means this language is currently supported by the TTS service.

##### Arguments
* `options` required

Object with key-value. Supported keys:

    * `language`required

A String value. Possible values is en_US , en_GB e.t.c.
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### isSpeaking

```javascript
	speech.isSpeaking(function(info){
		if ( info.speaking ){
            notifications.showToast("Busy now", 3, 'bottom');
            }
          }, handleError());	
```

`speech.isSpeaking( successCallback , failedCallback )`

##### Discussion

Returns the speaking status of TTS service to the `succesCallback` with a properties object as a parameter. That object should have a speaking property with a Boolean value.

##### Arguments
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### setPitch

```javascript
	var options = {};
	options['pitch'] = 1.0f;
    speech.setPitch(options).fail( function(){
        notifications.showToast("Pitch error", 3, 'center');
      });
```

`speech.setPitch( options, successCallback , failedCallback )`

##### Discussion

Sets the speech pitch for the TextToSpeech engine.

##### Arguments

* `options` required

Object with key-value. Supported keys:

    * `pitch`required

A Double value. A pitch value
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### setSpeechRate

```javascript
	var options = {};
	options['speechRate'] = 1.0f;
    speech.setSpeechRate(options).fail( function(){
        notifications.showToast("Speech rate error", 3, 'center');
      });
```

`speech.setSpeechRate( options, successCallback , failedCallback )`

##### Discussion

Sets the speech rate.

##### Arguments

* `options` required

Object with key-value. Supported keys:

    * `speechRate`required

A Double value. A speechRate value
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stop

```javascript
	speech.stop().then( function(){
      notifications.showToast("Text speaking is stopped", 3, 'bottom');
    }).fail(handleError());
```

`speech.stop( successCallback , failedCallback )`

##### Discussion

This method stops speaking

##### Arguments
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### shutdown

```javascript
	speech.shutdown().then( function(){
      notifications.showToast("Done", 3, 'bottom');
    }).fail(handleError());
```

`speech.shutdown( successCallback , failedCallback )`

##### Discussion

When you are done using the TextToSpeech instance, call the shutdown() method to release the native resources used by the TextToSpeech engine.

##### Arguments
  
  * `succesCallback`

Success callback. Called when function finished without errors

  * `errorCallback`

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object
