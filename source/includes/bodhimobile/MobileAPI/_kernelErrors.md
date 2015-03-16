## Kernel Errors

Contains error codes which returned in parameters in errorCallback

### Tasks

  * `BodhiMobileErrors.Unknown` constant
  * `BodhiMobileErrors.ModuleNotSupported` constant
  * `BodhiMobileErrors.FunctionNotSupported` constant
  * `BodhiMobileErrors.PermissionDenied` constant
  * `BodhiMobileErrors.WrongParameters` constant
  * `BodhiMobileErrors.Timeout` constant
  * `BodhiMobileErrors.Formatting` constant
  * `BodhiMobileErrors.Parsing` constant
  * `BodhiMobileErrors.CancelledByUser` constant
  * `BodhiMobileErrors.NotFound` constant
  * `BodhiMobileErrors.Internal` constant

### Constants

### BodhiMobileErrors.Unknown

##### Discussion

Error with this code returned if unknown error occurred.

### BodhiMobileErrors.ModuleNotSupported

##### Discussion

Error with this code returned if application does not support module. It can
happen if used old version of application.

### BodhiMobileErrors.FunctionNotSupported

##### Discussion

Error with this code returned if application does not support module function.
It can happen if used old version of application or device can not support
this function.

### BodhiMobileErrors.PermissionDenied

##### Discussion

Error with this code returned if application does not have permissions to
access to required feature. For example user can reject access to photos or
location on iOS.

### BodhiMobileErrors.WrongParameters

##### Discussion

Error with this code returned if function's input parameters is wrong or
insufficient.

### BodhiMobileErrors.Timeout

##### Discussion

Error with this code returned if the timeout expired before the results.

### BodhiMobileErrors.Formatting

##### Discussion

Error with this code returned if formatting of input parameters is wrong.

### BodhiMobileErrors.Parsing

##### Discussion

Error with this code returned if function can not parse input parameters.

### BodhiMobileErrors.CancelledByUser

##### Discussion

Error with this code returned if action was cancelled by user. For example
user pressed close button instead selecting photo from library.

### BodhiMobileErrors.NotFound

##### Discussion

Error with this code returned if requested object not found.

### BodhiMobileErrors.Internal

##### Discussion

Error with this code returned if some internal method returned error.
