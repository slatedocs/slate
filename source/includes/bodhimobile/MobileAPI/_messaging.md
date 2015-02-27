## Messaging Module

This module provides the ability to send email and sms messages with
attachments (If device supported its) from [App Storage](#app-storage-module).

### Tasks

  * `supportAttachments` function
  * `sms` function
  * `email` function

### Functions

#### supportAttachments

```javascript
messaging.supportAttachments( function(info) {  
    if (info.sms && info.email) {  
        alert("SMS and Email attachments supported");  
    } else if (info.sms) {  
        alert("SMS attachments supported");  
    } else if (info.email) {  
        alert("Email attachments supported");  
    } else {  
        alert("Attachments doesn't supported");  
    }  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`messaging.supportAttachments( successCallback, errorCallback )`

##### Discussion

The method returns information about whether attachments are supported in SMS and email.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains keys:

    * `sms` \- True if application support attachments for SMS (or iMessage). (Boolean)
    * `email` \- True if application support attachments for Email. (Boolean)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### sms

```javascript
messaging.sms( {to:["+1111111"], body:"Message Text", attachments:["image_key"]}, 
function(info) {  
    alert("SMS sent successfully.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`messaging.sms( options, successCallback, errorCallback )`

##### Discussion

The method opens a new sms composer window with predefined values.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `to`

An Array of Strings. The key can contains the list of recipients.

    * `body`

A String value. The key can contains SMS message text.

    * `attachments`

An Array of Strings. The key can contains the list of keys from [App Storage](#app-storage-module) which will be added as attachments.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always null.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### email

```javascript
messaging.email( {to:["test@test.com"], subject:"Test Email", body:"Email Message Text", attachments:["image_key"]},
function(info) {  
    alert("Email sent successfully.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`messaging.email( options, successCallback, errorCallback )`

##### Discussion

The method opens a new email composer window with predefined values.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `to`

An Array of Strings. The key can contains the list of recipients.

    * `cc`

An Array of Strings. The key can contains the list of secondary (carbon copy)
recipients.

    * `bcc`

An Array of Strings. The key can contains the list of hidden secondary (blind
carbon copy) recipients.

    * `subject`

A String value. The key can contains Email subject.

    * `body`

A String value. The key can contains Email message text.

    * `attachments`

An Array of Strings. The key can contains the list of keys from [App Storage](#app-storage-module) which will be added as attachments.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always null.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object