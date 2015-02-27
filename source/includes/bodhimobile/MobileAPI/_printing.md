## Printing Module

This module provides the support for documents printing. Currently working only on iOS with printers which support **AirPrint** technology.

### Tasks

  * `OutputType` constant
  * `Orientation` constant
  * `Duplex` constant
  * `supported` property
  * `getSupportedContentTypes` function
  * `print` function

### Constants

#### OutputType

##### Discussion

The output type, which is an indication of the type of content the application is drawing or providing.

  * `printing.OutputType.GENERAL`

Specifies that the printed content consists of mixed text, graphics, and images.

  * `printing.OutputType.PHOTO`

Specifies that the printed content consists of black-and-white or color images.

  * `printing.OutputType.GRAYSCALE`

Specifies that the printed content is grayscale. Set the output type to this value when your printable content contains no color—for example, it’s black text only.

#### Orientation

##### Discussion

The orientation of printing on a page.

  * `printing.Orientation.PORTRAIT`

Pages are printed in portrait orientation.

  * `printing.Orientation.LANDSCAPE`

Pages are printed in landscape orientation.

#### Duplex

##### Discussion

The duplex mode of a selected printer.

  * `printing.Duplex.NONE`

No double-sided (duplex) printing; single-sided printing only.

  * `printing.Duplex.LONG_EDGE`

Duplex printing that flips the back page along the long edge of the paper.

  * `printing.Duplex.SHORT_EDGE`

Duplex print that flips the back page along the short edge of the paper.

### Properties

#### supported

##### Discussion

```javascript
var supported = printing.supported;
```

Returns whether the device supports printing.

### Functions

#### getSupportedContentTypes

```javascript
printing.getSupportedContentTypes( function(info) {  
    alert("Supported content types: " + info.contentTypes);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`printing.getSupportedContentTypes( successCallback, errorCallback )`

##### Discussion

Returns the list of supported document's content types for printing.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

      * `contentTypes` \- The list of supported document's content types. (Array of Strings)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### print

```javascript
var options = {  
    key: "document_key",  
    outputType: printing.OutputType.GENERAL,  
    orientation: printing.Orientation.PORTRAIT,  
    duplex: printing.Duplex.LONG_EDGE,  
    showsPageRange: false};  
printing.print( options, function(info) {  
    alert("Document printed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`printing.print( options, successCallback, errorCallback )`

##### Discussion

Prints selected document.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `key`

A String value. Chooses document from [App Storage](#app-storage-module) with key

    * `outputType`

See OutputType constants. Chooses output type. By default this property is
**printing.OutputType.GENERAL**

    * `orientation`

See Orientation constants. Chooses orientation of printing on a page. By
default this property is **printing.Orientation.PORTRAIT**

    * `duplex`

See Duplex constants. Chooses the duplex mode of a selected printer. By
default this property is **printing.Duplex.LONG_EDGE**

    * `showsPageRange`

A Boolean value. Prints the page number or not. By default this property is
**false**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always null.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object