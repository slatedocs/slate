# Errors

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

## Response Messages
### Base.AccessDenied
While attempting to access, connect to, or transfer to/from another resource, the service was denied access.

* Severity: Critical
* Suggested Resolution: Verify that the URI is correct and that the service has the appropriate credentials.
### Base.AccountForSessionNoLongerExists
The account for current session is removed and the current session is also removed.

* Suggested Resolution: Attempt to connect using a valid account.
### Base.AccountModified
The account was modified successfully.

### Base.AccountNotModified
The request was unable to modify the account.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, check the authorization or the request body for issues and resubmit the request.
### Base.AccountRemoved
The account was removed successfully.

### Base.ActionNotSupported
The action supplied in the POST operation is not supported by the resource.

* Severity: Critical
* Suggested Resolution: The action was invalid or the wrong resource was the target. See the implementation documentation for assistance.
### Base.ActionParameterDuplicate
The action was submitted with a duplicate parameter in the request body.

* Severity: Warning
* Suggested Resolution: Resubmit the action with only one instance of the parameter in the request body.
### Base.ActionParameterMissing
The requested action is missing a parameter that is required to process the action.

* Severity: Critical
* Suggested Resolution: Resubmit the action with the required parameter in the request body.
### Base.ActionParameterNotSupported
The action parameter is not supported on the target resource.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, remove the parameter and resubmit the request.
### Base.ActionParameterUnknown
An action was submitted, but a supplied parameter did not match any of the known parameters.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the invalid parameter and resubmit the request.
### Base.ActionParameterValueFormatError
The value type is correct, but the format is not supported or the size/length is exceeded

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the parameter value in the request body and resubmit the request.
### Base.ActionParameterValueTypeError
The parameter contains an incorrect value type. For example, a number value for a string parameter type.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the parameter value in the request body and resubmit the request.
### Base.CouldNotEstablishConnection
An attempt to access the resource, image, or file at the URI was unsuccessful because a session could not be established.

* Severity: Critical
* Suggested Resolution: Verify that the URI contains a valid and reachable node name, protocol information, and other URI components.
### Base.CreateFailedMissingReqProperties
A create operation was attempted on a resource, but a required property was missing from the request.

* Severity: Critical
* Suggested Resolution: If the operation did not complete, include the required property with a valid value in the request body and resubmit the request.
### Base.CreateLimitReachedForResource
No more resources can be created.

* Severity: Critical
* Suggested Resolution: If the operation did not complete, delete resources and resubmit the request.
### Base.Created
The resource has been created successfully.

* Suggested Resolution: None
### Base.EventSubscriptionLimitExceeded
The event subscription establishment has been requested, but the operation did not complete because the number of simultaneous subscriptions exceeded the maximum number allowed by the implementation.

* Severity: Critical
* Suggested Resolution: Before attempting to establish the event subscription, reduce the number of subscriptions or increase the maximum number of simultaneous subscriptions allowed (if supported).
### Base.InsufficientPrivilege
The account or credentials associated with the current session are not authorized to perform the requested operation.

* Severity: Critical
* Suggested Resolution: Retry the operation with an authorized account or credentials.
### Base.InternalError
The request did not complete due to an unknown internal error, but the service is still operational.

* Severity: Critical
* Suggested Resolution: Resubmit the request. If the problem persists, consider resetting the service.
### Base.InvalidObject
The object is not valid.

* Severity: Critical
* Suggested Resolution: If the operation did not complete, the object is malformed or the URI is incorrect. Make the appropriate corrections and resubmit the request.
### Base.MalformedJSON
The request body contains malformed JSON.

* Severity: Critical
* Suggested Resolution: Verify that the request body is valid JSON and resubmit the request.
### Base.NoValidSession
The operation did not complete because a valid session is required in order to access resources.

* Severity: Critical
* Suggested Resolution: Establish a session before attempting any operations.
### Base.PropertyDuplicate
A duplicate property is in the request body.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, remove the duplicate property from the request body and resubmit the request.
### Base.PropertyMissing
The request does not include a required property.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, verify the property is in the request body and has a valid value.
### Base.PropertyNotWritable
The request included a value for a read-only property.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, remove the property from the request body and resubmit the request.
### Base.PropertyUnknown
An unknown property is in the request body.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, remove the unknown property from the request body and resubmit the request.
### Base.PropertyValueFormatError
The value type is correct, but the format is not supported or the size/length is exceeded.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the property value in the request body and resubmit the request.
### Base.PropertyValueNotInList
The value type is correct, but the value is not supported.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, choose a value from the enumeration list and resubmit your request.
### Base.PropertyValueTypeError
The property value contains an incorrect property type. For example, a number value for a string property type.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the property value in the request body and resubmit the request.
### Base.QueryNotSupported
The query is not supported by the implementation.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, remove the query parameter and resubmit the request.
### Base.QueryNotSupportedOnResource
The query is not supported on the resource. For example, a start/count query is attempted on a resource that is not a collection.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, remove the query parameters and resubmit the request.
### Base.QueryParameterOutOfRange
The query parameter value is out of range for the resource. For example, a page is requested that is outside the valid page range.

* Severity: Warning
* Suggested Resolution: Specify a query parameter value that is within range. For example, a page that is within the valid range of pages.
### Base.QueryParameterValueFormatError
The value type is correct, but the format is not supported or the size/length was exceeded.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.
### Base.QueryParameterValueTypeError
The query parameter contains an incorrect value type. For example, a number supplied for a query parameter that requires a string.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the value for the query parameter in the request body and resubmit the request.
### Base.ResourceAlreadyExists
The create resource operation did not complete because the resource already exists.

* Severity: Critical
* Suggested Resolution: Do not attempt the create operation because the resource already exists.
### Base.ResourceAtUriInUnknownFormat
The URI is valid, but the resource or image at that URI is in a format that is not supported by the service.

* Severity: Critical
* Suggested Resolution: Place a resource, image, or file that is supported by the service at the URI.
### Base.ResourceAtUriUnauthorized
An attempt to access the resource, image, or file at the URI is unauthorized.

* Severity: Critical
* Suggested Resolution: Verify that the appropriate access is provided for the service to access the URI.
### Base.ResourceCannotBeDeleted
A delete operation was attempted on a resource that cannot be deleted.

* Severity: Critical
* Suggested Resolution: Do not attempt to delete a resource that does not support the REST API DELETE operation.
### Base.ResourceInUse
The request to change the resource was rejected because the resource was in use or in transition.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, wait until the resource is free and resubmit the request.
### Base.ResourceMissingAtURI
The operation expected an image or resource at the provided URI, but found none.

* Severity: Critical
* Suggested Resolution: Place a valid resource at the URI or correct the URI and resubmit the request.
### Base.ServiceInUnknownState
The operation did not complete because the service is in an unknown state and cannot take incoming requests.

* Severity: Critical
* Suggested Resolution: If the operation did not complete, restart the service and resubmit the request.
### Base.ServiceShuttingDown
The operation did not complete because the service is shutting down.

* Severity: Critical
* Suggested Resolution: If the operation did not complete, resubmit the request when the service is available.
### Base.ServiceTemporarilyUnavailable
The service is temporarily unavailable.

* Severity: Critical
* Suggested Resolution: Wait for the indicated retry duration and retry the operation.
### Base.SessionLimitExceeded
Session establishment has been requested, but the operation did not complete because the number of simultaneous sessions exceeded the maximum number allowed by the implementation.

* Severity: Critical
* Suggested Resolution: Before attempting to establish the session, reduce the number of sessions or increase the maximum number of simultaneous sessions allowed (if supported).
### Base.SourceDoesNotSupportProtocol
While attempting to access, connect to, or transfer from another location, the other end of the connection did not support the specified protocol.

* Severity: Critical
* Suggested Resolution: Change protocols or URIs. 
### Base.Success
The operation completed successfully.

* Suggested Resolution: None
### Base.UnrecognizedRequestBody
The service detected a request body with malformed JSON.

* Severity: Warning
* Suggested Resolution: If the operation did not complete, correct the request body and resubmit the request.
./iLO4-tmp-files-928374201293/zipfiles\hp-rest-classes-ilo4-220\RegistryStore\en\Base.0.10.0.json
### HpCommon.ArrayPropertyOutOfBound
The items in the array exceed the maximum  number supported.

* Severity: Warning
* Suggested Resolution: Retry the operation using the correct number of items for the array.
### HpCommon.ConditionalSuccess
A property value was successfully changed but the change may be reverted upon system reset.

* Severity: Warning
* Suggested Resolution: Check the "SettingsResult" messages after the system has reset for errors referring to the corresponding property.
### HpCommon.InternalErrorWithParam
The operation was not successful due to an internal service error (shown), but the service is still operational.

* Severity: Critical
* Suggested Resolution: Retry the operation. If the problem persists, consider resetting the service.
### HpCommon.InvalidConfigurationSpecified
The specified configuration is not valid.

* Severity: Warning
* Suggested Resolution: Correct the configuration, and then retry the operation.
### HpCommon.PropertyValueExceedsMaxLength
The value for the property exceeds the maximum length.

* Severity: Warning
* Suggested Resolution: Correct the value for the property in the request body, and then retry the operation.
### HpCommon.PropertyValueIncompatible
The value for the property is the correct type, but this value is incompatible with the current value of another property.

* Severity: Warning
* Suggested Resolution: Correct the value for the property in the request body, and then retry the operation.
### HpCommon.PropertyValueOutOfRange
The value for the property is out of range.

* Severity: Warning
* Suggested Resolution: Correct the value for the property in the request body, and then retry the operation.
### HpCommon.ResetInProgress
A device or service reset is in progress.

* Severity: Warning
* Suggested Resolution: Wait for device or service reset to complete, and then retry the operation.
### HpCommon.ResetRequired
One or more properties were changed, but these changes will not take effect until the device or service is reset.

* Severity: Warning
* Suggested Resolution: To enable the changed properties, reset the device or service.
### HpCommon.ResourceNotReadyRetry
The resource is present but is not ready to perform operations due to an internal condition such as initialization or reset.

* Severity: Warning
* Suggested Resolution: Retry the operation when the resource is ready.
### HpCommon.SuccessFeedback
The operation completed successfully

* Suggested Resolution: None
### HpCommon.TaskCreated
A task was created in response to the operation.

* Suggested Resolution: Perform an HTTP GET request on the supplied URI for task status.
### HpCommon.UnsupportedHwConfiguration
A previously requested property value change was reverted because the current hardware configuration does not support it.

* Severity: Warning
* Suggested Resolution: Ensure that the system's hardware configuration supports the property value.
./iLO4-tmp-files-928374201293/zipfiles\hp-rest-classes-ilo4-220\RegistryStore\en\HpCommon.0.10.0.json
### iLO.AHSDisabled
Modifying AHS properties is not possible with AHS disabled.

* Severity: Warning
* Suggested Resolution: Enable AHS, and then modify the AHS properties.
### iLO.Accepted
Indicates that one or more properties were correctly changed, but may not be in effect yet.

* Suggested Resolution: None
### iLO.ActionParameterValueNotInList
Indicates that the correct value type was supplied for the action parameter, but the value is not supported. (The value is not in the enumeration list.)

* Severity: Warning
* Suggested Resolution: Choose a value from the enumeration list and resubmit the request if the operation failed.
### iLO.ArrayPropertyOutOfBound
The number of items in the array exceeds the maximum number supported.

* Severity: Warning
* Suggested Resolution: Retry the operation using the correct number of items for the array.
### iLO.CannotRemoveLicense
Cannot remove iLO Standard/iLO Standard for BladeSystem license.

* Severity: Warning
### iLO.DemoLicenseKeyPreviouslyInstalled
A demo license was previously installed.

* Severity: Warning
### iLO.DeviceResetRequired
Indicates that one or more properties were correctly changed, but will not take effect until device is reset.

* Severity: Warning
* Suggested Resolution: Reset the device for the settings to take effect.
### iLO.DiagsTestAlreadyRunning
A diagnostics self test is already running.

* Severity: Warning
* Suggested Resolution: Stop the running test and try again.
### iLO.ESKMServersNotConfigured
Enterprise Secure Key Manager Servers are not configured.

### iLO.ETagTooLong
The supplied ETag is too long. The maximum supported ETag length is 63 bytes.

* Severity: Warning
* Suggested Resolution: Retry the operation using an ETag with a length of 63 bytes or less.
### iLO.EmptyDNSName
DNS name is empty.

* Severity: Warning
* Suggested Resolution: Retry the request with a valid DNS name.
### iLO.ErrorIntializingESKM
Failed to initialize ESKM.

* Severity: Warning
* Suggested Resolution: Check if Account Group, Local CA Certificate Name, Login Name and Password are correct and try again.
### iLO.EventLogCleared
Event log cleared successfully.

### iLO.EventSubscriptionModified
The event subscription was modified successfully.

### iLO.EventSubscriptionRemoved
The event subscription was removed successfully.

### iLO.FirmwareFlashAlreadyInProgress
A firmware upgrade operation is already in progress.

* Severity: Warning
* Suggested Resolution: Wait for the current firmware flash to complete, and then retry the operation.
### iLO.GeneratingCertificate
Generating the X509 Certificate.

### iLO.ICRUNotSupported
ICRU feature or function is not supported on the system.

* Severity: Warning
### iLO.IPv6ConfigurationError
The specified IPv6 configuration caused an error.

* Severity: Warning
* Suggested Resolution: Resolve the indicated error in the configuration data.
### iLO.ImportCertificateFailed
Failed importing Certificate.

* Severity: Warning
* Suggested Resolution: Retry the operation with proper Certificate information.
### iLO.ImportSSOParamError
Not a valid parameter.

* Severity: Warning
* Suggested Resolution: Retry the request with valid parameters.
### iLO.ImportSSOUriError
Not a valid Uri to import SSO certificate.

* Severity: Warning
* Suggested Resolution: Retry the request with valid URI.
### iLO.IndicatorLedInvalidStateChange
The request to change the state of the Indicator LED cannot be granted because the current state is either Blinking or is Unknown.

* Severity: Warning
* Suggested Resolution: Please wait until the server has completed its reserved state.
### iLO.InternalErrorWithParam
The operation was not successful due to an internal service error (shown), but the service is still operational.

* Severity: Critical
* Suggested Resolution: Retry the operation. If the problem persists, consider resetting the service.
### iLO.InvalidConfigurationSpecified
The specified configuration is not valid.

* Severity: Warning
* Suggested Resolution: Correct the configuration, and then retry the operation.
### iLO.InvalidConfigurationSpecifiedForFederation
iLO Federation Management cannot be supported in the current configuration.

* Severity: Warning
* Suggested Resolution: Review the iLO network settings or Onboard Administrator settings and refer to the iLO User Guide.
### iLO.InvalidEngineID
EngineID should be a hexadecimal number starting with 0x (for example, 0x0102030405abcdef). The string length should be an even number, greater than or equal to 6 characters (excluding the "0x"), and less than or equal to 32 characters.

* Severity: Warning
* Suggested Resolution: Retry the operation using an EngineID within the specified parameters.
### iLO.InvalidIndex
The Index is not valid.

* Severity: Warning
* Suggested Resolution: Adhere to the indexes supported in the self links.
### iLO.InvalidLicenseKey
The license key is not valid.

* Severity: Warning
* Suggested Resolution: Retry the operation using a valid license key.
### iLO.InvalidOperationForSystemState
The operation was not successful due to the current power state (for example, attempting to turn the power off when it is already off).

* Severity: Warning
* Suggested Resolution: Verify that the system is in the correct power state, and then retry the operation.
### iLO.InvalidPassphraseLength
The passphrase must contain 8 to 49 characters.

* Severity: Warning
* Suggested Resolution: Correct the passphrase, and then retry the operation.
### iLO.InvalidPasswordLength
The password length is not valid.

* Severity: Critical
* Suggested Resolution: Retry the operation using a corrected password.
### iLO.LicenseKeyNotSupported
The use of a license key is not supported on this system.

* Severity: Warning
### iLO.LicenseKeyRequired
An iLO license key is required to use this operation or feature.

* Severity: Warning
* Suggested Resolution: Install a license key (Advanced or Scale Out) to use this feature.
### iLO.LoginAttemptDelayed
The login was not successful, so the service enforces a delay before another login is allowed.

* Severity: Warning
* Suggested Resolution: Wait for the delay time to expire, and then retry the login.
### iLO.LoginAttemptDelayedSeconds
The login was not successful, so the service enforces a delay before another login is allowed.

* Severity: Warning
### iLO.MaxProviders
The maximum number of providers are already registered.

* Severity: Warning
### iLO.MaxVirtualMediaConnectionEstablished
No more Virtual Media connections are available, because the maximum number of connections are already established.

* Severity: Warning
* Suggested Resolution: Close an established Virtual Media connection, and then retry creating or opening another connection.
### iLO.MembistVariablesNotSupported
Membist variables are not supported on the system.

* Severity: Warning
### iLO.NoSNMPAlertDestinationsConfigured
No SNMP alert destinations are configured.

* Severity: Warning
* Suggested Resolution: Disable SNMP pass-thru, modify the property, and then re-enable SNMP pass-thru.
### iLO.NoSamples
No power history samples are available.

* Suggested Resolution: To accumulate power history samples, power on the server, and then wait at least 5 minutes.
### iLO.NoSpaceforDNSName
No space to store DNS name.

* Severity: Warning
* Suggested Resolution: Make sure SSO database has enough space to store DNS name.
### iLO.NoVirtualMediaConnectionAvailable
No Virtual Media connections exist to perform the operation.

* Severity: Warning
* Suggested Resolution: Create or open a Virtual Media connection, and then retry the operation.
### iLO.NotSupportedOnNIC
This property is not supported by the indicated network port.

* Severity: Warning
* Suggested Resolution: Do not specify this property on the indicated network port.
### iLO.NotValidIPAddrOrDNS
The value for the property is not a valid IPv4/v6 address or DNS name.

* Severity: Warning
* Suggested Resolution: Correct the IPv4/v6 address or DNS name, and then retry the operation.
### iLO.NotValidIPAddress
The value for the property is not a valid IP address.

* Severity: Warning
* Suggested Resolution: Use a valid IP address.
### iLO.NotValidSubnetMask
The value for the property is not a valid subnet mask.

* Severity: Warning
* Suggested Resolution: Use a valid subnet mask.
### iLO.PowerCapOACntrld
The enclosure Onboard Administrator is currently managing the power cap.

* Severity: Warning
* Suggested Resolution: Use Onboard Administrator to Manage the PowerCap
### iLO.PowerValueBadParam
The power cap value is not valid.

* Severity: Warning
* Suggested Resolution: Retry the operation using a corrected value.
### iLO.PowerValueInvalidCalibrationData
The request to set the power cap failed. Invalid power cap calibration data. The Power Cap feature is currently unavailable.

* Severity: Warning
* Suggested Resolution: Restart the server to retrieve calibration data from initial POST.
### iLO.PowerValueNotOptimal
Power caps set for less than 50% of the difference between maximum and minimum power may become unreachable due to changes in the server. Power caps set for less than 20% are not recommended.

* Severity: Warning
* Suggested Resolution: Please provide an optimal value in integer considering the power cap range.
### iLO.PowerValueUnAvailable
Advanced power capping is not currently available due to the system configuration or state.

* Severity: Warning
* Suggested Resolution: Change the system configuration or wait for the system to become fully initialized, and then retry the operation.
### iLO.PowerValueUnSupported
Advanced power capping is not supported on this system.

* Severity: Warning
### iLO.PrimaryESKMServerAccessible
Only the primary ESKM server is accessible.

### iLO.PrimarySecondaryAddressesResolveToSameServer
Primary and secondary ESKM server addresses resolve to the same server.

### iLO.PrimarySecondaryESKMServersAccessible
Both primary and secondary ESKM servers are accessible.

### iLO.PropertyValueBadParam
The property value is not valid.

* Severity: Warning
* Suggested Resolution: Retry the operation using a corrected value.
### iLO.PropertyValueExceedsMaxLength
The value for the property exceeds the maximum length.

* Severity: Warning
* Suggested Resolution: Correct the value for the property in the request body, and then retry the operation.
### iLO.PropertyValueIncompatible
The value for the property is the correct type, but this value is incompatible with the current value of another property.

* Severity: Warning
* Suggested Resolution: Correct the value for the property in the request body, and then retry the operation.
### iLO.PropertyValueOutOfRange
The value for the property is out of range.

* Severity: Warning
* Suggested Resolution: Correct the value for the property in the request body, and then retry the operation.
### iLO.PropertyValueRequired
Indicates that a property was required but not specified.

* Severity: Warning
* Suggested Resolution: Include the required property in the request body and then retry the operation.
### iLO.RepairNotSupported
IML event with this severity is not supported to be repaired. IML events with Critical or Warning severities can marked as repaired.

* Severity: Warning
* Suggested Resolution: Please do not try to repair IML events with severity other than Critical or Warning.
### iLO.RequiredPropertyMissing
Indicates that a required property is not specified.

* Severity: Warning
* Suggested Resolution: Include the required property in the request body and then retry the operation.
### iLO.ResetInProgress
An iLO reset is in progress.

* Severity: Warning
* Suggested Resolution: Wait for iLO reset to complete, and then retry the operation.
### iLO.ResetRequired
One or more properties were changed, but these changes will not take effect until the iLO is reset.

* Severity: Warning
* Suggested Resolution: To enable the changed properties, reset the iLO.
### iLO.ResourceBeingFlashed
The change to the requested resource failed because the resource is being flashed.

* Severity: Warning
* Suggested Resolution: Retry the operation when the firmware upgrade has completed.
### iLO.ResourceInUseWithDetail
The change could not be made because the resource was in use or in a transitioning state.

* Severity: Warning
* Suggested Resolution: Retry the request.
### iLO.ResourceTemporarilyUnavailable
The resource is temporarily unavailable because the firmware is being flashed.

* Severity: Warning
* Suggested Resolution: Retry the operation when the firmware upgrade has completed.
### iLO.SMBIOSRecordNotFound
The SMBIOS record type is not found or is not supported on the system.

* Severity: Warning
* Suggested Resolution: Reset the system to update the SMBIOS records. If the problem persists then the SMBIOS record type is not supported.
### iLO.SNMPAgentlessEnabled
Modifying SNMP properties is not possible while SNMP is configured in Agentless mode.

* Severity: Warning
* Suggested Resolution: Disable Agentless mode, modify the properties, and then re-enable Agentless mode.
### iLO.SNMPAlertDisabled
The operation could not be completed because SNMP alerts are disabled.

* Severity: Warning
* Suggested Resolution: Enable SNMP alerts and retry the operation.
### iLO.SNMPDisabled
Modifying SNMP properties is not possible with SNMP disabled.

* Severity: Warning
* Suggested Resolution: Enable SNMP, and then modify the SNMP properties.
### iLO.SNMPPassthruEnabled
Modifying SNMP properties is not possible while SNMP is configured in pass-thru mode.

* Severity: Warning
* Suggested Resolution: Configure SNMP 'Agentless' mode, modify the property, and then re-configure SNMP for 'Passthru' mode.
### iLO.SNMPTestAlertFailed
The SNMP Test Alert did not send successfully.

* Severity: Warning
* Suggested Resolution: Verify the test alert content and retry.
### iLO.SSOCertficateEmpty
SSO Certificate is Empty.

* Severity: Warning
### iLO.SSOCertificateReadError
SSO Certificate Read Error.

* Severity: Warning
* Suggested Resolution: Retry the request with valid SSO certificate.
### iLO.SSONoSpaceError
No space to store SSO certificate.

* Severity: Warning
* Suggested Resolution: Make sure SSO database has enough space to store SSO certificate.
### iLO.SSORecordNotFound
SSO Record Not Found.

* Severity: Warning
### iLO.SecondaryESKMServerAccessible
Only the secondary ESKM server is accessible.

### iLO.SuccessFeedback
The operation completed successfully.

* Suggested Resolution: None
### iLO.SyslogFeatureDisabled
Remote Syslog feature is disabled.

* Severity: Warning
* Suggested Resolution: Enable remote syslog feature to send test syslog message.
### iLO.SystemResetRequired
The system properties were correctly changed, but will not take effect until the system is reset.

* Severity: Warning
* Suggested Resolution: Reset system for the settings to take effect.
### iLO.TokenRequired
Proper 'X-HPRESTFULAPI-AuthToken' authorization token not provided.

* Severity: Critical
* Suggested Resolution: Create proper 'X-HPRESTFULAPI-AuthToken' authorization token. Send token in using the proper HTTP header.
### iLO.UnableModifyRights
Unable to modify user rights.

* Severity: Warning
### iLO.UnableToModifyDueToMissingComponent
The value for the property cannot be changed because a related hardware component is not installed.

* Severity: Warning
* Suggested Resolution: Install the hardware component and retry the operation.
### iLO.UnableToModifyDuringSystemPOST
The value for the property cannot be changed while the computer system BIOS is in POST.

* Severity: Warning
* Suggested Resolution: After the computer system is either fully booted or powered off, retry the operation.
### iLO.UnauthorizedLoginAttempt
The login was not successful, because the supplied credentials could not be authorized.

* Severity: Warning
* Suggested Resolution: Log in with authorized user name and password credentials.
### iLO.UnsupportedOperation
This operation is not supported by RIS for the current system.

* Severity: Warning
### iLO.UnsupportedOperationInLegacyBootMode
This operation is not supported when the system Boot Mode is set to Legacy BIOS.

* Severity: Warning
* Suggested Resolution: Change the Boot Mode to UEFI and retry the operation.
### iLO.UnsupportedOperationInSystemBIOS
This operation is not supported by the current version of the system BIOS.

* Severity: Warning
### iLO.UserAlreadyExist
The user or login user name already exists.

* Severity: Warning
* Suggested Resolution: Try a different user or login user name.
### iLO.UserNameAlreadyExists
Duplicate SNMPv3 User.

* Severity: Warning
* Suggested Resolution: Enter a different name and try again.
./iLO4-tmp-files-928374201293/zipfiles\hp-rest-classes-ilo4-220\RegistryStore\en\iLO.0.10.0.json
### iLOEvents.CorrectableOrUncorrectableMemoryErrors
Correctable or uncorrectable Memory Errors Detected. Correctable errors have been corrected, but the memory module should be replaced. Value 0 for CPU means memory is not Processor based.

* Severity: Warning
* Suggested Resolution: Replace the failing memory module.
### iLOEvents.DeviceDiscoveryStatus
The server device discovery status has changed.

### iLOEvents.FanDegraded
The fault tolerant fan condition has been set to degraded for the specified chassis and fan.

* Severity: Critical
* Suggested Resolution: Replace the failing fan.
### iLOEvents.FanFailed
The fault tolerant fan condition has been set to failed for the specified chassis and fan.

* Severity: Critical
* Suggested Resolution: Replace the failed fan.
### iLOEvents.FanInserted
A fault tolerant fan has been inserted into the specified chassis and fan location.

### iLOEvents.FanRedundancyLost
The fault tolerant fans have lost redundancy for the specified chassis.

* Severity: Warning
* Suggested Resolution: Check the system fans for a failure.
### iLOEvents.FanRedundancyRestored
The fault tolerant fans have returned to a redundant state for the specified chassis.

### iLOEvents.FanRemoved
A fault tolerant fan has been removed from the specified chassis and fan location.

* Severity: Warning
### iLOEvents.FirmwareFlashStatusChanged
The firmware flash status has changed

### iLOEvents.ILOToInsightRemoteSupportCommunicationFailure
iLO to Insight Remote Support or Insight Online communication failed.

* Severity: Warning
* Suggested Resolution: Please check the connectivity to Insight Remote Support or Insight Online Host.
### iLOEvents.IndicatorLEDStateChanged
The state of the indicator LED has changed

### iLOEvents.MirroredMemoryEngaged
Advanced Memory Protection Mirrored Memory Engaged. The Advanced Memory Protection subsystem has detected a memory fault. Mirrored Memory has been activated. 

* Severity: Warning
* Suggested Resolution: Replace the faulty memory.
### iLOEvents.POSTErrorsOccurred
One or more POST errors occurred. Power On Self-Test (POST) errors occur during the server restart process. Details of the POST error messages can be found in Integrated Management Log 

* Severity: Warning
* Suggested Resolution: Refer to the Integrated Management Log for details on the Power on self-test error.
### iLOEvents.PowerRedundancyLost
The fault tolerant power supplies have lost redundancy for the specified chassis.

* Severity: Warning
* Suggested Resolution: Check the system power supplies for a failure.
### iLOEvents.PowerRedundancyRestored
The fault tolerant power supplies have returned to a redundant state for the specified chassis.

### iLOEvents.PowerSupplyACPowerLoss
Power supply AC power loss for the specified chassis and bay location.

* Severity: Critical
* Suggested Resolution: Check the power source for the specified power supply.
### iLOEvents.PowerSupplyDegraded
The fault tolerant power supply condition has been set to degraded for the specified chassis and bay location.

* Severity: Critical
* Suggested Resolution: Replace the failing power supply.
### iLOEvents.PowerSupplyFailed
The fault tolerant power supply condition has been set to failed for the specified chassis and bay location.

* Severity: Critical
* Suggested Resolution: Replace the failed power supply.
### iLOEvents.PowerSupplyInserted
A fault tolerant power supply has been inserted into the specified chassis and bay location.

### iLOEvents.PowerSupplyOK
The fault tolerant power supply condition has been set back to the OK state for the specified chassis and bay location.

### iLOEvents.PowerSupplyRemoved
A fault tolerant power supply has been removed from the specified chassis and bay location.

* Severity: Warning
### iLOEvents.ResourceAdded
Resource added.

### iLOEvents.ResourceRemoved
Resource removed.

### iLOEvents.ResourceStatusChanged
Resource status changed.

### iLOEvents.ResourceUpdated
Resource updated.

### iLOEvents.SNMPAuthenticationFailure
An unauthorized user attempted to access the iLO via SNMP

### iLOEvents.SecurityOverrideDisengaged
Security override disengaged. iLO firmware has detected the security override jumper has been toggled to the disengaged position.

### iLOEvents.SecurityOverrideEngaged
Security override engaged. iLO firmware has detected the security override jumper has been toggled to the engaged position.

### iLOEvents.ServerHardwareSignatureChanged
The server hardware signature has changed. This can be caused by addition or removal of Mezziane cards or relocation of the server.

### iLOEvents.ServerOperational
The server is operational again. The server has previously been shutdown due to a thermal anomaly on the server and has just become operational again.

* Severity: Warning
### iLOEvents.ServerPostComplete
The server has reached Power On Self Test complete.

### iLOEvents.ServerPowerOnFailure
A request was made to power on the server, however the server could not be powered on due to a failure condition.

* Severity: Critical
### iLOEvents.ServerPoweredOff
The server has been powered off.

### iLOEvents.ServerPoweredOn
The server has been powered on.

### iLOEvents.ServerResetDetected
Server Reset Detected. iLO firmware has detected a server reset.

* Severity: Critical
### iLOEvents.SystemBatteryFailed
The system battery condition has been set to failed for the specified chassis and index location.

* Severity: Warning
* Suggested Resolution: Replace the failed battery.
### iLOEvents.SystemBatteryRemoved
The system battery condition has removed for the specified chassis and index location.

* Severity: Warning
### iLOEvents.ThermalStatusDegradedSysContinue
The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.

* Severity: Critical
* Suggested Resolution: Check the system for hardware failures and verify the environment is properly cooled.
### iLOEvents.ThermalStatusDegradedSysShutdown
The temperature status has been set to degraded in the specified chassis and location. The server's temperature is outside of the normal operating range.

* Severity: Critical
* Suggested Resolution: Check the system for hardware failures and verify the environment is properly cooled.
### iLOEvents.ThermalStatusOK
The temperature status has been set to ok in the specified chassis and location. The server's temperature has returned to the normal operating range.

### iLOEvents.UnauthorizedLoginAttempts
iLO firmware has detected multiple unauthorized login attempts.

* Suggested Resolution: Check the iLO log for more information on the login failure.
### iLOEvents.iLOReset
iLO reset pending