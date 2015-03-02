## NFC Module

This module provides the ability to read and write NDEF messages to tags or share NDEF messages with peers.

### Tasks

  
  * `write` function
  * `share` function
  * `unshare` function
  * `erase` function
  * `addTagDiscoveredListener` function
  * `removeTagDiscoveredListener` function
  * `addNdefListener` function
  * `removeNdefListener` function
  * `addNdefFormatableListener` function  
  * `handover` function
  * `stopHandover` function
  * `nfc.ndef` event
  * `nfc.ndefformatable` event
  * `nfc.tagdiscovered` event
  
  
### Functions


#### write

```javascript
	var message = [
        ndef.textRecord("hello, world"),
        ndef.uriRecord("http://www.google.com")
    ];
	nfc.write(message, errorCallback);
```

`nfc.write(message, errorCallback);`

##### Discussion

Writes an NDEF Message to a NFC tag.	

##### Arguments

	* `errorCallback` optional

Error Callback. Called when function return error.

	* `message` required

A NDEF Message is an array of one or more NDEF Records
    

#### share

```javascript
var message = [
        ndef.textRecord("hello, world"),
        ndef.uriRecord("http://www.google.com")
    ];
	nfc.share(message, errorCallback);
```

`nfc.share(message, errorCallback);`

##### Discussion

Function writes an NdefMessage via peer-to-peer.  This should appear as an NFC tag to another device.

##### Arguments

	* `errorCallback` optional

Error Callback. Called when function return error.

	* `message` required

A NDEF Message is an array of one or more NDEF Records


#### unshare

```javascript
	nfc.unshare(errorCallback);
```

`nfc.unshare(errorCallback);`

##### Discussion

Stop sharing NDEF data via peer-to-peer.

##### Arguments

	* `errorCallback` optional

Error Callback. Called when function return error.

#### erase

```javascript
nfc.erase(errorCallback);
```

`nfc.erase(errorCallback);`

##### Discussion

Erase a tag by writing an empty message.  Will format unformatted tags before writing.

##### Arguments

	* `errorCallback` optional

Error Callback. Called when function return error.


#### handover

```javascript
	var uri = "content://media/external/image/media/15";
    nfc.handover(uri, errorCallback);
	var uris = [
        "content://media/external/image/media/15",
        "content://media/external/image/media/126",
        "content://media/external/image/media/345"
    ];
    nfc.handover(uris, errorCallback);
```

`nfc.handover(uris, errorCallback);`

##### Discussion

Send a file to another device via NFC handover. Function shares files to a NFC peer using handover. Files are sent by specifying a file:// or context:// URI or a list of URIs. The file transfer is initiated with NFC but the transfer is completed with over Bluetooth or WiFi which is handled by a NFC handover request. The Android code is responsible for building the handover NFC Message. Supported only on Android

##### Arguments

	* `errorCallback` optional

Error Callback. Called when function return error.

	* `uris` required

A URI as a String, or an *array* of URIs.

#### stopHandover

`nfc.stopHandover(errorCallback);`

##### Discussion

Stop sharing NDEF data via NFC handover.

##### Arguments

* `errorCallback` optional

Error Callback. Called when function return error.

#### addNdefListener

`nfc.addNdefListener(callback);`

##### Discussion

Registers an event listener for any NDEF tag.

##### Arguments

	* `callback` required

The callback that is called when an NDEF tag is read.

#### removeNdefListener

`nfc.removeNdefListener(callback);`

##### Discussion

Removes the event listener for NDEF tags added via `nfc.addNdefListener`.

##### Arguments
	
	* `callback` required

The callback that is called when the listener is successfully removed.

#### addNdefFormatableListener

`nfc.addNdefFormatableListener(callback);`

##### Discussion

Registers an event listener for formatable NDEF tags.

##### Arguments

	* `callback` required

The callback that is called when NDEF formatable tag is read.


#### addTagDiscoveredListener

`nfc.addTagDiscoveredListener(callback);`

##### Discussion

Registers the callback for tag events.

This event occurs when any tag is detected by the phone.

##### Arguments

	* `callback` required

The callback that is called when a tag is detected.

#### removeTagDiscoveredListener

`nfc.removeTagDiscoveredListener(callback);`

##### Discussion

Removes the event listener added via `nfc.addTagDiscoveredListener`.

##### Arguments

* `callback` required

The callback that is called when the listener is successfully removed.


### Events

#### nfc.ndef

##### Discussion
A ndef event is fired when a NDEF tag is read.

#### nfc.ndefformatable

##### Discussion
A ndef-formatable event occurs when a tag is read that can be NDEF formatted. This is not fired for tags that are already formatted as NDEF. The ndef-formatable event will not contain an NdefMessage.

#### nfc.tagdiscovered

##### Discussion
Tagdiscovered event occurs when any tag is detected by the phone.