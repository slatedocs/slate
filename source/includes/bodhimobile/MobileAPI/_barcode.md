## Bar Code Module

This module provides the ability to scanning barcodes.

### Tasks

  * `barcode.TYPES` constant
  * `scan` function

### Constants

#### barcode.TYPES

##### Discussion

This enum contains variants of supported bar- or qr- codes.

  * `barcode.TYPES.QRCODE`

Will be recognized only QR codes.

  * `barcode.TYPES.BARCODE`

Will be recognized only Bar Codes.

### Functions

#### scan

```javascript
barcode.scan( {"type":barcode.TYPES.QRCODE}, function(info) {  
    alert("QR Code recognized: "+info.code);  
}, function (error) {  
    alert("code: " \+ error.code + "\nmessage: " \+ error.message);  
});
```

`barcode.scan( options, successCallback, errorCallback )`

##### Discussion

Recognize bar- or qr- codes.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `type`

See TYPES constants. Chooses supported codes. If not selected recorgnize all
supported codes.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

      * `code` \- Recognized bar- or qr- code. (String)

      * `image` \- Optional image with recognized bar- or qr- code. Working only on iOS. 

      * `data` \- Image data in base64 format. (String)

      * `contentType` \- Content Type of the data. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object