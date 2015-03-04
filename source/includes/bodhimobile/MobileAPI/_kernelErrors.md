## Kernel Errors

Contains error codes which returned in parameters in errorCallback

### Tasks

  * `RBCErrors.Unknown` constant
  * `RBCErrors.ModuleNotSupported` constant
  * `RBCErrors.FunctionNotSupported` constant
  * `RBCErrors.PermissionDenied` constant
  * `RBCErrors.WrongParameters` constant
  * `RBCErrors.Timeout` constant
  * `RBCErrors.Formatting` constant
  * `RBCErrors.Parsing` constant
  * `RBCErrors.CancelledByUser` constant
  * `RBCErrors.NotFound` constant
  * `RBCErrors.Internal` constant

### Constants

### RBCErrors.Unknown

##### Discussion

Error with this code returned if unknown error occurred.

### RBCErrors.ModuleNotSupported

##### Discussion

Error with this code returned if application does not support module. It can
happen if used old version of application.

### RBCErrors.FunctionNotSupported

##### Discussion

Error with this code returned if application does not support module function.
It can happen if used old version of application or device can not support
this function.

### RBCErrors.PermissionDenied

##### Discussion

Error with this code returned if application does not have permissions to
access to required feature. For example user can reject access to photos or
location on iOS.

### RBCErrors.WrongParameters

##### Discussion

Error with this code returned if function's input parameters is wrong or
insufficient.

### RBCErrors.Timeout

##### Discussion

Error with this code returned if the timeout expired before the results.

### RBCErrors.Formatting

##### Discussion

Error with this code returned if formatting of input parameters is wrong.

### RBCErrors.Parsing

##### Discussion

Error with this code returned if function can not parse input parameters.

### RBCErrors.CancelledByUser

##### Discussion

Error with this code returned if action was cancelled by user. For example
user pressed close button instead selecting photo from library.

### RBCErrors.NotFound

##### Discussion

Error with this code returned if requested object not found.

### RBCErrors.Internal

##### Discussion

Error with this code returned if some internal method returned error.
