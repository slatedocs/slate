# Reference

<aside class="notice">This error section is stored in a separate file in `includes/_errors.md`. Slate allows you to optionally separate out your docs into many files...just save them to the `includes` folder and add them to the top of your `index.md`'s frontmatter. Files are included in the order listed.</aside>

The REST API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The kitten requested is hidden for administrators only
404 | Not Found -- The specified kitten could not be found
405 | Method Not Allowed -- You tried to access a kitten with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The kitten requested has been removed from our servers
418 | I'm a teapot
429 | Too Many Requests -- You're requesting too many kittens! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

## Response Message Reference


### MessageId: Base.{version}.AccessDenied

While attempting to access, connect to, or transfer to/from another resource, the service was denied access.

**Severity**:    Critical

**Resolution**:  Verify that the URI is correct and that the service has the appropriate credentials.

```json

{
    "Description": "While attempting to access, connect to, or transfer to/from another resource, the service was denied access.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "While attempting to establish a connection to %1, the service was denied access.", 
    "Resolution": "Verify that the URI is correct and that the service has the appropriate credentials.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.AccountForSessionNoLongerExists

The account for current session is removed and the current session is also removed.

**Severity**:    OK

**Resolution**:  Attempt to connect using a valid account.

```json

{
    "Message": "The account for the session is removed and the current session is also removed.", 
    "NumberOfArgs": 0, 
    "Resolution": "Attempt to connect using a valid account.", 
    "Description": "The account for current session is removed and the current session is also removed.", 
    "Severity": "OK"
}

```

### MessageId: Base.{version}.AccountModified

The account was modified successfully.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Message": "The account was modified successfully.", 
    "NumberOfArgs": 0, 
    "Resolution": "None.", 
    "Description": "The account was modified successfully.", 
    "Severity": "OK"
}

```

### MessageId: Base.{version}.AccountNotModified

The request was unable to modify the account.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, check the authorization or the request body for issues and resubmit the request.

```json

{
    "Message": "The account modification request did not complete.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, check the authorization or the request body for issues and resubmit the request.", 
    "Description": "The request was unable to modify the account.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.AccountRemoved

The account was removed successfully.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Message": "The account was removed successfully.", 
    "NumberOfArgs": 0, 
    "Resolution": "None.", 
    "Description": "The account was removed successfully.", 
    "Severity": "OK"
}

```

### MessageId: Base.{version}.ActionNotSupported

The action supplied in the POST operation is not supported by the resource.

**Severity**:    Critical

**Resolution**:  The action was invalid or the wrong resource was the target. See the implementation documentation for assistance.

```json

{
    "Description": "The action supplied in the POST operation is not supported by the resource.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The action %1 is not supported by the resource.", 
    "Resolution": "The action was invalid or the wrong resource was the target. See the implementation documentation for assistance.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ActionParameterDuplicate

The action was submitted with a duplicate parameter in the request body.

**Severity**:    Warning

**Resolution**:  Resubmit the action with only one instance of the parameter in the request body.

```json

{
    "Description": "The action was submitted with a duplicate parameter in the request body.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The action %1 was submitted with more than one value for the parameter %2.", 
    "Resolution": "Resubmit the action with only one instance of the parameter in the request body.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.ActionParameterMissing

The requested action is missing a parameter that is required to process the action.

**Severity**:    Critical

**Resolution**:  Resubmit the action with the required parameter in the request body.

```json

{
    "Description": "The requested action is missing a parameter that is required to process the action.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The action %1 requires that the parameter %2 be present in the request body.", 
    "Resolution": "Resubmit the action with the required parameter in the request body.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ActionParameterNotSupported

The action parameter is not supported on the target resource.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, remove the parameter and resubmit the request.

```json

{
    "Description": "The action parameter is not supported on the target resource.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The parameter %1 for the action %2 is not supported on the target resource.", 
    "Resolution": "If the operation did not complete, remove the parameter and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.ActionParameterUnknown

An action was submitted, but a supplied parameter did not match any of the known parameters.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the invalid parameter and resubmit the request.

```json

{
    "Description": "An action was submitted, but a supplied parameter did not match any of the known parameters.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The action %1 was submitted with the invalid parameter %2.", 
    "Resolution": "If the operation did not complete, correct the invalid parameter and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.ActionParameterValueFormatError

The value type is correct, but the format is not supported or the size/length is exceeded

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the parameter value in the request body and resubmit the request.

```json

{
    "Description": "The value type is correct, but the format is not supported or the size/length is exceeded", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the parameter %2 in the action %3 is in a format that is not supported by the parameter.", 
    "Resolution": "If the operation did not complete, correct the parameter value in the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.ActionParameterValueTypeError

The parameter contains an incorrect value type. For example, a number value for a string parameter type.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the parameter value in the request body and resubmit the request.

```json

{
    "Description": "The parameter contains an incorrect value type. For example, a number value for a string parameter type.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the parameter %2 in the action %3 is the incorrect parameter type.", 
    "Resolution": "If the operation did not complete, correct the parameter value in the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.CouldNotEstablishConnection

An attempt to access the resource, image, or file at the URI was unsuccessful because a session could not be established.

**Severity**:    Critical

**Resolution**:  Verify that the URI contains a valid and reachable node name, protocol information, and other URI components.

```json

{
    "Description": "An attempt to access the resource, image, or file at the URI was unsuccessful because a session could not be established.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The service was unable to establish a connection with the URI %1.", 
    "Resolution": "Verify that the URI contains a valid and reachable node name, protocol information, and other URI components.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.CreateFailedMissingReqProperties

A create operation was attempted on a resource, but a required property was missing from the request.

**Severity**:    Critical

**Resolution**:  If the operation did not complete, include the required property with a valid value in the request body and resubmit the request.

```json

{
    "Description": "A create operation was attempted on a resource, but a required property was missing from the request.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The create operation did not complete because the required property %1 was missing from the request.", 
    "Resolution": "If the operation did not complete, include the required property with a valid value in the request body and resubmit the request.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.CreateLimitReachedForResource

No more resources can be created.

**Severity**:    Critical

**Resolution**:  If the operation did not complete, delete resources and resubmit the request.

```json

{
    "Message": "No more resources can be created.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, delete resources and resubmit the request.", 
    "Description": "No more resources can be created.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.Created

The resource has been created successfully.

**Severity**:    OK

**Resolution**:  None

```json

{
    "Message": "The resource has been created successfully.", 
    "NumberOfArgs": 0, 
    "Resolution": "None", 
    "Description": "The resource has been created successfully.", 
    "Severity": "OK"
}

```

### MessageId: Base.{version}.EventSubscriptionLimitExceeded

The event subscription establishment has been requested, but the operation did not complete because the number of simultaneous subscriptions exceeded the maximum number allowed by the implementation.

**Severity**:    Critical

**Resolution**:  Before attempting to establish the event subscription, reduce the number of subscriptions or increase the maximum number of simultaneous subscriptions allowed (if supported).

```json

{
    "Message": "The event subscription did not complete because the number of simultaneous subscriptions exceeded the maximum number allowed by the implementation.", 
    "NumberOfArgs": 0, 
    "Resolution": "Before attempting to establish the event subscription, reduce the number of subscriptions or increase the maximum number of simultaneous subscriptions allowed (if supported).", 
    "Description": "The event subscription establishment has been requested, but the operation did not complete because the number of simultaneous subscriptions exceeded the maximum number allowed by the implementation.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.InsufficientPrivilege

The account or credentials associated with the current session are not authorized to perform the requested operation.

**Severity**:    Critical

**Resolution**:  Retry the operation with an authorized account or credentials.

```json

{
    "Message": "The account or the credentials associated with the current session are authorized to perform the requested operation.", 
    "NumberOfArgs": 0, 
    "Resolution": "Retry the operation with an authorized account or credentials.", 
    "Description": "The account or credentials associated with the current session are not authorized to perform the requested operation.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.InternalError

The request did not complete due to an unknown internal error, but the service is still operational.

**Severity**:    Critical

**Resolution**:  Resubmit the request. If the problem persists, consider resetting the service.

```json

{
    "Message": "The request failed due to an internal service error, but the service is still operational.", 
    "NumberOfArgs": 0, 
    "Resolution": "Resubmit the request. If the problem persists, consider resetting the service.", 
    "Description": "The request did not complete due to an unknown internal error, but the service is still operational.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.InvalidObject

The object is not valid.

**Severity**:    Critical

**Resolution**:  If the operation did not complete, the object is malformed or the URI is incorrect. Make the appropriate corrections and resubmit the request.

```json

{
    "Description": "The object is not valid.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The object at %1 is not valid.", 
    "Resolution": "If the operation did not complete, the object is malformed or the URI is incorrect. Make the appropriate corrections and resubmit the request.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.MalformedJSON

The request body contains malformed JSON.

**Severity**:    Critical

**Resolution**:  Verify that the request body is valid JSON and resubmit the request.

```json

{
    "Message": "The request body submitted is malformed JSON and cannot be parsed by the receiving service.", 
    "NumberOfArgs": 0, 
    "Resolution": "Verify that the request body is valid JSON and resubmit the request.", 
    "Description": "The request body contains malformed JSON.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.NoValidSession

The operation did not complete because a valid session is required in order to access resources.

**Severity**:    Critical

**Resolution**:  Establish a session before attempting any operations.

```json

{
    "Message": "There is no valid session established with the implementation.", 
    "NumberOfArgs": 0, 
    "Resolution": "Establish a session before attempting any operations.", 
    "Description": "The operation did not complete because a valid session is required in order to access resources.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.PropertyDuplicate

A duplicate property is in the request body.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, remove the duplicate property from the request body and resubmit the request.

```json

{
    "Description": "A duplicate property is in the request body.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The property %1 is duplicated in the request.", 
    "Resolution": "If the operation did not complete, remove the duplicate property from the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.PropertyMissing

The request does not include a required property.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, verify the property is in the request body and has a valid value.

```json

{
    "Description": "The request does not include a required property.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The property %1 is a required property and must be included in the request.", 
    "Resolution": "If the operation did not complete, verify the property is in the request body and has a valid value.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.PropertyNotWritable

The request included a value for a read-only property.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, remove the property from the request body and resubmit the request.

```json

{
    "Description": "The request included a value for a read-only property.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The property %1 is a read-only property and cannot be assigned a value.", 
    "Resolution": "If the operation did not complete, remove the property from the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.PropertyUnknown

An unknown property is in the request body.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, remove the unknown property from the request body and resubmit the request.

```json

{
    "Description": "An unknown property is in the request body.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The property %1 is not valid for this resource.", 
    "Resolution": "If the operation did not complete, remove the unknown property from the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.PropertyValueFormatError

The value type is correct, but the format is not supported or the size/length is exceeded.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the property value in the request body and resubmit the request.

```json

{
    "Description": "The value type is correct, but the format is not supported or the size/length is exceeded.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is in a format that is not supported by the property.", 
    "Resolution": "If the operation did not complete, correct the property value in the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.PropertyValueNotInList

The value type is correct, but the value is not supported.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, choose a value from the enumeration list and resubmit your request.

```json

{
    "Description": "The value type is correct, but the value is not supported.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is not valid.", 
    "Resolution": "If the operation did not complete, choose a value from the enumeration list and resubmit your request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.PropertyValueTypeError

The property value contains an incorrect property type. For example, a number value for a string property type.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the property value in the request body and resubmit the request.

```json

{
    "Description": "The property value contains an incorrect property type. For example, a number value for a string property type.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is the incorrect property type.", 
    "Resolution": "If the operation did not complete, correct the property value in the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.QueryNotSupported

The query is not supported by the implementation.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, remove the query parameter and resubmit the request.

```json

{
    "Message": "Querying is not supported by the implementation.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, remove the query parameter and resubmit the request.", 
    "Description": "The query is not supported by the implementation.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.QueryNotSupportedOnResource

The query is not supported on the resource. For example, a start/count query is attempted on a resource that is not a collection.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, remove the query parameters and resubmit the request.

```json

{
    "Message": "Querying is not supported on the requested resource.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, remove the query parameters and resubmit the request.", 
    "Description": "The query is not supported on the resource. For example, a start/count query is attempted on a resource that is not a collection.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.QueryParameterOutOfRange

The query parameter value is out of range for the resource. For example, a page is requested that is outside the valid page range.

**Severity**:    Warning

**Resolution**:  Specify a query parameter value that is within range. For example, a page that is within the valid range of pages.

```json

{
    "Description": "The query parameter value is out of range for the resource. For example, a page is requested that is outside the valid page range.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the query parameter %2 is out of range %3.", 
    "Resolution": "Specify a query parameter value that is within range. For example, a page that is within the valid range of pages.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.QueryParameterValueFormatError

The value type is correct, but the format is not supported or the size/length was exceeded.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.

```json

{
    "Description": "The value type is correct, but the format is not supported or the size/length was exceeded.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the parameter %2 is in a format that is not supported by the parameter.", 
    "Resolution": "If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.QueryParameterValueTypeError

The query parameter contains an incorrect value type. For example, a number supplied for a query parameter that requires a string.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.

```json

{
    "Description": "The query parameter contains an incorrect value type. For example, a number supplied for a query parameter that requires a string.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the query parameter %2 is the incorrect type of value for the query parameter.", 
    "Resolution": "If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.ResourceAlreadyExists

The create resource operation did not complete because the resource already exists.

**Severity**:    Critical

**Resolution**:  Do not attempt the create operation because the resource already exists.

```json

{
    "Message": "The requested resource already exists.", 
    "NumberOfArgs": 0, 
    "Resolution": "Do not attempt the create operation because the resource already exists.", 
    "Description": "The create resource operation did not complete because the resource already exists.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ResourceAtUriInUnknownFormat

The URI is valid, but the resource or image at that URI is in a format that is not supported by the service.

**Severity**:    Critical

**Resolution**:  Place a resource, image, or file that is supported by the service at the URI.

```json

{
    "Description": "The URI is valid, but the resource or image at that URI is in a format that is not supported by the service.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The resource at %1 is in a format that is not supported by the service.", 
    "Resolution": "Place a resource, image, or file that is supported by the service at the URI.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ResourceAtUriUnauthorized

An attempt to access the resource, image, or file at the URI is unauthorized.

**Severity**:    Critical

**Resolution**:  Verify that the appropriate access is provided for the service to access the URI.

```json

{
    "Description": "An attempt to access the resource, image, or file at the URI is unauthorized.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "While accessing the resource at %1, the service received an authorization error %2.", 
    "Resolution": "Verify that the appropriate access is provided for the service to access the URI.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ResourceCannotBeDeleted

A delete operation was attempted on a resource that cannot be deleted.

**Severity**:    Critical

**Resolution**:  Do not attempt to delete a resource that does not support the REST API DELETE operation.

```json

{
    "Message": "The delete request did not complete because the resource cannot be deleted.", 
    "NumberOfArgs": 0, 
    "Resolution": "Do not attempt to delete a resource that does not support the REST API DELETE operation.", 
    "Description": "A delete operation was attempted on a resource that cannot be deleted.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ResourceInUse

The request to change the resource was rejected because the resource was in use or in transition.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, wait until the resource is free and resubmit the request.

```json

{
    "Message": "The change to the resource did not complete because the resource is in use or in transition.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, wait until the resource is free and resubmit the request.", 
    "Description": "The request to change the resource was rejected because the resource was in use or in transition.", 
    "Severity": "Warning"
}

```

### MessageId: Base.{version}.ResourceMissingAtURI

The operation expected an image or resource at the provided URI, but found none.

**Severity**:    Critical

**Resolution**:  Place a valid resource at the URI or correct the URI and resubmit the request.

```json

{
    "Description": "The operation expected an image or resource at the provided URI, but found none.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The resource at the URI %1 was not found.", 
    "Resolution": "Place a valid resource at the URI or correct the URI and resubmit the request.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ServiceInUnknownState

The operation did not complete because the service is in an unknown state and cannot take incoming requests.

**Severity**:    Critical

**Resolution**:  If the operation did not complete, restart the service and resubmit the request.

```json

{
    "Message": "The operation did not complete because the service is in an unknown state and cannot take incoming requests.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, restart the service and resubmit the request.", 
    "Description": "The operation did not complete because the service is in an unknown state and cannot take incoming requests.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ServiceShuttingDown

The operation did not complete because the service is shutting down.

**Severity**:    Critical

**Resolution**:  If the operation did not complete, resubmit the request when the service is available.

```json

{
    "Message": "The operation did not complete because the service is shutting down and cannot take incoming requests.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, resubmit the request when the service is available.", 
    "Description": "The operation did not complete because the service is shutting down.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.ServiceTemporarilyUnavailable

The service is temporarily unavailable.

**Severity**:    Critical

**Resolution**:  Wait for the indicated retry duration and retry the operation.

```json

{
    "Description": "The service is temporarily unavailable.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The service is temporarily unavailable.  Retry in %1 seconds.", 
    "Resolution": "Wait for the indicated retry duration and retry the operation.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.SessionLimitExceeded

Session establishment has been requested, but the operation did not complete because the number of simultaneous sessions exceeded the maximum number allowed by the implementation.

**Severity**:    Critical

**Resolution**:  Before attempting to establish the session, reduce the number of sessions or increase the maximum number of simultaneous sessions allowed (if supported).

```json

{
    "Message": "The session establishment did not complete because the number of simultaneous sessions exceeded the maximum number allowed by the implementation.", 
    "NumberOfArgs": 0, 
    "Resolution": "Before attempting to establish the session, reduce the number of sessions or increase the maximum number of simultaneous sessions allowed (if supported).", 
    "Description": "Session establishment has been requested, but the operation did not complete because the number of simultaneous sessions exceeded the maximum number allowed by the implementation.", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.SourceDoesNotSupportProtocol

While attempting to access, connect to, or transfer from another location, the other end of the connection did not support the specified protocol.

**Severity**:    Critical

**Resolution**:  Change protocols or URIs. 

```json

{
    "Description": "While attempting to access, connect to, or transfer from another location, the other end of the connection did not support the specified protocol.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The other end of the connection at %1 does not support the specified protocol %2.", 
    "Resolution": "Change protocols or URIs. ", 
    "Severity": "Critical"
}

```

### MessageId: Base.{version}.Success

The operation completed successfully.

**Severity**:    OK

**Resolution**:  None

```json

{
    "Message": "The operation completed successfully.", 
    "NumberOfArgs": 0, 
    "Resolution": "None", 
    "Description": "The operation completed successfully.", 
    "Severity": "OK"
}

```

### MessageId: Base.{version}.UnrecognizedRequestBody

The service detected a request body with malformed JSON.

**Severity**:    Warning

**Resolution**:  If the operation did not complete, correct the request body and resubmit the request.

```json

{
    "Message": "The service detected a request body with malformed JSON.", 
    "NumberOfArgs": 0, 
    "Resolution": "If the operation did not complete, correct the request body and resubmit the request.", 
    "Description": "The service detected a request body with malformed JSON.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.ArrayPropertyOutOfBound

The items in the array exceed the maximum  number supported.

**Severity**:    Warning

**Resolution**:  Retry the operation using the correct number of items for the array.

```json

{
    "Description": "The items in the array exceed the maximum  number supported.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "An array %1 was supplied with %2 items that exceeds the maximum supported count of %3.", 
    "Resolution": "Retry the operation using the correct number of items for the array.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.ConditionalSuccess

A property value was successfully changed but the change may be reverted upon system reset.

**Severity**:    Warning

**Resolution**:  Check the "SettingsResult" messages after the system has reset for errors referring to the corresponding property.

```json

{
    "Description": "A property value was successfully changed but the change may be reverted upon system reset.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The property %1 was successfully changed to %2, but the change may be reverted upon system reset.", 
    "Resolution": "Check the \"SettingsResult\" messages after the system has reset for errors referring to the corresponding property.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.InternalErrorWithParam

The operation was not successful due to an internal service error (shown), but the service is still operational.

**Severity**:    Critical

**Resolution**:  Retry the operation. If the problem persists, consider resetting the service.

```json

{
    "Description": "The operation was not successful due to an internal service error (shown), but the service is still operational.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The operation was not successful due to an internal service error (%1), but the service is still operational.", 
    "Resolution": "Retry the operation. If the problem persists, consider resetting the service.", 
    "Severity": "Critical"
}

```

### MessageId: HpCommon.{version}.InvalidConfigurationSpecified

The specified configuration is not valid.

**Severity**:    Warning

**Resolution**:  Correct the configuration, and then retry the operation.

```json

{
    "Description": "The specified configuration is not valid.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The specified configuration is not valid.", 
    "Resolution": "Correct the configuration, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.PropertyValueExceedsMaxLength

The value for the property exceeds the maximum length.

**Severity**:    Warning

**Resolution**:  Correct the value for the property in the request body, and then retry the operation.

```json

{
    "Description": "The value for the property exceeds the maximum length.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 exceeds the maximum length of %3.", 
    "Resolution": "Correct the value for the property in the request body, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.PropertyValueIncompatible

The value for the property is the correct type, but this value is incompatible with the current value of another property.

**Severity**:    Warning

**Resolution**:  Correct the value for the property in the request body, and then retry the operation.

```json

{
    "Description": "The value for the property is the correct type, but this value is incompatible with the current value of another property.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is incompatible with the value for property %3.", 
    "Resolution": "Correct the value for the property in the request body, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.PropertyValueOutOfRange

The value for the property is out of range.

**Severity**:    Warning

**Resolution**:  Correct the value for the property in the request body, and then retry the operation.

```json

{
    "Description": "The value for the property is out of range.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is out of range %3.", 
    "Resolution": "Correct the value for the property in the request body, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.ResetInProgress

A device or service reset is in progress.

**Severity**:    Warning

**Resolution**:  Wait for device or service reset to complete, and then retry the operation.

```json

{
    "Description": "A device or service reset is in progress.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "A reset on %1 is in progress.", 
    "Resolution": "Wait for device or service reset to complete, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.ResetRequired

One or more properties were changed, but these changes will not take effect until the device or service is reset.

**Severity**:    Warning

**Resolution**:  To enable the changed properties, reset the device or service.

```json

{
    "Description": "One or more properties were changed, but these changes will not take effect until the device or service is reset.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "One or more properties were changed, but these changes will not take effect until %1 is reset.", 
    "Resolution": "To enable the changed properties, reset the device or service.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.ResourceNotReadyRetry

The resource is present but is not ready to perform operations due to an internal condition such as initialization or reset.

**Severity**:    Warning

**Resolution**:  Retry the operation when the resource is ready.

```json

{
    "Description": "The resource is present but is not ready to perform operations due to an internal condition such as initialization or reset.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The resource is present but is not ready to perform operations.  The resource will be ready in %1 seconds.", 
    "Resolution": "Retry the operation when the resource is ready.", 
    "Severity": "Warning"
}

```

### MessageId: HpCommon.{version}.SuccessFeedback

The operation completed successfully

**Severity**:    OK

**Resolution**:  None

```json

{
    "Description": "The operation completed successfully", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The operation completed successfully", 
    "Resolution": "None", 
    "Severity": "OK"
}

```

### MessageId: HpCommon.{version}.TaskCreated

A task was created in response to the operation.

**Severity**:    OK

**Resolution**:  Perform an HTTP GET request on the supplied URI for task status.

```json

{
    "Description": "A task was created in response to the operation.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "A task was created in response to the operation and is accessible at %1.", 
    "Resolution": "Perform an HTTP GET request on the supplied URI for task status.", 
    "Severity": "OK"
}

```

### MessageId: HpCommon.{version}.UnsupportedHwConfiguration

A previously requested property value change was reverted because the current hardware configuration does not support it.

**Severity**:    Warning

**Resolution**:  Ensure that the system's hardware configuration supports the property value.

```json

{
    "Description": "A previously requested property value change was reverted because the current hardware configuration does not support it.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for property %2 was reverted because the current hardware configuration does not support it.", 
    "Resolution": "Ensure that the system's hardware configuration supports the property value.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.AHSDisabled

Modifying AHS properties is not possible with AHS disabled.

**Severity**:    Warning

**Resolution**:  Enable AHS, and then modify the AHS properties.

```json

{
    "Description": "Modifying AHS properties is not possible with AHS disabled.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Modifying AHS properties is not possible with AHS disabled.", 
    "Resolution": "Enable AHS, and then modify the AHS properties.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.Accepted

Indicates that one or more properties were correctly changed, but may not be in effect yet.

**Severity**:    OK

**Resolution**:  None

```json

{
    "Message": "Indicates that one or more properties were correctly changed, but may not be in effect yet.", 
    "NumberOfArgs": 0, 
    "Resolution": "None", 
    "Description": "Indicates that one or more properties were correctly changed, but may not be in effect yet.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.ActionParameterValueNotInList

Indicates that the correct value type was supplied for the action parameter, but the value is not supported. (The value is not in the enumeration list.)

**Severity**:    Warning

**Resolution**:  Choose a value from the enumeration list and resubmit the request if the operation failed.

```json

{
    "Description": "Indicates that the correct value type was supplied for the action parameter, but the value is not supported. (The value is not in the enumeration list.)", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is not in the list of valid values.", 
    "Resolution": "Choose a value from the enumeration list and resubmit the request if the operation failed.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ArrayPropertyOutOfBound

The number of items in the array exceeds the maximum number supported.

**Severity**:    Warning

**Resolution**:  Retry the operation using the correct number of items for the array.

```json

{
    "Description": "The number of items in the array exceeds the maximum number supported.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "An array %1 was supplied with %2 items that exceeds the maximum supported count of %3.", 
    "Resolution": "Retry the operation using the correct number of items for the array.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.CannotRemoveLicense

Cannot remove iLO Standard/iLO Standard for BladeSystem license.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "Cannot remove iLO Standard/iLO Standard for BladeSystem license.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Cannot remove iLO Standard/iLO Standard for BladeSystem license.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.DemoLicenseKeyPreviouslyInstalled

A demo license was previously installed.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "A demo license was previously installed.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "A demo license was previously installed.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.DeviceResetRequired

Indicates that one or more properties were correctly changed, but will not take effect until device is reset.

**Severity**:    Warning

**Resolution**:  Reset the device for the settings to take effect.

```json

{
    "Description": "Indicates that one or more properties were correctly changed, but will not take effect until device is reset.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "One or more properties were changed and will not take effect until the device is reset.", 
    "Resolution": "Reset the device for the settings to take effect.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.DiagsTestAlreadyRunning

A diagnostics self test is already running.

**Severity**:    Warning

**Resolution**:  Stop the running test and try again.

```json

{
    "Description": "A diagnostics self test is already running.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "A diagnostics self test is already running.", 
    "Resolution": "Stop the running test and try again.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ESKMServersNotConfigured

Enterprise Secure Key Manager Servers are not configured.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Enterprise Secure Key Manager Servers are not configured.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Enterprise Secure Key Manager Servers are not configured.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.ETagTooLong

The supplied ETag is too long. The maximum supported ETag length is 63 bytes.

**Severity**:    Warning

**Resolution**:  Retry the operation using an ETag with a length of 63 bytes or less.

```json

{
    "Description": "The supplied ETag is too long. The maximum supported ETag length is 63 bytes.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The supplied ETag is too long. The maximum supported ETag length is 63 bytes.", 
    "Resolution": "Retry the operation using an ETag with a length of 63 bytes or less.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.EmptyDNSName

DNS name is empty.

**Severity**:    Warning

**Resolution**:  Retry the request with a valid DNS name.

```json

{
    "Description": "DNS name is empty.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Empty DNS name.", 
    "Resolution": "Retry the request with a valid DNS name.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ErrorIntializingESKM

Failed to initialize ESKM.

**Severity**:    Warning

**Resolution**:  Check if Account Group, Local CA Certificate Name, Login Name and Password are correct and try again.

```json

{
    "Description": "Failed to initialize ESKM.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Failed to initialize ESKM.", 
    "Resolution": "Check if Account Group, Local CA Certificate Name, Login Name and Password are correct and try again.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.EventLogCleared

Event log cleared successfully.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Event log cleared successfully.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Event log cleared successfully.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.EventSubscriptionModified

The event subscription was modified successfully.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Message": "The event subscription was modified successfully.", 
    "NumberOfArgs": 0, 
    "Resolution": "None.", 
    "Description": "The event subscription was modified successfully.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.EventSubscriptionRemoved

The event subscription was removed successfully.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Message": "The event subscription was removed successfully.", 
    "NumberOfArgs": 0, 
    "Resolution": "None.", 
    "Description": "The event subscription was removed successfully.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.FirmwareFlashAlreadyInProgress

A firmware upgrade operation is already in progress.

**Severity**:    Warning

**Resolution**:  Wait for the current firmware flash to complete, and then retry the operation.

```json

{
    "Description": "A firmware upgrade operation is already in progress.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "A firmware flash operation is already in progress.", 
    "Resolution": "Wait for the current firmware flash to complete, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.GeneratingCertificate

Generating the X509 Certificate.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Generating the X509 Certificate.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "X509 Certificate is being generated and the process might take up to 10 minutes.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.ICRUNotSupported

ICRU feature or function is not supported on the system.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "ICRU feature or function is not supported on the system.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "ICRU feature or function is not supported on the system.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.IPv6ConfigurationError

The specified IPv6 configuration caused an error.

**Severity**:    Warning

**Resolution**:  Resolve the indicated error in the configuration data.

```json

{
    "Description": "The specified IPv6 configuration caused an error.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The specified IPv6 configuration was in error due to %1.", 
    "Resolution": "Resolve the indicated error in the configuration data.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ImportCertificateFailed

Failed importing Certificate.

**Severity**:    Warning

**Resolution**:  Retry the operation with proper Certificate information.

```json

{
    "Description": "Failed importing Certificate.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Failed importing the X509 Certificate.", 
    "Resolution": "Retry the operation with proper Certificate information.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ImportSSOParamError

Not a valid parameter.

**Severity**:    Warning

**Resolution**:  Retry the request with valid parameters.

```json

{
    "Description": "Not a valid parameter.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Invalid Parameter.", 
    "Resolution": "Retry the request with valid parameters.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ImportSSOUriError

Not a valid Uri to import SSO certificate.

**Severity**:    Warning

**Resolution**:  Retry the request with valid URI.

```json

{
    "Description": "Not a valid Uri to import SSO certificate.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Invalid Uri.", 
    "Resolution": "Retry the request with valid URI.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.IndicatorLedInvalidStateChange

The request to change the state of the Indicator LED cannot be granted because the current state is either Blinking or is Unknown.

**Severity**:    Warning

**Resolution**:  Please wait until the server has completed its reserved state.

```json

{
    "Description": "The request to change the state of the Indicator LED cannot be granted because the current state is either Blinking or is Unknown.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The Indicator LED cannot be changed when its state is Blinking or Unknown.", 
    "Resolution": "Please wait until the server has completed its reserved state.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InternalErrorWithParam

The operation was not successful due to an internal service error (shown), but the service is still operational.

**Severity**:    Critical

**Resolution**:  Retry the operation. If the problem persists, consider resetting the service.

```json

{
    "Description": "The operation was not successful due to an internal service error (shown), but the service is still operational.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The operation was not successful due to an internal service error (%1), but the service is still operational.", 
    "Resolution": "Retry the operation. If the problem persists, consider resetting the service.", 
    "Severity": "Critical"
}

```

### MessageId: iLO.{version}.InvalidConfigurationSpecified

The specified configuration is not valid.

**Severity**:    Warning

**Resolution**:  Correct the configuration, and then retry the operation.

```json

{
    "Description": "The specified configuration is not valid.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The specified configuration is not valid.", 
    "Resolution": "Correct the configuration, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidConfigurationSpecifiedForFederation

iLO Federation Management cannot be supported in the current configuration.

**Severity**:    Warning

**Resolution**:  Review the iLO network settings or Onboard Administrator settings and refer to the iLO User Guide.

```json

{
    "Description": "iLO Federation Management cannot be supported in the current configuration.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "iLO Federation Management cannot be supported in the current configuration.", 
    "Resolution": "Review the iLO network settings or Onboard Administrator settings and refer to the iLO User Guide.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidEngineID

EngineID should be a hexadecimal number starting with 0x (for example, 0x0102030405abcdef). The string length should be an even number, greater than or equal to 6 characters (excluding the "0x"), and less than or equal to 32 characters.

**Severity**:    Warning

**Resolution**:  Retry the operation using an EngineID within the specified parameters.

```json

{
    "Description": "EngineID should be a hexadecimal number starting with 0x (for example, 0x0102030405abcdef). The string length should be an even number, greater than or equal to 6 characters (excluding the \"0x\"), and less than or equal to 32 characters.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "EngineID should be a hexadecimal number starting with 0x (for example, 0x0102030405abcdef). The string length should be an even number, greater than or equal to 6 characters (excluding the \"0x\"), and less than or equal to 32 characters.", 
    "Resolution": "Retry the operation using an EngineID within the specified parameters.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidIndex

The Index is not valid.

**Severity**:    Warning

**Resolution**:  Adhere to the indexes supported in the self links.

```json

{
    "Message": "The Index provided is not valid.", 
    "NumberOfArgs": 0, 
    "Resolution": "Adhere to the indexes supported in the self links.", 
    "Description": "The Index is not valid.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidLicenseKey

The license key is not valid.

**Severity**:    Warning

**Resolution**:  Retry the operation using a valid license key.

```json

{
    "Description": "The license key is not valid.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The license key is not valid.", 
    "Resolution": "Retry the operation using a valid license key.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidOperationForSystemState

The operation was not successful due to the current power state (for example, attempting to turn the power off when it is already off).

**Severity**:    Warning

**Resolution**:  Verify that the system is in the correct power state, and then retry the operation.

```json

{
    "Description": "The operation was not successful due to the current power state (for example, attempting to turn the power off when it is already off).", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The operation was not successful due to the current power state.", 
    "Resolution": "Verify that the system is in the correct power state, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidPassphraseLength

The passphrase must contain 8 to 49 characters.

**Severity**:    Warning

**Resolution**:  Correct the passphrase, and then retry the operation.

```json

{
    "Description": "The passphrase must contain 8 to 49 characters.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "%1 must contain 8 to 49 characters.", 
    "Resolution": "Correct the passphrase, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.InvalidPasswordLength

The password length is not valid.

**Severity**:    Critical

**Resolution**:  Retry the operation using a corrected password.

```json

{
    "Description": "The password length is not valid.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "A valid password must contain between %1 to %2 characters.", 
    "Resolution": "Retry the operation using a corrected password.", 
    "Severity": "Critical"
}

```

### MessageId: iLO.{version}.LicenseKeyNotSupported

The use of a license key is not supported on this system.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "The use of a license key is not supported on this system.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The use of a license key is not supported on this system.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.LicenseKeyRequired

An iLO license key is required to use this operation or feature.

**Severity**:    Warning

**Resolution**:  Install a license key (Advanced or Scale Out) to use this feature.

```json

{
    "Description": "An iLO license key is required to use this operation or feature.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "An iLO license key is required to use this operation or feature.", 
    "Resolution": "Install a license key (Advanced or Scale Out) to use this feature.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.LoginAttemptDelayed

The login was not successful, so the service enforces a delay before another login is allowed.

**Severity**:    Warning

**Resolution**:  Wait for the delay time to expire, and then retry the login.

```json

{
    "Description": "The login was not successful, so the service enforces a delay before another login is allowed.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The login was not successful, so the service enforces a delay before another login is allowed.", 
    "Resolution": "Wait for the delay time to expire, and then retry the login.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.LoginAttemptDelayedSeconds

The login was not successful, so the service enforces a delay before another login is allowed.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "The login was not successful, so the service enforces a delay before another login is allowed.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "number"
    ], 
    "Message": "The login was not successful, so the service enforces a %1 second delay before another login is allowed.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.MaxProviders

The maximum number of providers are already registered.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "The maximum number of providers are already registered.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The maximum number of providers are already registered.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.MaxVirtualMediaConnectionEstablished

No more Virtual Media connections are available, because the maximum number of connections are already established.

**Severity**:    Warning

**Resolution**:  Close an established Virtual Media connection, and then retry creating or opening another connection.

```json

{
    "Description": "No more Virtual Media connections are available, because the maximum number of connections are already established.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No more Virtual Media connections are available, because the maximum number of connections are already established.", 
    "Resolution": "Close an established Virtual Media connection, and then retry creating or opening another connection.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.MembistVariablesNotSupported

Membist variables are not supported on the system.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "Membist variables are not supported on the system.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Membist variables are not supported on the system.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NoSNMPAlertDestinationsConfigured

No SNMP alert destinations are configured.

**Severity**:    Warning

**Resolution**:  Disable SNMP pass-thru, modify the property, and then re-enable SNMP pass-thru.

```json

{
    "Description": "No SNMP alert destinations are configured.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No SNMP alert destinations are configured.", 
    "Resolution": "Disable SNMP pass-thru, modify the property, and then re-enable SNMP pass-thru.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NoSamples

No power history samples are available.

**Severity**:    OK

**Resolution**:  To accumulate power history samples, power on the server, and then wait at least 5 minutes.

```json

{
    "Description": "No power history samples are available.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "No power history samples are available.", 
    "Resolution": "To accumulate power history samples, power on the server, and then wait at least 5 minutes.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.NoSpaceforDNSName

No space to store DNS name.

**Severity**:    Warning

**Resolution**:  Make sure SSO database has enough space to store DNS name.

```json

{
    "Description": "No space to store DNS name.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No space to store DNS name.", 
    "Resolution": "Make sure SSO database has enough space to store DNS name.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NoVirtualMediaConnectionAvailable

No Virtual Media connections exist to perform the operation.

**Severity**:    Warning

**Resolution**:  Create or open a Virtual Media connection, and then retry the operation.

```json

{
    "Description": "No Virtual Media connections exist to perform the operation.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No Virtual Media connections exist to perform the operation.", 
    "Resolution": "Create or open a Virtual Media connection, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NotSupportedOnNIC

This property is not supported by the indicated network port.

**Severity**:    Warning

**Resolution**:  Do not specify this property on the indicated network port.

```json

{
    "Description": "This property is not supported by the indicated network port.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "%1 is not supported on the %2 Network Port.", 
    "Resolution": "Do not specify this property on the indicated network port.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NotValidIPAddrOrDNS

The value for the property is not a valid IPv4/v6 address or DNS name.

**Severity**:    Warning

**Resolution**:  Correct the IPv4/v6 address or DNS name, and then retry the operation.

```json

{
    "Description": "The value for the property is not a valid IPv4/v6 address or DNS name.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The value for property %1 is not a valid IPv4/v6 address or DNS name.", 
    "Resolution": "Correct the IPv4/v6 address or DNS name, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NotValidIPAddress

The value for the property is not a valid IP address.

**Severity**:    Warning

**Resolution**:  Use a valid IP address.

```json

{
    "Description": "The value for the property is not a valid IP address.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 is not a valid IP address for %2", 
    "Resolution": "Use a valid IP address.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.NotValidSubnetMask

The value for the property is not a valid subnet mask.

**Severity**:    Warning

**Resolution**:  Use a valid subnet mask.

```json

{
    "Description": "The value for the property is not a valid subnet mask.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "The value %1 is not a valid subnet mask for %2", 
    "Resolution": "Use a valid subnet mask.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PowerCapOACntrld

The enclosure Onboard Administrator is currently managing the power cap.

**Severity**:    Warning

**Resolution**:  Use Onboard Administrator to Manage the PowerCap

```json

{
    "Description": "The enclosure Onboard Administrator is currently managing the power cap.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The enclosure Onboard Administrator is currently managing the power cap.", 
    "Resolution": "Use Onboard Administrator to Manage the PowerCap", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PowerValueBadParam

The power cap value is not valid.

**Severity**:    Warning

**Resolution**:  Retry the operation using a corrected value.

```json

{
    "Description": "The power cap value is not valid.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The power cap value is not valid.", 
    "Resolution": "Retry the operation using a corrected value.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PowerValueInvalidCalibrationData

The request to set the power cap failed. Invalid power cap calibration data. The Power Cap feature is currently unavailable.

**Severity**:    Warning

**Resolution**:  Restart the server to retrieve calibration data from initial POST.

```json

{
    "Description": "The request to set the power cap failed. Invalid power cap calibration data. The Power Cap feature is currently unavailable.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The request to set the power cap failed. Invalid power cap calibration data. The Power Cap feature is currently unavailable", 
    "Resolution": "Restart the server to retrieve calibration data from initial POST.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PowerValueNotOptimal

Power caps set for less than 50% of the difference between maximum and minimum power may become unreachable due to changes in the server. Power caps set for less than 20% are not recommended.

**Severity**:    Warning

**Resolution**:  Please provide an optimal value in integer considering the power cap range.

```json

{
    "Description": "Power caps set for less than 50% of the difference between maximum and minimum power may become unreachable due to changes in the server. Power caps set for less than 20% are not recommended.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Power caps set for less than 50% of the difference between maximum and minimum power may become unreachable due to changes in the server. Power caps set for less than 20% are not recommended.", 
    "Resolution": "Please provide an optimal value in integer considering the power cap range.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PowerValueUnAvailable

Advanced power capping is not currently available due to the system configuration or state.

**Severity**:    Warning

**Resolution**:  Change the system configuration or wait for the system to become fully initialized, and then retry the operation.

```json

{
    "Description": "Advanced power capping is not currently available due to the system configuration or state.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Advanced power capping is not currently available due to the system configuration or state.", 
    "Resolution": "Change the system configuration or wait for the system to become fully initialized, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PowerValueUnSupported

Advanced power capping is not supported on this system.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "Advanced power capping is not supported on this system.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Advanced power capping is not supported on this system.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PrimaryESKMServerAccessible

Only the primary ESKM server is accessible.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Only the primary ESKM server is accessible.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No redundancy. Only the primary ESKM server is accessible.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.PrimarySecondaryAddressesResolveToSameServer

Primary and secondary ESKM server addresses resolve to the same server.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Primary and secondary ESKM server addresses resolve to the same server.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No redundancy. Primary and secondary ESKM server addresses resolve to the same server.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.PrimarySecondaryESKMServersAccessible

Both primary and secondary ESKM servers are accessible.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Both primary and secondary ESKM servers are accessible.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Redundant solution: Both primary and secondary ESKM servers are accessible.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.PropertyValueBadParam

The property value is not valid.

**Severity**:    Warning

**Resolution**:  Retry the operation using a corrected value.

```json

{
    "Description": "The property value is not valid.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "string"
    ], 
    "Message": "The property value is not valid.", 
    "Resolution": "Retry the operation using a corrected value.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PropertyValueExceedsMaxLength

The value for the property exceeds the maximum length.

**Severity**:    Warning

**Resolution**:  Correct the value for the property in the request body, and then retry the operation.

```json

{
    "Description": "The value for the property exceeds the maximum length.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 exceeds the maximum length of %3.", 
    "Resolution": "Correct the value for the property in the request body, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PropertyValueIncompatible

The value for the property is the correct type, but this value is incompatible with the current value of another property.

**Severity**:    Warning

**Resolution**:  Correct the value for the property in the request body, and then retry the operation.

```json

{
    "Description": "The value for the property is the correct type, but this value is incompatible with the current value of another property.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is incompatible with the value for property %3.", 
    "Resolution": "Correct the value for the property in the request body, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PropertyValueOutOfRange

The value for the property is out of range.

**Severity**:    Warning

**Resolution**:  Correct the value for the property in the request body, and then retry the operation.

```json

{
    "Description": "The value for the property is out of range.", 
    "NumberOfArgs": 3, 
    "ParamTypes": [
        "String", 
        "String", 
        "String"
    ], 
    "Message": "The value %1 for the property %2 is out of range %3.", 
    "Resolution": "Correct the value for the property in the request body, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.PropertyValueRequired

Indicates that a property was required but not specified.

**Severity**:    Warning

**Resolution**:  Include the required property in the request body and then retry the operation.

```json

{
    "Description": "Indicates that a property was required but not specified.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Message": "%1 requires Property %2 to be specified.", 
    "Resolution": "Include the required property in the request body and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.RepairNotSupported

IML event with this severity is not supported to be repaired. IML events with Critical or Warning severities can marked as repaired.

**Severity**:    Warning

**Resolution**:  Please do not try to repair IML events with severity other than Critical or Warning.

```json

{
    "Description": "IML event with this severity is not supported to be repaired. IML events with Critical or Warning severities can marked as repaired.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "string"
    ], 
    "Message": "IML event with %1 severity is not supported to be repaired. IML events with Critical or Warning severities can marked as repaired.", 
    "Resolution": "Please do not try to repair IML events with severity other than Critical or Warning.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.RequiredPropertyMissing

Indicates that a required property is not specified.

**Severity**:    Warning

**Resolution**:  Include the required property in the request body and then retry the operation.

```json

{
    "Description": "Indicates that a required property is not specified.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "Required Property %1 needs to be specifed.", 
    "Resolution": "Include the required property in the request body and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ResetInProgress

An iLO reset is in progress.

**Severity**:    Warning

**Resolution**:  Wait for iLO reset to complete, and then retry the operation.

```json

{
    "Description": "An iLO reset is in progress.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "An iLO reset is in progress.", 
    "Resolution": "Wait for iLO reset to complete, and then retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ResetRequired

One or more properties were changed, but these changes will not take effect until the iLO is reset.

**Severity**:    Warning

**Resolution**:  To enable the changed properties, reset the iLO.

```json

{
    "Description": "One or more properties were changed, but these changes will not take effect until the iLO is reset.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "One or more properties were changed, but these changes will not take effect until the iLO is reset.", 
    "Resolution": "To enable the changed properties, reset the iLO.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ResourceBeingFlashed

The change to the requested resource failed because the resource is being flashed.

**Severity**:    Warning

**Resolution**:  Retry the operation when the firmware upgrade has completed.

```json

{
    "Description": "The change to the requested resource failed because the resource is being flashed.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The change to the requested resource failed because the resource is being flashed.", 
    "Resolution": "Retry the operation when the firmware upgrade has completed.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ResourceInUseWithDetail

The change could not be made because the resource was in use or in a transitioning state.

**Severity**:    Warning

**Resolution**:  Retry the request.

```json

{
    "Description": "The change could not be made because the resource was in use or in a transitioning state.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The change to the resource failed because the resource is in use or in transition.", 
    "Resolution": "Retry the request.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.ResourceTemporarilyUnavailable

The resource is temporarily unavailable because the firmware is being flashed.

**Severity**:    Warning

**Resolution**:  Retry the operation when the firmware upgrade has completed.

```json

{
    "Description": "The resource is temporarily unavailable because the firmware is being flashed.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The resource is temporarily unavailable because the firmware is being flashed.", 
    "Resolution": "Retry the operation when the firmware upgrade has completed.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SMBIOSRecordNotFound

The SMBIOS record type is not found or is not supported on the system.

**Severity**:    Warning

**Resolution**:  Reset the system to update the SMBIOS records. If the problem persists then the SMBIOS record type is not supported.

```json

{
    "Description": "The SMBIOS record type is not found or is not supported on the system.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The SMBIOS record type %1 is not found or is not supported on the system.", 
    "Resolution": "Reset the system to update the SMBIOS records. If the problem persists then the SMBIOS record type is not supported.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SNMPAgentlessEnabled

Modifying SNMP properties is not possible while SNMP is configured in Agentless mode.

**Severity**:    Warning

**Resolution**:  Disable Agentless mode, modify the properties, and then re-enable Agentless mode.

```json

{
    "Description": "Modifying SNMP properties is not possible while SNMP is configured in Agentless mode.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "%1 cannot be changed while SNMP is configured in Agentless mode.", 
    "Resolution": "Disable Agentless mode, modify the properties, and then re-enable Agentless mode.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SNMPAlertDisabled

The operation could not be completed because SNMP alerts are disabled.

**Severity**:    Warning

**Resolution**:  Enable SNMP alerts and retry the operation.

```json

{
    "Description": "The operation could not be completed because SNMP alerts are disabled.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The operation could not be completed because SNMP alerts are disabled.", 
    "Resolution": "Enable SNMP alerts and retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SNMPDisabled

Modifying SNMP properties is not possible with SNMP disabled.

**Severity**:    Warning

**Resolution**:  Enable SNMP, and then modify the SNMP properties.

```json

{
    "Description": "Modifying SNMP properties is not possible with SNMP disabled.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Modifying SNMP properties is not possible with SNMP disabled.", 
    "Resolution": "Enable SNMP, and then modify the SNMP properties.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SNMPPassthruEnabled

Modifying SNMP properties is not possible while SNMP is configured in pass-thru mode.

**Severity**:    Warning

**Resolution**:  Configure SNMP 'Agentless' mode, modify the property, and then re-configure SNMP for 'Passthru' mode.

```json

{
    "Description": "Modifying SNMP properties is not possible while SNMP is configured in pass-thru mode.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "%1 cannot be changed while SNMP is configured in pass-thru mode.", 
    "Resolution": "Configure SNMP 'Agentless' mode, modify the property, and then re-configure SNMP for 'Passthru' mode.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SNMPTestAlertFailed

The SNMP Test Alert did not send successfully.

**Severity**:    Warning

**Resolution**:  Verify the test alert content and retry.

```json

{
    "Description": "The SNMP Test Alert did not send successfully.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The SNMP Test Alert did not send successfully.", 
    "Resolution": "Verify the test alert content and retry.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SSOCertficateEmpty

SSO Certificate is Empty.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "SSO Certificate is Empty.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Empty SSO Certificate.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SSOCertificateReadError

SSO Certificate Read Error.

**Severity**:    Warning

**Resolution**:  Retry the request with valid SSO certificate.

```json

{
    "Description": "SSO Certificate Read Error.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Error reading SSO certificate.", 
    "Resolution": "Retry the request with valid SSO certificate.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SSONoSpaceError

No space to store SSO certificate.

**Severity**:    Warning

**Resolution**:  Make sure SSO database has enough space to store SSO certificate.

```json

{
    "Description": "No space to store SSO certificate.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No space to store SSO certificate.", 
    "Resolution": "Make sure SSO database has enough space to store SSO certificate.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SSORecordNotFound

SSO Record Not Found.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "SSO Record Not Found.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "SSO Record Not Found.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SecondaryESKMServerAccessible

Only the secondary ESKM server is accessible.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Only the secondary ESKM server is accessible.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "No redundancy. Only the secondary ESKM server is accessible.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.SuccessFeedback

The operation completed successfully.

**Severity**:    OK

**Resolution**:  None

```json

{
    "Description": "The operation completed successfully.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The operation completed successfully.", 
    "Resolution": "None", 
    "Severity": "OK"
}

```

### MessageId: iLO.{version}.SyslogFeatureDisabled

Remote Syslog feature is disabled.

**Severity**:    Warning

**Resolution**:  Enable remote syslog feature to send test syslog message.

```json

{
    "Description": "Remote Syslog feature is disabled.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Remote syslog feature is disabled.", 
    "Resolution": "Enable remote syslog feature to send test syslog message.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.SystemResetRequired

The system properties were correctly changed, but will not take effect until the system is reset.

**Severity**:    Warning

**Resolution**:  Reset system for the settings to take effect.

```json

{
    "Description": "The system properties were correctly changed, but will not take effect until the system is reset.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "One or more properties were changed and will not take effect until system is reset.", 
    "Resolution": "Reset system for the settings to take effect.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.TokenRequired

Proper 'X-HPRESTFULAPI-AuthToken' authorization token not provided.

**Severity**:    Critical

**Resolution**:  Create proper 'X-HPRESTFULAPI-AuthToken' authorization token. Send token in using the proper HTTP header.

```json

{
    "Description": "Proper 'X-HPRESTFULAPI-AuthToken' authorization token not provided.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Proper 'X-HPRESTFULAPI-AuthToken' authorization token not provided.", 
    "Resolution": "Create proper 'X-HPRESTFULAPI-AuthToken' authorization token. Send token in using the proper HTTP header.", 
    "Severity": "Critical"
}

```

### MessageId: iLO.{version}.UnableModifyRights

Unable to modify user rights.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "Unable to modify user rights.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Unable to modify user rights.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UnableToModifyDueToMissingComponent

The value for the property cannot be changed because a related hardware component is not installed.

**Severity**:    Warning

**Resolution**:  Install the hardware component and retry the operation.

```json

{
    "Description": "The value for the property cannot be changed because a related hardware component is not installed.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The value for property %1 cannot be changed because a related hardware component is not installed.", 
    "Resolution": "Install the hardware component and retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UnableToModifyDuringSystemPOST

The value for the property cannot be changed while the computer system BIOS is in POST.

**Severity**:    Warning

**Resolution**:  After the computer system is either fully booted or powered off, retry the operation.

```json

{
    "Description": "The value for the property cannot be changed while the computer system BIOS is in POST.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The value for property %1 cannot be changed while the computer system BIOS is in POST.", 
    "Resolution": "After the computer system is either fully booted or powered off, retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UnauthorizedLoginAttempt

The login was not successful, because the supplied credentials could not be authorized.

**Severity**:    Warning

**Resolution**:  Log in with authorized user name and password credentials.

```json

{
    "Description": "The login was not successful, because the supplied credentials could not be authorized.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The login was not successful, because the supplied credentials could not be authorized.", 
    "Resolution": "Log in with authorized user name and password credentials.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UnsupportedOperation

This operation is not supported by RIS for the current system.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "This operation is not supported by RIS for the current system.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "This operation is not supported by RIS for the current system.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UnsupportedOperationInLegacyBootMode

This operation is not supported when the system Boot Mode is set to Legacy BIOS.

**Severity**:    Warning

**Resolution**:  Change the Boot Mode to UEFI and retry the operation.

```json

{
    "Description": "This operation is not supported when the system Boot Mode is set to Legacy BIOS.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": " This operation is not supported when the system Boot Mode is set to Legacy BIOS.", 
    "Resolution": "Change the Boot Mode to UEFI and retry the operation.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UnsupportedOperationInSystemBIOS

This operation is not supported by the current version of the system BIOS.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "This operation is not supported by the current version of the system BIOS.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "This operation is not supported by the current version of the system BIOS.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UserAlreadyExist

The user or login user name already exists.

**Severity**:    Warning

**Resolution**:  Try a different user or login user name.

```json

{
    "Description": "The user or login user name already exists.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The user or login user name already exists.", 
    "Resolution": "Try a different user or login user name.", 
    "Severity": "Warning"
}

```

### MessageId: iLO.{version}.UserNameAlreadyExists

Duplicate SNMPv3 User.

**Severity**:    Warning

**Resolution**:  Enter a different name and try again.

```json

{
    "Description": "Duplicate SNMPv3 User.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The username %1 already exists in the list", 
    "Resolution": "Enter a different name and try again.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.CorrectableOrUncorrectableMemoryErrors

Correctable or uncorrectable Memory Errors Detected. Correctable errors have been corrected, but the memory module should be replaced. Value 0 for CPU means memory is not Processor based.

**Severity**:    Warning

**Resolution**:  Replace the failing memory module.

```json

{
    "Description": "Correctable or uncorrectable Memory Errors Detected. Correctable errors have been corrected, but the memory module should be replaced. Value 0 for CPU means memory is not Processor based.", 
    "NumberOfArgs": 4, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Memory"
        }
    }, 
    "Message": "Correctable or uncorrectable Memory Errors Detected for the memory module in slot %1, cpu %2, riser %3, socket %4.", 
    "Resolution": "Replace the failing memory module.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.DeviceDiscoveryStatus

The server device discovery status has changed.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 4, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Message": "Discovery status is now vAux: %1, vMain: %2, AMS: %3, Smart Array Storage: %4", 
    "Resolution": "None.", 
    "Description": "The server device discovery status has changed."
}

```

### MessageId: iLOEvents.{version}.FanDegraded

The fault tolerant fan condition has been set to degraded for the specified chassis and fan.

**Severity**:    Critical

**Resolution**:  Replace the failing fan.

```json

{
    "Description": "The fault tolerant fan condition has been set to degraded for the specified chassis and fan.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "Fan %2 in chassis %1 is now in a degraded state.", 
    "Resolution": "Replace the failing fan.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.FanFailed

The fault tolerant fan condition has been set to failed for the specified chassis and fan.

**Severity**:    Critical

**Resolution**:  Replace the failed fan.

```json

{
    "Description": "The fault tolerant fan condition has been set to failed for the specified chassis and fan.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "Fan %1 in chassis %2 is now in a failed state", 
    "Resolution": "Replace the failed fan.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.FanInserted

A fault tolerant fan has been inserted into the specified chassis and fan location.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "A fault tolerant fan has been inserted into the specified chassis and fan location.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "The fan %1 has been inserted in chassis %2.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.FanRedundancyLost

The fault tolerant fans have lost redundancy for the specified chassis.

**Severity**:    Warning

**Resolution**:  Check the system fans for a failure.

```json

{
    "Description": "The fault tolerant fans have lost redundancy for the specified chassis.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "The fans are no longer redundant in chassis %1.", 
    "Resolution": "Check the system fans for a failure.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.FanRedundancyRestored

The fault tolerant fans have returned to a redundant state for the specified chassis.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "The fault tolerant fans have returned to a redundant state for the specified chassis.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Oem": {
        "Hp": {
            "ClearingLogic": {
                "ClearsMessages": [
                    "FanRedundancyLost"
                ], 
                "ClearsIf": "SameOriginOfCondition"
            }, 
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "The fans are now redundant in chassis %1.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.FanRemoved

A fault tolerant fan has been removed from the specified chassis and fan location.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "A fault tolerant fan has been removed from the specified chassis and fan location.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "Fan %1 has been removed from chassis %2.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.FirmwareFlashStatusChanged

The firmware flash status has changed

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The firmware flash status is now %1", 
    "Resolution": "None.", 
    "Description": "The firmware flash status has changed"
}

```

### MessageId: iLOEvents.{version}.ILOToInsightRemoteSupportCommunicationFailure

iLO to Insight Remote Support or Insight Online communication failed.

**Severity**:    Warning

**Resolution**:  Please check the connectivity to Insight Remote Support or Insight Online Host.

```json

{
    "Description": "iLO to Insight Remote Support or Insight Online communication failed.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Remotesupport"
        }
    }, 
    "Message": " iLO to Insight Remote Support or Insight Online communication failure.", 
    "Resolution": "Please check the connectivity to Insight Remote Support or Insight Online Host.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.IndicatorLEDStateChanged

The state of the indicator LED has changed

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The state of the indicator LED is now %1", 
    "Resolution": "None.", 
    "Description": "The state of the indicator LED has changed"
}

```

### MessageId: iLOEvents.{version}.MirroredMemoryEngaged

Advanced Memory Protection Mirrored Memory Engaged. The Advanced Memory Protection subsystem has detected a memory fault. Mirrored Memory has been activated. 

**Severity**:    Warning

**Resolution**:  Replace the faulty memory.

```json

{
    "Description": "Advanced Memory Protection Mirrored Memory Engaged. The Advanced Memory Protection subsystem has detected a memory fault. Mirrored Memory has been activated. ", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Memory"
        }
    }, 
    "Message": "The Advanced Memory Protection subsystem has engaged the online spare memory.", 
    "Resolution": "Replace the faulty memory.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.POSTErrorsOccurred

One or more POST errors occurred. Power On Self-Test (POST) errors occur during the server restart process. Details of the POST error messages can be found in Integrated Management Log 

**Severity**:    Warning

**Resolution**:  Refer to the Integrated Management Log for details on the Power on self-test error.

```json

{
    "Description": "One or more POST errors occurred. Power On Self-Test (POST) errors occur during the server restart process. Details of the POST error messages can be found in Integrated Management Log ", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Logs"
        }
    }, 
    "Message": "Power on self-test errors occurred during server restart.", 
    "Resolution": "Refer to the Integrated Management Log for details on the Power on self-test error.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.PowerRedundancyLost

The fault tolerant power supplies have lost redundancy for the specified chassis.

**Severity**:    Warning

**Resolution**:  Check the system power supplies for a failure.

```json

{
    "Description": "The fault tolerant power supplies have lost redundancy for the specified chassis.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The power supplies are no longer redundant in chassis %1.", 
    "Resolution": "Check the system power supplies for a failure.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.PowerRedundancyRestored

The fault tolerant power supplies have returned to a redundant state for the specified chassis.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "The fault tolerant power supplies have returned to a redundant state for the specified chassis.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Oem": {
        "Hp": {
            "ClearingLogic": {
                "ClearsMessages": [
                    "PowerRedundancyLost"
                ], 
                "ClearsIf": "SameOriginOfCondition"
            }, 
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The power supplies are now redundant in chassis %1.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.PowerSupplyACPowerLoss

Power supply AC power loss for the specified chassis and bay location.

**Severity**:    Critical

**Resolution**:  Check the power source for the specified power supply.

```json

{
    "Description": "Power supply AC power loss for the specified chassis and bay location.", 
    "NumberOfArgs": 6, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "Power supply AC power loss detected in %1, bay %2, model %4, serial number %5, firmware %6.", 
    "Resolution": "Check the power source for the specified power supply.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.PowerSupplyDegraded

The fault tolerant power supply condition has been set to degraded for the specified chassis and bay location.

**Severity**:    Critical

**Resolution**:  Replace the failing power supply.

```json

{
    "Description": "The fault tolerant power supply condition has been set to degraded for the specified chassis and bay location.", 
    "NumberOfArgs": 6, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The power supply is degraded in chassis %1, bay %2,  model %4, serial number %5, firmware %6.", 
    "Resolution": "Replace the failing power supply.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.PowerSupplyFailed

The fault tolerant power supply condition has been set to failed for the specified chassis and bay location.

**Severity**:    Critical

**Resolution**:  Replace the failed power supply.

```json

{
    "Description": "The fault tolerant power supply condition has been set to failed for the specified chassis and bay location.", 
    "NumberOfArgs": 6, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The power supply has failed in chassis %1, bay %2,  model %4, serial number %5, firmware %6.", 
    "Resolution": "Replace the failed power supply.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.PowerSupplyInserted

A fault tolerant power supply has been inserted into the specified chassis and bay location.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "A fault tolerant power supply has been inserted into the specified chassis and bay location.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "A power supply has been inserted in chassis %1, bay %2.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.PowerSupplyOK

The fault tolerant power supply condition has been set back to the OK state for the specified chassis and bay location.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "The fault tolerant power supply condition has been set back to the OK state for the specified chassis and bay location.", 
    "NumberOfArgs": 6, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "ClearingLogic": {
                "ClearsMessages": [
                    "PowerSupplyACPowerLoss", 
                    "PowerSupplyDegraded", 
                    "PowerSupplyFailed"
                ], 
                "ClearsIf": "SameOriginOfCondition"
            }, 
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The power supply is ok in chassis %1, bay %2, model %3, serial number %4, firmware %5.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.PowerSupplyRemoved

A fault tolerant power supply has been removed from the specified chassis and bay location.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "A fault tolerant power supply has been removed from the specified chassis and bay location.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "A power supply has been removed from chassis %1, bay %2.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.ResourceAdded

Resource added.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Resource added.", 
    "Resolution": "None.", 
    "Description": "Resource added."
}

```

### MessageId: iLOEvents.{version}.ResourceRemoved

Resource removed.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Resource removed.", 
    "Resolution": "None.", 
    "Description": "Resource removed."
}

```

### MessageId: iLOEvents.{version}.ResourceStatusChanged

Resource status changed.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Resource status changed.", 
    "Resolution": "None.", 
    "Description": "Resource status changed."
}

```

### MessageId: iLOEvents.{version}.ResourceUpdated

Resource updated.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "Resource updated.", 
    "Resolution": "None.", 
    "Description": "Resource updated."
}

```

### MessageId: iLOEvents.{version}.SNMPAuthenticationFailure

An unauthorized user attempted to access the iLO via SNMP

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "SNMP authentication Failure.", 
    "Resolution": "None.", 
    "Description": "An unauthorized user attempted to access the iLO via SNMP"
}

```

### MessageId: iLOEvents.{version}.SecurityOverrideDisengaged

Security override disengaged. iLO firmware has detected the security override jumper has been toggled to the disengaged position.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Security override disengaged. iLO firmware has detected the security override jumper has been toggled to the disengaged position.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "None"
        }
    }, 
    "Message": "iLO firmware has detected the security override jumper has been disengaged.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.SecurityOverrideEngaged

Security override engaged. iLO firmware has detected the security override jumper has been toggled to the engaged position.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "Security override engaged. iLO firmware has detected the security override jumper has been toggled to the engaged position.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "None"
        }
    }, 
    "Message": "iLO firmware has detected the security override jumper has been engaged.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.ServerHardwareSignatureChanged

The server hardware signature has changed. This can be caused by addition or removal of Mezziane cards or relocation of the server.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Message": "The server hardware signature is now %1", 
    "Resolution": "None.", 
    "Description": "The server hardware signature has changed. This can be caused by addition or removal of Mezziane cards or relocation of the server."
}

```

### MessageId: iLOEvents.{version}.ServerOperational

The server is operational again. The server has previously been shutdown due to a thermal anomaly on the server and has just become operational again.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "The server is operational again. The server has previously been shutdown due to a thermal anomaly on the server and has just become operational again.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "ClearingLogic": {
                "ClearsMessages": [
                    "ThermalStatusDegradedSysShutdown"
                ], 
                "ClearsIf": "SameOriginOfCondition"
            }, 
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Thermal"
        }
    }, 
    "Message": "Server is operational again after thermal shutdown.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.ServerPostComplete

The server has reached Power On Self Test complete.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "The server has reached Power On Self Test complete", 
    "Resolution": "None.", 
    "Description": "The server has reached Power On Self Test complete."
}

```

### MessageId: iLOEvents.{version}.ServerPowerOnFailure

A request was made to power on the server, however the server could not be powered on due to a failure condition.

**Severity**:    Critical

**Resolution**:  None.

```json

{
    "Description": "A request was made to power on the server, however the server could not be powered on due to a failure condition.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The server could not be powered on.", 
    "Resolution": "None.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.ServerPoweredOff

The server has been powered off.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "The server has been powered off.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The server has been powered off.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.ServerPoweredOn

The server has been powered on.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "The server has been powered on.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Power"
        }
    }, 
    "Message": "The server has been powered on.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.ServerResetDetected

Server Reset Detected. iLO firmware has detected a server reset.

**Severity**:    Critical

**Resolution**:  None.

```json

{
    "Description": "Server Reset Detected. iLO firmware has detected a server reset.", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "DeviceBay"
        }
    }, 
    "Message": "Server reset detected.", 
    "Resolution": "None.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.SystemBatteryFailed

The system battery condition has been set to failed for the specified chassis and index location.

**Severity**:    Warning

**Resolution**:  Replace the failed battery.

```json

{
    "Description": "The system battery condition has been set to failed for the specified chassis and index location.", 
    "NumberOfArgs": 6, 
    "ParamTypes": [
        "String", 
        "String", 
        "String", 
        "String", 
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Battery"
        }
    }, 
    "Message": "The battery has failed in chassis %1, index %2, status %3, model %4, serial number %5, spare part number %6.", 
    "Resolution": "Replace the failed battery.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.SystemBatteryRemoved

The system battery condition has removed for the specified chassis and index location.

**Severity**:    Warning

**Resolution**:  None.

```json

{
    "Description": "The system battery condition has removed for the specified chassis and index location.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Battery"
        }
    }, 
    "Message": "The Battery has been removed in chassis %1, index %2.", 
    "Resolution": "None.", 
    "Severity": "Warning"
}

```

### MessageId: iLOEvents.{version}.ThermalStatusDegradedSysContinue

The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.

**Severity**:    Critical

**Resolution**:  Check the system for hardware failures and verify the environment is properly cooled.

```json

{
    "Description": "The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Thermal"
        }
    }, 
    "Message": "Temperature out of range in chassis %1, location %2.The server will continue.", 
    "Resolution": "Check the system for hardware failures and verify the environment is properly cooled.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.ThermalStatusDegradedSysShutdown

The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.

**Severity**:    Critical

**Resolution**:  Check the system for hardware failures and verify the environment is properly cooled.

```json

{
    "Description": "The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Fan"
        }
    }, 
    "Message": "Temperature out of range on chassis %1, location %2. The server will be shutdown.", 
    "Resolution": "Check the system for hardware failures and verify the environment is properly cooled.", 
    "Severity": "Critical"
}

```

### MessageId: iLOEvents.{version}.ThermalStatusOK

The temperature status has been set to ok in the specified chassis and location. The server's temperature has returned to the normal operating range.

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Description": "The temperature status has been set to ok in the specified chassis and location. The server's temperature has returned to the normal operating range.", 
    "NumberOfArgs": 2, 
    "ParamTypes": [
        "String", 
        "String"
    ], 
    "Oem": {
        "Hp": {
            "ClearingLogic": {
                "ClearsMessages": [
                    "ThermalStatusDegradedSysContinue"
                ], 
                "ClearsIf": "SameOriginOfCondition"
            }, 
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "Thermal"
        }
    }, 
    "Message": "Temperature normal in chassis %1, location %2.", 
    "Resolution": "None.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.UnauthorizedLoginAttempts

iLO firmware has detected multiple unauthorized login attempts.

**Severity**:    OK

**Resolution**:  Check the iLO log for more information on the login failure.

```json

{
    "Description": "iLO firmware has detected multiple unauthorized login attempts.", 
    "NumberOfArgs": 1, 
    "ParamTypes": [
        "String"
    ], 
    "Oem": {
        "Hp": {
            "Type": "HpMessageExt.1.0.0", 
            "HealthCategory": "None"
        }
    }, 
    "Message": "iLO firmware has detected more than %1 unauthorized login attempts.", 
    "Resolution": "Check the iLO log for more information on the login failure.", 
    "Severity": "OK"
}

```

### MessageId: iLOEvents.{version}.iLOReset

iLO reset pending

**Severity**:    OK

**Resolution**:  None.

```json

{
    "Severity": "OK", 
    "NumberOfArgs": 0, 
    "ParamTypes": [], 
    "Message": "iLO reset pending", 
    "Resolution": "None.", 
    "Description": "iLO reset pending"
}

```



