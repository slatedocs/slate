## Camera Module

This module provides the ability to taking photos and videos from camera and getting its from photo album.

Developer can receive photo's data directly to html in base64 format and can save photo and video file to [App Storage](#app-storage-module).

### Tasks

  * `DestinationType` constant
  * `EncodingType` constant
  * `MediaType` constant
  * `PictureSourceType` constant
  * `Direction` constant
  * `getMedia` function
  * `takeMedia` function
  * `chooseMedia` function
  * `recordVideo` function
  * `chooseVideo` function
  * `capturePhoto` function
  * `choosePhoto` function
  * `cleanup` function

### Constants

#### DestinationType

##### Discussion

This enum contains all variants of saving media content.

  * `camera.DestinationType.DATA_URL`

With this destination type methods will return photos directly to html in base64 encoding.

This type supported only for photos. Videos is too large for it.

  * `camera.DestinationType.APP_STORAGE`

With this destination type methods will save photos or video to [App Storage](#app-storage-module).

#### EncodingType

##### Discussion

This enum contains variants of photos file's encoding. Used only for image content.

  * `camera.EncodingType.JPEG`

Photo will encoded in jpeg format.

  * `camera.EncodingType.PNG`

Photo will encoded in png format.

#### MediaType

##### Discussion

This enum contains variants of media to select from.

  * `camera.MediaType.PICTURE`

Allows selection of still pictures only.

  * `camera.MediaType.VIDEO`

Allows selection of video only.

  * `camera.MediaType.ALLMEDIA`

Allows selection from all media types.

#### PictureSourceType

##### Discussion

This enum contains variants of sources.

  * `camera.PictureSourceType.PHOTOLIBRARY`

Chooses media from photo library.

  * `camera.PictureSourceType.CAMERA`

Takes media from camera.

  * `camera.PictureSourceType.SAVEDPHOTOALBUM`

Chooses media from saved photo album.

#### Direction

##### Discussion

Chooses the camera to use (front- or back-facing).

  * `camera.Direction.BACK`

Chooses back camera to use.

  * `camera.Direction.FRONT`

Chooses front camera to use.

### Functions

#### getMedia

```javascript
var options = {  
    quality: 50,  
    destinationType: camera.DestinationType.APP_STORAGE,  
    sourceType: camera.PictureSourceType.CAMERA,  
    encodingType: camera.EncodingType.JPEG,  
    mediaType: camera.MediaType.PICTURE,  
    allowEdit: true,  
    saveToPhotoAlbum: true,  
    cameraDirection: camera.Direction.BACK};  
camera.getMedia( options, function(info) {  
    alert("Image saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.getMedia( options, successCallback, errorCallback )`

##### Discussion

The method allows taking or choosing all types of media.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `destinationType`

See DestinationType constants. Chooses destination for saving media. By default this property is **camera.DestinationType.APP_STORAGE**

    * `sourceType`

See PictureSourceType constants. Chooses media source. By default this property is **camera.PictureSourceType.CAMERA**

    * `encodingType`

See EncodingType constants. Chooses photos file's encoding. Used only for image content. By default this property is **camera.EncodingType.JPEG**

    * `mediaType`

See MediaType constants. Chooses supported type of media. By default this property is **camera.MediaType.PICTURE**

    * `cameraDirection`

See Direction constants. Chooses the camera to use. By default this property is **camera.Direction.BACK**

    * `quality`

An Interger value. The value range is 0-100. Chooses quality for jpeg. By default this property is **50**.

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)

    * `contentType` \- Content Type of the data. (String)
    
    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### takeMedia

```javascript
var options = {  
    quality: 50,  
    destinationType: camera.DestinationType.APP_STORAGE,  
    encodingType: camera.EncodingType.JPEG,  
    mediaType: camera.MediaType.PICTURE,  
    allowEdit: true,  
    saveToPhotoAlbum: true,  
    cameraDirection: camera.Direction.BACK};  
camera.takeMedia( options, function(info) {  
    alert("Image saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.takeMedia( options, successCallback, errorCallback )`

##### Discussion

The method allows taking all types of media. It use [getMedia](#getmedia) method with predefined options.sourceType = **camera.PictureSourceType.CAMERA**

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `destinationType`

See DestinationType constants. Chooses destination for saving media. By default this property is **camera.DestinationType.APP_STORAGE**

    * `encodingType`

See EncodingType constants. Chooses photos file's encoding. Used only for image content. By default this property is **camera.EncodingType.JPEG**

    * `mediaType`

See MediaType constants. Chooses supported type of media. By default this property is **camera.MediaType.PICTURE**

    * `cameraDirection`

See Direction constants. Chooses the camera to use. By default this property is **camera.Direction.BACK**

    * `quality`

An Interger value. The value range is 0-100. Chooses quality for jpeg. By default this property is **50**.

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)

    * `contentType` \- Content Type of the data. (String)

    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### chooseMedia

```javascript
var options = {  
    quality: 50,  
    destinationType: camera.DestinationType.APP_STORAGE,  
    encodingType: camera.EncodingType.JPEG,  
    mediaType: camera.MediaType.PICTURE,  
    allowEdit: true,  
    saveToPhotoAlbum: true,  
    cameraDirection: camera.Direction.BACK};  
camera.chooseMedia( options, function(info) {  
    alert("Image saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.chooseMedia( options, successCallback, errorCallback )`

##### Discussion

The method allows choosing all types of media. It use [getMedia](#getmedia) method with predefined options.sourceType = **camera.PictureSourceType.PHOTOLIBRARY**

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `destinationType`

See DestinationType constants. Chooses destination for saving media. By
default this property is **camera.DestinationType.APP_STORAGE**

    * `encodingType`

See EncodingType constants. Chooses photos file's encoding. Used only for
image content. By default this property is **camera.EncodingType.JPEG**

    * `mediaType`

See MediaType constants. Chooses supported type of media. By default this
property is **camera.MediaType.PICTURE**

    * `quality`

An Interger value. The value range is 0-100. Chooses quality for jpeg. By
default this property is **50**.

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default
this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this
property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)
    
    * `contentType` \- Content Type of the data. (String)
    
    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### recordVideo

```javascript
var options = {  
    destinationType: camera.DestinationType.APP_STORAGE,  
    allowEdit: true,  
    saveToPhotoAlbum: true,  
    cameraDirection: camera.Direction.BACK};  
camera.recordVideo( options, function(info) {  
    alert("Video saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.recordVideo( options, successCallback, errorCallback )`

##### Discussion

The method allows recording video from camera. It use [takeMedia](#takemedia) method with predefined options.mediaType = **camera.MediaType.VIDEO**

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `cameraDirection`

See Direction constants. Chooses the camera to use. By default this property
is **camera.Direction.BACK**

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default
this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this
property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)
    
    * `contentType` \- Content Type of the data. (String)
    
    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### chooseVideo

```javascript
var options = {  
    destinationType: camera.DestinationType.APP_STORAGE,  
    allowEdit: true,  
    saveToPhotoAlbum: true};  
camera.chooseVideo( options, function(info) {  
    alert("Video saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.chooseVideo( options, successCallback, errorCallback )`

##### Discussion

The method allows choosing video from photo library. It use [chooseMedia](#choosemedia) method with predefined options.mediaType = **camera.MediaType.VIDEO**

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default
this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this
property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)
    
    * `contentType` \- Content Type of the data. (String)
    
    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback_optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### capturePhoto

```javascript
var options = {  
    quality: 50,  
    destinationType: camera.DestinationType.APP_STORAGE,  
    encodingType: camera.EncodingType.JPEG,  
    allowEdit: true,  
    saveToPhotoAlbum: true,  
    cameraDirection: camera.Direction.BACK};  
camera.capturePhoto( options, function(info) {  
    alert("Image saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.capturePhoto( options, successCallback, errorCallback )`

##### Discussion

The method allows capturing photo from camera. It use [takeMedia](#takemedia) method with predefined options.mediaType = **camera.MediaType.PICTURE**

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `destinationType`

See DestinationType constants. Chooses destination for saving media. By
default this property is **camera.DestinationType.APP_STORAGE**

    * `encodingType`

See EncodingType constants. Chooses photos file's encoding. Used only for
image content. By default this property is **camera.EncodingType.JPEG**

    * `cameraDirection`

See Direction constants. Chooses the camera to use. By default this property
is **camera.Direction.BACK**

    * `quality`

An Interger value. The value range is 0-100. Chooses quality for jpeg. By
default this property is **50**.

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default
this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this
property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)
    
    * `contentType` \- Content Type of the data. (String)
    
    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### choosePhoto

```javascript
var options = {  
    quality: 50,  
    destinationType: camera.DestinationType.APP_STORAGE,  
    encodingType: camera.EncodingType.JPEG,  
    allowEdit: true,  
    saveToPhotoAlbum: true};  
camera.choosePhoto( options, function(info) {  
    alert("Image saved for key: "+info.key);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.choosePhoto( options, successCallback, errorCallback )`

##### Discussion

The method allows choosing photo from photo library. It use [chooseMedia](#choosemedia) method with predefined options.mediaType = **camera.MediaType.PICTURE**

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `destinationTyp`

See DestinationType constants. Chooses destination for saving media. By
default this property is **camera.DestinationType.APP_STORAGE**

    * `encodingType`

See EncodingType constants. Chooses photos file's encoding. Used only for
image content. By default this property is **camera.EncodingType.JPEG**

    * `quality`

An Interger value. The value range is 0-100. Chooses quality for jpeg. By
default this property is **50**.

    * `allowEdit`

A Boolean value. Allows editing media after taking or choosing. By default
this property is **true**

    * `saveToPhotoAlbum`

A Boolean value. Save media to photo album after taking it. By default this
property is **true**

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `data` \- Data in base64 returned if destinationType is equal to **camera.DestinationType.DATA_URL**. (String)
    
    * `contentType` \- Content Type of the data. (String)
    
    * `key` \- The key in [App Storage](#app-storage-module) which was saved for media. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### cleanup

```javascript
camera.cleanup( function(info) {  
    alert("All media was deleted");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`camera.cleanup( successCallback, errorCallback )`

##### Discussion

Cleanup all records with media from [Camera](#camera-module) in [App Storage](#app-storage-module)

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always null.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object