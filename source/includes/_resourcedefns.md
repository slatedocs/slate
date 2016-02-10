### AccountService
This is the schema definition for the Account service. It represents the properties for this service and has links to the list of accounts.
**Instances**:  
* `https://{iLO}/redfish/v1/accountservice`
#### Oem/Hp/AuthFailureLoggingThreshold (Integer)
This property enables you to view and configure logging criteria for failed authentications. A failed login log entry is recorded after the configured number of attempts. 0 = feature disabled; 1-3 and 5 are allowable values.
`PATCH {"Oem": {"Hp": {"AuthFailureLoggingThreshold": <integer-value>}}}`
#### Oem/Hp/MinPasswordLength (Integer)
This property specifies the minimum number of characters allowed when a user password is set or changed. It must be a value from 0 to 39.
`PATCH {"Oem": {"Hp": {"MinPasswordLength": <integer-value>}}}`
