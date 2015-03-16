## Archiving Module

This module provides the ability to working with zip archives.

Developer can create new zip archive with files from [App Storage](#app-storage-module)
and extract files from zip archive (which saved in [App Storage](#app-storage-module)).

### Tasks

  * `zip` function
  * `unzip` function

### Functions

#### zip

```javascript
archiving.zip( {archive:"zip1_key", password:"12345", files:[{key:"image1",
name:"image.jpg"}]},  
function(info) {  
    alert("Zip Archive created");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`archiving.zip( options, successCallback, errorCallback )`

##### Discussion

Create new zip archive with files from [App Storage](#app-storage-module).

Developer can create archive with selected files (options must contains
`files` key) or can add all files in [App Storage](#app-storage-module) with keys which
contains prefix in the start (options must contains `filesWithPrefix` key).

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `archive`

A String value. The key must contains zip archive name (The key in [App
Storage](#app-storage-module)).

    * `password`

A String value. The key can contains password for zip archive.

    * `files`

An Array of Objects. The key can contains the list of files which will be
added to zip archive.

Each item must contains 2 properties:

      * `key` \- the key in [App Storage](#app-storage-module) which contains file. (String)

      * `name` \- the name of file in zip archive. (String)

Can contains full path with folders e.g. "foder1/file1.txt"

    * `filesWithPrefix`

A String value. All files in [App Storage](#app-storage-module) with keys which
contains prefix in the start of string will be added to zip archive.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always null.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object

#### unzip

```javascript
archiving.unzip( {archive:"zip1_key", password:"12345", prefix:"zip1_files"},  
function(info) {  
    alert("Files unzipped: "+info.keys);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`archiving.unzip( options, successCallback, errorCallback )`

##### Discussion

Extract files from zip archive to [App Storage](#app-storage-module).

If `prefix` key in `options` exist all keys for extracted files will started
from prefix.

For example zip file contains 2 files:

  1. file1.txt
  2. folder1/file1.txt
After unzipping will be created keys:

  1. prefix/file1.txt
  2. prefix/folder1/file1.txt

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `archive`

A String value. The key must contains zip archive name (The key in [App Storage](#app-storage-module)).

    * `password`

A String value. The key can contains password for zip archive.

    * `prefix`

A String value. All keys for extracted files will started from this prefix.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains keys:

    * `keys` \- Contains all keys for extracted files. (Array of Strings)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object