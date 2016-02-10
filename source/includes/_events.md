### MessageId: Base.{version}.AccessDenied
While attempting to access, connect to, or transfer to/from another resource, the service was denied access.
**Format**:      "While attempting to establish a connection to %1, the service was denied access."
**Severity**:    Critical
**Resolution**:  Verify that the URI is correct and that the service has the appropriate credentials.
### MessageId: Base.{version}.AccountForSessionNoLongerExists
The account for current session is removed and the current session is also removed.
**Format**:      "The account for the session is removed and the current session is also removed."
**Severity**:    OK
**Resolution**:  Attempt to connect using a valid account.
### MessageId: Base.{version}.AccountModified
The account was modified successfully.
**Format**:      "The account was modified successfully."
**Severity**:    OK
**Resolution**:  None.
### MessageId: Base.{version}.AccountNotModified
The request was unable to modify the account.
**Format**:      "The account modification request did not complete."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, check the authorization or the request body for issues and resubmit the request.
### MessageId: Base.{version}.AccountRemoved
The account was removed successfully.
**Format**:      "The account was removed successfully."
**Severity**:    OK
**Resolution**:  None.
### MessageId: Base.{version}.ActionNotSupported
The action supplied in the POST operation is not supported by the resource.
**Format**:      "The action %1 is not supported by the resource."
**Severity**:    Critical
**Resolution**:  The action was invalid or the wrong resource was the target. See the implementation documentation for assistance.
### MessageId: Base.{version}.ActionParameterDuplicate
The action was submitted with a duplicate parameter in the request body.
**Format**:      "The action %1 was submitted with more than one value for the parameter %2."
**Severity**:    Warning
**Resolution**:  Resubmit the action with only one instance of the parameter in the request body.
### MessageId: Base.{version}.ActionParameterMissing
The requested action is missing a parameter that is required to process the action.
**Format**:      "The action %1 requires that the parameter %2 be present in the request body."
**Severity**:    Critical
**Resolution**:  Resubmit the action with the required parameter in the request body.
### MessageId: Base.{version}.ActionParameterNotSupported
The action parameter is not supported on the target resource.
**Format**:      "The parameter %1 for the action %2 is not supported on the target resource."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, remove the parameter and resubmit the request.
### MessageId: Base.{version}.ActionParameterUnknown
An action was submitted, but a supplied parameter did not match any of the known parameters.
**Format**:      "The action %1 was submitted with the invalid parameter %2."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the invalid parameter and resubmit the request.
### MessageId: Base.{version}.ActionParameterValueFormatError
The value type is correct, but the format is not supported or the size/length is exceeded
**Format**:      "The value %1 for the parameter %2 in the action %3 is in a format that is not supported by the parameter."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the parameter value in the request body and resubmit the request.
### MessageId: Base.{version}.ActionParameterValueTypeError
The parameter contains an incorrect value type. For example, a number value for a string parameter type.
**Format**:      "The value %1 for the parameter %2 in the action %3 is the incorrect parameter type."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the parameter value in the request body and resubmit the request.
### MessageId: Base.{version}.CouldNotEstablishConnection
An attempt to access the resource, image, or file at the URI was unsuccessful because a session could not be established.
**Format**:      "The service was unable to establish a connection with the URI %1."
**Severity**:    Critical
**Resolution**:  Verify that the URI contains a valid and reachable node name, protocol information, and other URI components.
### MessageId: Base.{version}.CreateFailedMissingReqProperties
A create operation was attempted on a resource, but a required property was missing from the request.
**Format**:      "The create operation did not complete because the required property %1 was missing from the request."
**Severity**:    Critical
**Resolution**:  If the operation did not complete, include the required property with a valid value in the request body and resubmit the request.
### MessageId: Base.{version}.CreateLimitReachedForResource
No more resources can be created.
**Format**:      "No more resources can be created."
**Severity**:    Critical
**Resolution**:  If the operation did not complete, delete resources and resubmit the request.
### MessageId: Base.{version}.Created
The resource has been created successfully.
**Format**:      "The resource has been created successfully."
**Severity**:    OK
**Resolution**:  None
### MessageId: Base.{version}.EventSubscriptionLimitExceeded
The event subscription establishment has been requested, but the operation did not complete because the number of simultaneous subscriptions exceeded the maximum number allowed by the implementation.
**Format**:      "The event subscription did not complete because the number of simultaneous subscriptions exceeded the maximum number allowed by the implementation."
**Severity**:    Critical
**Resolution**:  Before attempting to establish the event subscription, reduce the number of subscriptions or increase the maximum number of simultaneous subscriptions allowed (if supported).
### MessageId: Base.{version}.InsufficientPrivilege
The account or credentials associated with the current session are not authorized to perform the requested operation.
**Format**:      "The account or the credentials associated with the current session are authorized to perform the requested operation."
**Severity**:    Critical
**Resolution**:  Retry the operation with an authorized account or credentials.
### MessageId: Base.{version}.InternalError
The request did not complete due to an unknown internal error, but the service is still operational.
**Format**:      "The request failed due to an internal service error, but the service is still operational."
**Severity**:    Critical
**Resolution**:  Resubmit the request. If the problem persists, consider resetting the service.
### MessageId: Base.{version}.InvalidObject
The object is not valid.
**Format**:      "The object at %1 is not valid."
**Severity**:    Critical
**Resolution**:  If the operation did not complete, the object is malformed or the URI is incorrect. Make the appropriate corrections and resubmit the request.
### MessageId: Base.{version}.MalformedJSON
The request body contains malformed JSON.
**Format**:      "The request body submitted is malformed JSON and cannot be parsed by the receiving service."
**Severity**:    Critical
**Resolution**:  Verify that the request body is valid JSON and resubmit the request.
### MessageId: Base.{version}.NoValidSession
The operation did not complete because a valid session is required in order to access resources.
**Format**:      "There is no valid session established with the implementation."
**Severity**:    Critical
**Resolution**:  Establish a session before attempting any operations.
### MessageId: Base.{version}.PropertyDuplicate
A duplicate property is in the request body.
**Format**:      "The property %1 is duplicated in the request."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, remove the duplicate property from the request body and resubmit the request.
### MessageId: Base.{version}.PropertyMissing
The request does not include a required property.
**Format**:      "The property %1 is a required property and must be included in the request."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, verify the property is in the request body and has a valid value.
### MessageId: Base.{version}.PropertyNotWritable
The request included a value for a read-only property.
**Format**:      "The property %1 is a read-only property and cannot be assigned a value."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, remove the property from the request body and resubmit the request.
### MessageId: Base.{version}.PropertyUnknown
An unknown property is in the request body.
**Format**:      "The property %1 is not valid for this resource."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, remove the unknown property from the request body and resubmit the request.
### MessageId: Base.{version}.PropertyValueFormatError
The value type is correct, but the format is not supported or the size/length is exceeded.
**Format**:      "The value %1 for the property %2 is in a format that is not supported by the property."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the property value in the request body and resubmit the request.
### MessageId: Base.{version}.PropertyValueNotInList
The value type is correct, but the value is not supported.
**Format**:      "The value %1 for the property %2 is not valid."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, choose a value from the enumeration list and resubmit your request.
### MessageId: Base.{version}.PropertyValueTypeError
The property value contains an incorrect property type. For example, a number value for a string property type.
**Format**:      "The value %1 for the property %2 is the incorrect property type."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the property value in the request body and resubmit the request.
### MessageId: Base.{version}.QueryNotSupported
The query is not supported by the implementation.
**Format**:      "Querying is not supported by the implementation."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, remove the query parameter and resubmit the request.
### MessageId: Base.{version}.QueryNotSupportedOnResource
The query is not supported on the resource. For example, a start/count query is attempted on a resource that is not a collection.
**Format**:      "Querying is not supported on the requested resource."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, remove the query parameters and resubmit the request.
### MessageId: Base.{version}.QueryParameterOutOfRange
The query parameter value is out of range for the resource. For example, a page is requested that is outside the valid page range.
**Format**:      "The value %1 for the query parameter %2 is out of range %3."
**Severity**:    Warning
**Resolution**:  Specify a query parameter value that is within range. For example, a page that is within the valid range of pages.
### MessageId: Base.{version}.QueryParameterValueFormatError
The value type is correct, but the format is not supported or the size/length was exceeded.
**Format**:      "The value %1 for the parameter %2 is in a format that is not supported by the parameter."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.
### MessageId: Base.{version}.QueryParameterValueTypeError
The query parameter contains an incorrect value type. For example, a number supplied for a query parameter that requires a string.
**Format**:      "The value %1 for the query parameter %2 is the incorrect type of value for the query parameter."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.
### MessageId: Base.{version}.ResourceAlreadyExists
The create resource operation did not complete because the resource already exists.
**Format**:      "The requested resource already exists."
**Severity**:    Critical
**Resolution**:  Do not attempt the create operation because the resource already exists.
### MessageId: Base.{version}.ResourceAtUriInUnknownFormat
The URI is valid, but the resource or image at that URI is in a format that is not supported by the service.
**Format**:      "The resource at %1 is in a format that is not supported by the service."
**Severity**:    Critical
**Resolution**:  Place a resource, image, or file that is supported by the service at the URI.
### MessageId: Base.{version}.ResourceAtUriUnauthorized
An attempt to access the resource, image, or file at the URI is unauthorized.
**Format**:      "While accessing the resource at %1, the service received an authorization error %2."
**Severity**:    Critical
**Resolution**:  Verify that the appropriate access is provided for the service to access the URI.
### MessageId: Base.{version}.ResourceCannotBeDeleted
A delete operation was attempted on a resource that cannot be deleted.
**Format**:      "The delete request did not complete because the resource cannot be deleted."
**Severity**:    Critical
**Resolution**:  Do not attempt to delete a resource that does not support the REST API DELETE operation.
### MessageId: Base.{version}.ResourceInUse
The request to change the resource was rejected because the resource was in use or in transition.
**Format**:      "The change to the resource did not complete because the resource is in use or in transition."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, wait until the resource is free and resubmit the request.
### MessageId: Base.{version}.ResourceMissingAtURI
The operation expected an image or resource at the provided URI, but found none.
**Format**:      "The resource at the URI %1 was not found."
**Severity**:    Critical
**Resolution**:  Place a valid resource at the URI or correct the URI and resubmit the request.
### MessageId: Base.{version}.ServiceInUnknownState
The operation did not complete because the service is in an unknown state and cannot take incoming requests.
**Format**:      "The operation did not complete because the service is in an unknown state and cannot take incoming requests."
**Severity**:    Critical
**Resolution**:  If the operation did not complete, restart the service and resubmit the request.
### MessageId: Base.{version}.ServiceShuttingDown
The operation did not complete because the service is shutting down.
**Format**:      "The operation did not complete because the service is shutting down and cannot take incoming requests."
**Severity**:    Critical
**Resolution**:  If the operation did not complete, resubmit the request when the service is available.
### MessageId: Base.{version}.ServiceTemporarilyUnavailable
The service is temporarily unavailable.
**Format**:      "The service is temporarily unavailable.  Retry in %1 seconds."
**Severity**:    Critical
**Resolution**:  Wait for the indicated retry duration and retry the operation.
### MessageId: Base.{version}.SessionLimitExceeded
Session establishment has been requested, but the operation did not complete because the number of simultaneous sessions exceeded the maximum number allowed by the implementation.
**Format**:      "The session establishment did not complete because the number of simultaneous sessions exceeded the maximum number allowed by the implementation."
**Severity**:    Critical
**Resolution**:  Before attempting to establish the session, reduce the number of sessions or increase the maximum number of simultaneous sessions allowed (if supported).
### MessageId: Base.{version}.SourceDoesNotSupportProtocol
While attempting to access, connect to, or transfer from another location, the other end of the connection did not support the specified protocol.
**Format**:      "The other end of the connection at %1 does not support the specified protocol %2."
**Severity**:    Critical
**Resolution**:  Change protocols or URIs. 
### MessageId: Base.{version}.Success
The operation completed successfully.
**Format**:      "The operation completed successfully."
**Severity**:    OK
**Resolution**:  None
### MessageId: Base.{version}.UnrecognizedRequestBody
The service detected a request body with malformed JSON.
**Format**:      "The service detected a request body with malformed JSON."
**Severity**:    Warning
**Resolution**:  If the operation did not complete, correct the request body and resubmit the request.
### MessageId: HpCommon.{version}.ArrayPropertyOutOfBound
The items in the array exceed the maximum  number supported.
**Format**:      "An array %1 was supplied with %2 items that exceeds the maximum supported count of %3."
**Severity**:    Warning
**Resolution**:  Retry the operation using the correct number of items for the array.
### MessageId: HpCommon.{version}.ConditionalSuccess
A property value was successfully changed but the change may be reverted upon system reset.
**Format**:      "The property %1 was successfully changed to %2, but the change may be reverted upon system reset."
**Severity**:    Warning
**Resolution**:  Check the "SettingsResult" messages after the system has reset for errors referring to the corresponding property.
### MessageId: HpCommon.{version}.InternalErrorWithParam
The operation was not successful due to an internal service error (shown), but the service is still operational.
**Format**:      "The operation was not successful due to an internal service error (%1), but the service is still operational."
**Severity**:    Critical
**Resolution**:  Retry the operation. If the problem persists, consider resetting the service.
### MessageId: HpCommon.{version}.InvalidConfigurationSpecified
The specified configuration is not valid.
**Format**:      "The specified configuration is not valid."
**Severity**:    Warning
**Resolution**:  Correct the configuration, and then retry the operation.
### MessageId: HpCommon.{version}.PropertyValueExceedsMaxLength
The value for the property exceeds the maximum length.
**Format**:      "The value %1 for the property %2 exceeds the maximum length of %3."
**Severity**:    Warning
**Resolution**:  Correct the value for the property in the request body, and then retry the operation.
### MessageId: HpCommon.{version}.PropertyValueIncompatible
The value for the property is the correct type, but this value is incompatible with the current value of another property.
**Format**:      "The value %1 for the property %2 is incompatible with the value for property %3."
**Severity**:    Warning
**Resolution**:  Correct the value for the property in the request body, and then retry the operation.
### MessageId: HpCommon.{version}.PropertyValueOutOfRange
The value for the property is out of range.
**Format**:      "The value %1 for the property %2 is out of range %3."
**Severity**:    Warning
**Resolution**:  Correct the value for the property in the request body, and then retry the operation.
### MessageId: HpCommon.{version}.ResetInProgress
A device or service reset is in progress.
**Format**:      "A reset on %1 is in progress."
**Severity**:    Warning
**Resolution**:  Wait for device or service reset to complete, and then retry the operation.
### MessageId: HpCommon.{version}.ResetRequired
One or more properties were changed, but these changes will not take effect until the device or service is reset.
**Format**:      "One or more properties were changed, but these changes will not take effect until %1 is reset."
**Severity**:    Warning
**Resolution**:  To enable the changed properties, reset the device or service.
### MessageId: HpCommon.{version}.ResourceNotReadyRetry
The resource is present but is not ready to perform operations due to an internal condition such as initialization or reset.
**Format**:      "The resource is present but is not ready to perform operations.  The resource will be ready in %1 seconds."
**Severity**:    Warning
**Resolution**:  Retry the operation when the resource is ready.
### MessageId: HpCommon.{version}.SuccessFeedback
The operation completed successfully
**Format**:      "The operation completed successfully"
**Severity**:    OK
**Resolution**:  None
### MessageId: HpCommon.{version}.TaskCreated
A task was created in response to the operation.
**Format**:      "A task was created in response to the operation and is accessible at %1."
**Severity**:    OK
**Resolution**:  Perform an HTTP GET request on the supplied URI for task status.
### MessageId: HpCommon.{version}.UnsupportedHwConfiguration
A previously requested property value change was reverted because the current hardware configuration does not support it.
**Format**:      "The value %1 for property %2 was reverted because the current hardware configuration does not support it."
**Severity**:    Warning
**Resolution**:  Ensure that the system's hardware configuration supports the property value.
### MessageId: iLO.{version}.AHSDisabled
Modifying AHS properties is not possible with AHS disabled.
**Format**:      "Modifying AHS properties is not possible with AHS disabled."
**Severity**:    Warning
**Resolution**:  Enable AHS, and then modify the AHS properties.
### MessageId: iLO.{version}.Accepted
Indicates that one or more properties were correctly changed, but may not be in effect yet.
**Format**:      "Indicates that one or more properties were correctly changed, but may not be in effect yet."
**Severity**:    OK
**Resolution**:  None
### MessageId: iLO.{version}.ActionParameterValueNotInList
Indicates that the correct value type was supplied for the action parameter, but the value is not supported. (The value is not in the enumeration list.)
**Format**:      "The value %1 for the property %2 is not in the list of valid values."
**Severity**:    Warning
**Resolution**:  Choose a value from the enumeration list and resubmit the request if the operation failed.
### MessageId: iLO.{version}.ArrayPropertyOutOfBound
The number of items in the array exceeds the maximum number supported.
**Format**:      "An array %1 was supplied with %2 items that exceeds the maximum supported count of %3."
**Severity**:    Warning
**Resolution**:  Retry the operation using the correct number of items for the array.
### MessageId: iLO.{version}.CannotRemoveLicense
Cannot remove iLO Standard/iLO Standard for BladeSystem license.
**Format**:      "Cannot remove iLO Standard/iLO Standard for BladeSystem license."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.DemoLicenseKeyPreviouslyInstalled
A demo license was previously installed.
**Format**:      "A demo license was previously installed."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.DeviceResetRequired
Indicates that one or more properties were correctly changed, but will not take effect until device is reset.
**Format**:      "One or more properties were changed and will not take effect until the device is reset."
**Severity**:    Warning
**Resolution**:  Reset the device for the settings to take effect.
### MessageId: iLO.{version}.DiagsTestAlreadyRunning
A diagnostics self test is already running.
**Format**:      "A diagnostics self test is already running."
**Severity**:    Warning
**Resolution**:  Stop the running test and try again.
### MessageId: iLO.{version}.ESKMServersNotConfigured
Enterprise Secure Key Manager Servers are not configured.
**Format**:      "Enterprise Secure Key Manager Servers are not configured."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.ETagTooLong
The supplied ETag is too long. The maximum supported ETag length is 63 bytes.
**Format**:      "The supplied ETag is too long. The maximum supported ETag length is 63 bytes."
**Severity**:    Warning
**Resolution**:  Retry the operation using an ETag with a length of 63 bytes or less.
### MessageId: iLO.{version}.EmptyDNSName
DNS name is empty.
**Format**:      "Empty DNS name."
**Severity**:    Warning
**Resolution**:  Retry the request with a valid DNS name.
### MessageId: iLO.{version}.ErrorIntializingESKM
Failed to initialize ESKM.
**Format**:      "Failed to initialize ESKM."
**Severity**:    Warning
**Resolution**:  Check if Account Group, Local CA Certificate Name, Login Name and Password are correct and try again.
### MessageId: iLO.{version}.EventLogCleared
Event log cleared successfully.
**Format**:      "Event log cleared successfully."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.EventSubscriptionModified
The event subscription was modified successfully.
**Format**:      "The event subscription was modified successfully."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.EventSubscriptionRemoved
The event subscription was removed successfully.
**Format**:      "The event subscription was removed successfully."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.FirmwareFlashAlreadyInProgress
A firmware upgrade operation is already in progress.
**Format**:      "A firmware flash operation is already in progress."
**Severity**:    Warning
**Resolution**:  Wait for the current firmware flash to complete, and then retry the operation.
### MessageId: iLO.{version}.GeneratingCertificate
Generating the X509 Certificate.
**Format**:      "X509 Certificate is being generated and the process might take up to 10 minutes."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.ICRUNotSupported
ICRU feature or function is not supported on the system.
**Format**:      "ICRU feature or function is not supported on the system."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.IPv6ConfigurationError
The specified IPv6 configuration caused an error.
**Format**:      "The specified IPv6 configuration was in error due to %1."
**Severity**:    Warning
**Resolution**:  Resolve the indicated error in the configuration data.
### MessageId: iLO.{version}.ImportCertificateFailed
Failed importing Certificate.
**Format**:      "Failed importing the X509 Certificate."
**Severity**:    Warning
**Resolution**:  Retry the operation with proper Certificate information.
### MessageId: iLO.{version}.ImportSSOParamError
Not a valid parameter.
**Format**:      "Invalid Parameter."
**Severity**:    Warning
**Resolution**:  Retry the request with valid parameters.
### MessageId: iLO.{version}.ImportSSOUriError
Not a valid Uri to import SSO certificate.
**Format**:      "Invalid Uri."
**Severity**:    Warning
**Resolution**:  Retry the request with valid URI.
### MessageId: iLO.{version}.IndicatorLedInvalidStateChange
The request to change the state of the Indicator LED cannot be granted because the current state is either Blinking or is Unknown.
**Format**:      "The Indicator LED cannot be changed when its state is Blinking or Unknown."
**Severity**:    Warning
**Resolution**:  Please wait until the server has completed its reserved state.
### MessageId: iLO.{version}.InternalErrorWithParam
The operation was not successful due to an internal service error (shown), but the service is still operational.
**Format**:      "The operation was not successful due to an internal service error (%1), but the service is still operational."
**Severity**:    Critical
**Resolution**:  Retry the operation. If the problem persists, consider resetting the service.
### MessageId: iLO.{version}.InvalidConfigurationSpecified
The specified configuration is not valid.
**Format**:      "The specified configuration is not valid."
**Severity**:    Warning
**Resolution**:  Correct the configuration, and then retry the operation.
### MessageId: iLO.{version}.InvalidConfigurationSpecifiedForFederation
iLO Federation Management cannot be supported in the current configuration.
**Format**:      "iLO Federation Management cannot be supported in the current configuration."
**Severity**:    Warning
**Resolution**:  Review the iLO network settings or Onboard Administrator settings and refer to the iLO User Guide.
### MessageId: iLO.{version}.InvalidEngineID
EngineID should be a hexadecimal number starting with 0x (for example, 0x0102030405abcdef). The string length should be an even number, greater than or equal to 6 characters (excluding the "0x"), and less than or equal to 32 characters.
**Format**:      "EngineID should be a hexadecimal number starting with 0x (for example, 0x0102030405abcdef). The string length should be an even number, greater than or equal to 6 characters (excluding the "0x"), and less than or equal to 32 characters."
**Severity**:    Warning
**Resolution**:  Retry the operation using an EngineID within the specified parameters.
### MessageId: iLO.{version}.InvalidIndex
The Index is not valid.
**Format**:      "The Index provided is not valid."
**Severity**:    Warning
**Resolution**:  Adhere to the indexes supported in the self links.
### MessageId: iLO.{version}.InvalidLicenseKey
The license key is not valid.
**Format**:      "The license key is not valid."
**Severity**:    Warning
**Resolution**:  Retry the operation using a valid license key.
### MessageId: iLO.{version}.InvalidOperationForSystemState
The operation was not successful due to the current power state (for example, attempting to turn the power off when it is already off).
**Format**:      "The operation was not successful due to the current power state."
**Severity**:    Warning
**Resolution**:  Verify that the system is in the correct power state, and then retry the operation.
### MessageId: iLO.{version}.InvalidPassphraseLength
The passphrase must contain 8 to 49 characters.
**Format**:      "%1 must contain 8 to 49 characters."
**Severity**:    Warning
**Resolution**:  Correct the passphrase, and then retry the operation.
### MessageId: iLO.{version}.InvalidPasswordLength
The password length is not valid.
**Format**:      "A valid password must contain between %1 to %2 characters."
**Severity**:    Critical
**Resolution**:  Retry the operation using a corrected password.
### MessageId: iLO.{version}.LicenseKeyNotSupported
The use of a license key is not supported on this system.
**Format**:      "The use of a license key is not supported on this system."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.LicenseKeyRequired
An iLO license key is required to use this operation or feature.
**Format**:      "An iLO license key is required to use this operation or feature."
**Severity**:    Warning
**Resolution**:  Install a license key (Advanced or Scale Out) to use this feature.
### MessageId: iLO.{version}.LoginAttemptDelayed
The login was not successful, so the service enforces a delay before another login is allowed.
**Format**:      "The login was not successful, so the service enforces a delay before another login is allowed."
**Severity**:    Warning
**Resolution**:  Wait for the delay time to expire, and then retry the login.
### MessageId: iLO.{version}.LoginAttemptDelayedSeconds
The login was not successful, so the service enforces a delay before another login is allowed.
**Format**:      "The login was not successful, so the service enforces a %1 second delay before another login is allowed."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.MaxProviders
The maximum number of providers are already registered.
**Format**:      "The maximum number of providers are already registered."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.MaxVirtualMediaConnectionEstablished
No more Virtual Media connections are available, because the maximum number of connections are already established.
**Format**:      "No more Virtual Media connections are available, because the maximum number of connections are already established."
**Severity**:    Warning
**Resolution**:  Close an established Virtual Media connection, and then retry creating or opening another connection.
### MessageId: iLO.{version}.MembistVariablesNotSupported
Membist variables are not supported on the system.
**Format**:      "Membist variables are not supported on the system."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.NoSNMPAlertDestinationsConfigured
No SNMP alert destinations are configured.
**Format**:      "No SNMP alert destinations are configured."
**Severity**:    Warning
**Resolution**:  Disable SNMP pass-thru, modify the property, and then re-enable SNMP pass-thru.
### MessageId: iLO.{version}.NoSamples
No power history samples are available.
**Format**:      "No power history samples are available."
**Severity**:    OK
**Resolution**:  To accumulate power history samples, power on the server, and then wait at least 5 minutes.
### MessageId: iLO.{version}.NoSpaceforDNSName
No space to store DNS name.
**Format**:      "No space to store DNS name."
**Severity**:    Warning
**Resolution**:  Make sure SSO database has enough space to store DNS name.
### MessageId: iLO.{version}.NoVirtualMediaConnectionAvailable
No Virtual Media connections exist to perform the operation.
**Format**:      "No Virtual Media connections exist to perform the operation."
**Severity**:    Warning
**Resolution**:  Create or open a Virtual Media connection, and then retry the operation.
### MessageId: iLO.{version}.NotSupportedOnNIC
This property is not supported by the indicated network port.
**Format**:      "%1 is not supported on the %2 Network Port."
**Severity**:    Warning
**Resolution**:  Do not specify this property on the indicated network port.
### MessageId: iLO.{version}.NotValidIPAddrOrDNS
The value for the property is not a valid IPv4/v6 address or DNS name.
**Format**:      "The value for property %1 is not a valid IPv4/v6 address or DNS name."
**Severity**:    Warning
**Resolution**:  Correct the IPv4/v6 address or DNS name, and then retry the operation.
### MessageId: iLO.{version}.NotValidIPAddress
The value for the property is not a valid IP address.
**Format**:      "The value %1 is not a valid IP address for %2"
**Severity**:    Warning
**Resolution**:  Use a valid IP address.
### MessageId: iLO.{version}.NotValidSubnetMask
The value for the property is not a valid subnet mask.
**Format**:      "The value %1 is not a valid subnet mask for %2"
**Severity**:    Warning
**Resolution**:  Use a valid subnet mask.
### MessageId: iLO.{version}.PowerCapOACntrld
The enclosure Onboard Administrator is currently managing the power cap.
**Format**:      "The enclosure Onboard Administrator is currently managing the power cap."
**Severity**:    Warning
**Resolution**:  Use Onboard Administrator to Manage the PowerCap
### MessageId: iLO.{version}.PowerValueBadParam
The power cap value is not valid.
**Format**:      "The power cap value is not valid."
**Severity**:    Warning
**Resolution**:  Retry the operation using a corrected value.
### MessageId: iLO.{version}.PowerValueInvalidCalibrationData
The request to set the power cap failed. Invalid power cap calibration data. The Power Cap feature is currently unavailable.
**Format**:      "The request to set the power cap failed. Invalid power cap calibration data. The Power Cap feature is currently unavailable"
**Severity**:    Warning
**Resolution**:  Restart the server to retrieve calibration data from initial POST.
### MessageId: iLO.{version}.PowerValueNotOptimal
Power caps set for less than 50% of the difference between maximum and minimum power may become unreachable due to changes in the server. Power caps set for less than 20% are not recommended.
**Format**:      "Power caps set for less than 50% of the difference between maximum and minimum power may become unreachable due to changes in the server. Power caps set for less than 20% are not recommended."
**Severity**:    Warning
**Resolution**:  Please provide an optimal value in integer considering the power cap range.
### MessageId: iLO.{version}.PowerValueUnAvailable
Advanced power capping is not currently available due to the system configuration or state.
**Format**:      "Advanced power capping is not currently available due to the system configuration or state."
**Severity**:    Warning
**Resolution**:  Change the system configuration or wait for the system to become fully initialized, and then retry the operation.
### MessageId: iLO.{version}.PowerValueUnSupported
Advanced power capping is not supported on this system.
**Format**:      "Advanced power capping is not supported on this system."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.PrimaryESKMServerAccessible
Only the primary ESKM server is accessible.
**Format**:      "No redundancy. Only the primary ESKM server is accessible."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.PrimarySecondaryAddressesResolveToSameServer
Primary and secondary ESKM server addresses resolve to the same server.
**Format**:      "No redundancy. Primary and secondary ESKM server addresses resolve to the same server."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.PrimarySecondaryESKMServersAccessible
Both primary and secondary ESKM servers are accessible.
**Format**:      "Redundant solution: Both primary and secondary ESKM servers are accessible."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.PropertyValueBadParam
The property value is not valid.
**Format**:      "The property value is not valid."
**Severity**:    Warning
**Resolution**:  Retry the operation using a corrected value.
### MessageId: iLO.{version}.PropertyValueExceedsMaxLength
The value for the property exceeds the maximum length.
**Format**:      "The value %1 for the property %2 exceeds the maximum length of %3."
**Severity**:    Warning
**Resolution**:  Correct the value for the property in the request body, and then retry the operation.
### MessageId: iLO.{version}.PropertyValueIncompatible
The value for the property is the correct type, but this value is incompatible with the current value of another property.
**Format**:      "The value %1 for the property %2 is incompatible with the value for property %3."
**Severity**:    Warning
**Resolution**:  Correct the value for the property in the request body, and then retry the operation.
### MessageId: iLO.{version}.PropertyValueOutOfRange
The value for the property is out of range.
**Format**:      "The value %1 for the property %2 is out of range %3."
**Severity**:    Warning
**Resolution**:  Correct the value for the property in the request body, and then retry the operation.
### MessageId: iLO.{version}.PropertyValueRequired
Indicates that a property was required but not specified.
**Format**:      "%1 requires Property %2 to be specified."
**Severity**:    Warning
**Resolution**:  Include the required property in the request body and then retry the operation.
### MessageId: iLO.{version}.RepairNotSupported
IML event with this severity is not supported to be repaired. IML events with Critical or Warning severities can marked as repaired.
**Format**:      "IML event with %1 severity is not supported to be repaired. IML events with Critical or Warning severities can marked as repaired."
**Severity**:    Warning
**Resolution**:  Please do not try to repair IML events with severity other than Critical or Warning.
### MessageId: iLO.{version}.RequiredPropertyMissing
Indicates that a required property is not specified.
**Format**:      "Required Property %1 needs to be specifed."
**Severity**:    Warning
**Resolution**:  Include the required property in the request body and then retry the operation.
### MessageId: iLO.{version}.ResetInProgress
An iLO reset is in progress.
**Format**:      "An iLO reset is in progress."
**Severity**:    Warning
**Resolution**:  Wait for iLO reset to complete, and then retry the operation.
### MessageId: iLO.{version}.ResetRequired
One or more properties were changed, but these changes will not take effect until the iLO is reset.
**Format**:      "One or more properties were changed, but these changes will not take effect until the iLO is reset."
**Severity**:    Warning
**Resolution**:  To enable the changed properties, reset the iLO.
### MessageId: iLO.{version}.ResourceBeingFlashed
The change to the requested resource failed because the resource is being flashed.
**Format**:      "The change to the requested resource failed because the resource is being flashed."
**Severity**:    Warning
**Resolution**:  Retry the operation when the firmware upgrade has completed.
### MessageId: iLO.{version}.ResourceInUseWithDetail
The change could not be made because the resource was in use or in a transitioning state.
**Format**:      "The change to the resource failed because the resource is in use or in transition."
**Severity**:    Warning
**Resolution**:  Retry the request.
### MessageId: iLO.{version}.ResourceTemporarilyUnavailable
The resource is temporarily unavailable because the firmware is being flashed.
**Format**:      "The resource is temporarily unavailable because the firmware is being flashed."
**Severity**:    Warning
**Resolution**:  Retry the operation when the firmware upgrade has completed.
### MessageId: iLO.{version}.SMBIOSRecordNotFound
The SMBIOS record type is not found or is not supported on the system.
**Format**:      "The SMBIOS record type %1 is not found or is not supported on the system."
**Severity**:    Warning
**Resolution**:  Reset the system to update the SMBIOS records. If the problem persists then the SMBIOS record type is not supported.
### MessageId: iLO.{version}.SNMPAgentlessEnabled
Modifying SNMP properties is not possible while SNMP is configured in Agentless mode.
**Format**:      "%1 cannot be changed while SNMP is configured in Agentless mode."
**Severity**:    Warning
**Resolution**:  Disable Agentless mode, modify the properties, and then re-enable Agentless mode.
### MessageId: iLO.{version}.SNMPAlertDisabled
The operation could not be completed because SNMP alerts are disabled.
**Format**:      "The operation could not be completed because SNMP alerts are disabled."
**Severity**:    Warning
**Resolution**:  Enable SNMP alerts and retry the operation.
### MessageId: iLO.{version}.SNMPDisabled
Modifying SNMP properties is not possible with SNMP disabled.
**Format**:      "Modifying SNMP properties is not possible with SNMP disabled."
**Severity**:    Warning
**Resolution**:  Enable SNMP, and then modify the SNMP properties.
### MessageId: iLO.{version}.SNMPPassthruEnabled
Modifying SNMP properties is not possible while SNMP is configured in pass-thru mode.
**Format**:      "%1 cannot be changed while SNMP is configured in pass-thru mode."
**Severity**:    Warning
**Resolution**:  Configure SNMP 'Agentless' mode, modify the property, and then re-configure SNMP for 'Passthru' mode.
### MessageId: iLO.{version}.SNMPTestAlertFailed
The SNMP Test Alert did not send successfully.
**Format**:      "The SNMP Test Alert did not send successfully."
**Severity**:    Warning
**Resolution**:  Verify the test alert content and retry.
### MessageId: iLO.{version}.SSOCertficateEmpty
SSO Certificate is Empty.
**Format**:      "Empty SSO Certificate."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.SSOCertificateReadError
SSO Certificate Read Error.
**Format**:      "Error reading SSO certificate."
**Severity**:    Warning
**Resolution**:  Retry the request with valid SSO certificate.
### MessageId: iLO.{version}.SSONoSpaceError
No space to store SSO certificate.
**Format**:      "No space to store SSO certificate."
**Severity**:    Warning
**Resolution**:  Make sure SSO database has enough space to store SSO certificate.
### MessageId: iLO.{version}.SSORecordNotFound
SSO Record Not Found.
**Format**:      "SSO Record Not Found."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.SecondaryESKMServerAccessible
Only the secondary ESKM server is accessible.
**Format**:      "No redundancy. Only the secondary ESKM server is accessible."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLO.{version}.SuccessFeedback
The operation completed successfully.
**Format**:      "The operation completed successfully."
**Severity**:    OK
**Resolution**:  None
### MessageId: iLO.{version}.SyslogFeatureDisabled
Remote Syslog feature is disabled.
**Format**:      "Remote syslog feature is disabled."
**Severity**:    Warning
**Resolution**:  Enable remote syslog feature to send test syslog message.
### MessageId: iLO.{version}.SystemResetRequired
The system properties were correctly changed, but will not take effect until the system is reset.
**Format**:      "One or more properties were changed and will not take effect until system is reset."
**Severity**:    Warning
**Resolution**:  Reset system for the settings to take effect.
### MessageId: iLO.{version}.TokenRequired
Proper 'X-HPRESTFULAPI-AuthToken' authorization token not provided.
**Format**:      "Proper 'X-HPRESTFULAPI-AuthToken' authorization token not provided."
**Severity**:    Critical
**Resolution**:  Create proper 'X-HPRESTFULAPI-AuthToken' authorization token. Send token in using the proper HTTP header.
### MessageId: iLO.{version}.UnableModifyRights
Unable to modify user rights.
**Format**:      "Unable to modify user rights."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.UnableToModifyDueToMissingComponent
The value for the property cannot be changed because a related hardware component is not installed.
**Format**:      "The value for property %1 cannot be changed because a related hardware component is not installed."
**Severity**:    Warning
**Resolution**:  Install the hardware component and retry the operation.
### MessageId: iLO.{version}.UnableToModifyDuringSystemPOST
The value for the property cannot be changed while the computer system BIOS is in POST.
**Format**:      "The value for property %1 cannot be changed while the computer system BIOS is in POST."
**Severity**:    Warning
**Resolution**:  After the computer system is either fully booted or powered off, retry the operation.
### MessageId: iLO.{version}.UnauthorizedLoginAttempt
The login was not successful, because the supplied credentials could not be authorized.
**Format**:      "The login was not successful, because the supplied credentials could not be authorized."
**Severity**:    Warning
**Resolution**:  Log in with authorized user name and password credentials.
### MessageId: iLO.{version}.UnsupportedOperation
This operation is not supported by RIS for the current system.
**Format**:      "This operation is not supported by RIS for the current system."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.UnsupportedOperationInLegacyBootMode
This operation is not supported when the system Boot Mode is set to Legacy BIOS.
**Format**:      " This operation is not supported when the system Boot Mode is set to Legacy BIOS."
**Severity**:    Warning
**Resolution**:  Change the Boot Mode to UEFI and retry the operation.
### MessageId: iLO.{version}.UnsupportedOperationInSystemBIOS
This operation is not supported by the current version of the system BIOS.
**Format**:      "This operation is not supported by the current version of the system BIOS."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLO.{version}.UserAlreadyExist
The user or login user name already exists.
**Format**:      "The user or login user name already exists."
**Severity**:    Warning
**Resolution**:  Try a different user or login user name.
### MessageId: iLO.{version}.UserNameAlreadyExists
Duplicate SNMPv3 User.
**Format**:      "The username %1 already exists in the list"
**Severity**:    Warning
**Resolution**:  Enter a different name and try again.
### MessageId: iLOEvents.{version}.CorrectableOrUncorrectableMemoryErrors
Correctable or uncorrectable Memory Errors Detected. Correctable errors have been corrected, but the memory module should be replaced. Value 0 for CPU means memory is not Processor based.
**Format**:      "Correctable or uncorrectable Memory Errors Detected for the memory module in slot %1, cpu %2, riser %3, socket %4."
**Severity**:    Warning
**Resolution**:  Replace the failing memory module.
### MessageId: iLOEvents.{version}.DeviceDiscoveryStatus
The server device discovery status has changed.
**Format**:      "Discovery status is now vAux: %1, vMain: %2, AMS: %3, Smart Array Storage: %4"
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.FanDegraded
The fault tolerant fan condition has been set to degraded for the specified chassis and fan.
**Format**:      "Fan %2 in chassis %1 is now in a degraded state."
**Severity**:    Critical
**Resolution**:  Replace the failing fan.
### MessageId: iLOEvents.{version}.FanFailed
The fault tolerant fan condition has been set to failed for the specified chassis and fan.
**Format**:      "Fan %1 in chassis %2 is now in a failed state"
**Severity**:    Critical
**Resolution**:  Replace the failed fan.
### MessageId: iLOEvents.{version}.FanInserted
A fault tolerant fan has been inserted into the specified chassis and fan location.
**Format**:      "The fan %1 has been inserted in chassis %2."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.FanRedundancyLost
The fault tolerant fans have lost redundancy for the specified chassis.
**Format**:      "The fans are no longer redundant in chassis %1."
**Severity**:    Warning
**Resolution**:  Check the system fans for a failure.
### MessageId: iLOEvents.{version}.FanRedundancyRestored
The fault tolerant fans have returned to a redundant state for the specified chassis.
**Format**:      "The fans are now redundant in chassis %1."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.FanRemoved
A fault tolerant fan has been removed from the specified chassis and fan location.
**Format**:      "Fan %1 has been removed from chassis %2."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLOEvents.{version}.FirmwareFlashStatusChanged
The firmware flash status has changed
**Format**:      "The firmware flash status is now %1"
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ILOToInsightRemoteSupportCommunicationFailure
iLO to Insight Remote Support or Insight Online communication failed.
**Format**:      " iLO to Insight Remote Support or Insight Online communication failure."
**Severity**:    Warning
**Resolution**:  Please check the connectivity to Insight Remote Support or Insight Online Host.
### MessageId: iLOEvents.{version}.IndicatorLEDStateChanged
The state of the indicator LED has changed
**Format**:      "The state of the indicator LED is now %1"
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.MirroredMemoryEngaged
Advanced Memory Protection Mirrored Memory Engaged. The Advanced Memory Protection subsystem has detected a memory fault. Mirrored Memory has been activated. 
**Format**:      "The Advanced Memory Protection subsystem has engaged the online spare memory."
**Severity**:    Warning
**Resolution**:  Replace the faulty memory.
### MessageId: iLOEvents.{version}.POSTErrorsOccurred
One or more POST errors occurred. Power On Self-Test (POST) errors occur during the server restart process. Details of the POST error messages can be found in Integrated Management Log 
**Format**:      "Power on self-test errors occurred during server restart."
**Severity**:    Warning
**Resolution**:  Refer to the Integrated Management Log for details on the Power on self-test error.
### MessageId: iLOEvents.{version}.PowerRedundancyLost
The fault tolerant power supplies have lost redundancy for the specified chassis.
**Format**:      "The power supplies are no longer redundant in chassis %1."
**Severity**:    Warning
**Resolution**:  Check the system power supplies for a failure.
### MessageId: iLOEvents.{version}.PowerRedundancyRestored
The fault tolerant power supplies have returned to a redundant state for the specified chassis.
**Format**:      "The power supplies are now redundant in chassis %1."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.PowerSupplyACPowerLoss
Power supply AC power loss for the specified chassis and bay location.
**Format**:      "Power supply AC power loss detected in %1, bay %2, model %4, serial number %5, firmware %6."
**Severity**:    Critical
**Resolution**:  Check the power source for the specified power supply.
### MessageId: iLOEvents.{version}.PowerSupplyDegraded
The fault tolerant power supply condition has been set to degraded for the specified chassis and bay location.
**Format**:      "The power supply is degraded in chassis %1, bay %2,  model %4, serial number %5, firmware %6."
**Severity**:    Critical
**Resolution**:  Replace the failing power supply.
### MessageId: iLOEvents.{version}.PowerSupplyFailed
The fault tolerant power supply condition has been set to failed for the specified chassis and bay location.
**Format**:      "The power supply has failed in chassis %1, bay %2,  model %4, serial number %5, firmware %6."
**Severity**:    Critical
**Resolution**:  Replace the failed power supply.
### MessageId: iLOEvents.{version}.PowerSupplyInserted
A fault tolerant power supply has been inserted into the specified chassis and bay location.
**Format**:      "A power supply has been inserted in chassis %1, bay %2."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.PowerSupplyOK
The fault tolerant power supply condition has been set back to the OK state for the specified chassis and bay location.
**Format**:      "The power supply is ok in chassis %1, bay %2, model %3, serial number %4, firmware %5."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.PowerSupplyRemoved
A fault tolerant power supply has been removed from the specified chassis and bay location.
**Format**:      "A power supply has been removed from chassis %1, bay %2."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ResourceAdded
Resource added.
**Format**:      "Resource added."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ResourceRemoved
Resource removed.
**Format**:      "Resource removed."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ResourceStatusChanged
Resource status changed.
**Format**:      "Resource status changed."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ResourceUpdated
Resource updated.
**Format**:      "Resource updated."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.SNMPAuthenticationFailure
An unauthorized user attempted to access the iLO via SNMP
**Format**:      "SNMP authentication Failure."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.SecurityOverrideDisengaged
Security override disengaged. iLO firmware has detected the security override jumper has been toggled to the disengaged position.
**Format**:      "iLO firmware has detected the security override jumper has been disengaged."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.SecurityOverrideEngaged
Security override engaged. iLO firmware has detected the security override jumper has been toggled to the engaged position.
**Format**:      "iLO firmware has detected the security override jumper has been engaged."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerHardwareSignatureChanged
The server hardware signature has changed. This can be caused by addition or removal of Mezziane cards or relocation of the server.
**Format**:      "The server hardware signature is now %1"
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerOperational
The server is operational again. The server has previously been shutdown due to a thermal anomaly on the server and has just become operational again.
**Format**:      "Server is operational again after thermal shutdown."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerPostComplete
The server has reached Power On Self Test complete.
**Format**:      "The server has reached Power On Self Test complete"
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerPowerOnFailure
A request was made to power on the server, however the server could not be powered on due to a failure condition.
**Format**:      "The server could not be powered on."
**Severity**:    Critical
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerPoweredOff
The server has been powered off.
**Format**:      "The server has been powered off."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerPoweredOn
The server has been powered on.
**Format**:      "The server has been powered on."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ServerResetDetected
Server Reset Detected. iLO firmware has detected a server reset.
**Format**:      "Server reset detected."
**Severity**:    Critical
**Resolution**:  None.
### MessageId: iLOEvents.{version}.SystemBatteryFailed
The system battery condition has been set to failed for the specified chassis and index location.
**Format**:      "The battery has failed in chassis %1, index %2, status %3, model %4, serial number %5, spare part number %6."
**Severity**:    Warning
**Resolution**:  Replace the failed battery.
### MessageId: iLOEvents.{version}.SystemBatteryRemoved
The system battery condition has removed for the specified chassis and index location.
**Format**:      "The Battery has been removed in chassis %1, index %2."
**Severity**:    Warning
**Resolution**:  None.
### MessageId: iLOEvents.{version}.ThermalStatusDegradedSysContinue
The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.
**Format**:      "Temperature out of range in chassis %1, location %2.The server will continue."
**Severity**:    Critical
**Resolution**:  Check the system for hardware failures and verify the environment is properly cooled.
### MessageId: iLOEvents.{version}.ThermalStatusDegradedSysShutdown
The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.
**Format**:      "Temperature out of range on chassis %1, location %2. The server will be shutdown."
**Severity**:    Critical
**Resolution**:  Check the system for hardware failures and verify the environment is properly cooled.
### MessageId: iLOEvents.{version}.ThermalStatusOK
The temperature status has been set to ok in the specified chassis and location. The server's temperature has returned to the normal operating range.
**Format**:      "Temperature normal in chassis %1, location %2."
**Severity**:    OK
**Resolution**:  None.
### MessageId: iLOEvents.{version}.UnauthorizedLoginAttempts
iLO firmware has detected multiple unauthorized login attempts.
**Format**:      "iLO firmware has detected more than %1 unauthorized login attempts."
**Severity**:    OK
**Resolution**:  Check the iLO log for more information on the login failure.
### MessageId: iLOEvents.{version}.iLOReset
iLO reset pending
**Format**:      "iLO reset pending"
**Severity**:    OK
**Resolution**:  None.
