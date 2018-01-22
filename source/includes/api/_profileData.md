## profileData object

profileData objects have the following attributes:

####account

####external_account

####profile_option

integer identifying the profile item for which this is the data

####value

value of this profile item, or if the profile item has more than one value, an array of values.

### profileData.list

<script>tryit('profileData.list')</script> 

> Request example:

```JSON
 {
     select: {
         account: 1
     }
}
```

> Response example:

```JSON
 {
     seconds: "0.105116", 
     jsonrpc: "2.0", 
     id: "", 
     result: {
         count: 4, 
         page: {
             this: {
                 start: 1, 
                 batch: 10
             }
         }, 
         profile_data: [
             {
                 account: "1", 
                value: "(encrypted)", 
                 profile_option: "620"
             }, 
             {
                 account: "1", 
                 value: "206-555-1234", 
                 profile_option: "16"
             }, 
             {
                 account: "1", 
                value: "Brother", 
                profile_option: "186"
            }, 
             {
                 account: "1", 
                 value: [
                     "Data Entry", 
                     "Driver"
                 ], 
                 profile_option: "37"
             }
         ]
     }
}
```

Returns information about account profile data. Uses select criteria. Uses [pagination](#pagination).

Parameters:

####select

An object specifying selection criteria for this request. Minimally either account or profile_type must be specified. The available criteria include:

####account

The account identifier or array of account identifiers for which to return profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the external_account parameter, account is not required.

####external_account

The external account identifier or array of external account identifiers for which to return profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the account parameter, external_account is not required.

####profile_type

The profileType identifier for which to return profile data; defaults to the profile type of the first account specified.

####workgroup

If specified, only select data for accounts which are members of this workgroup.

####profile_option

The profile option for which to return data.

The response results `profile_data` attribute will be an array of the current page of profile data. Each element of the array will be a profileData object.

### profileData.update

<script>tryit('profileData.update')</script> 

> Request example:

```JSON

 {
     account: 1, 
     profile_data: [
         {
             value: "Sister", 
             profile_option: 186
         }, 
         {
             value: "206-555-4321", 
             profile_option: 16
         }
     ]
}
```

> Response example:

```JSON

 {
     seconds: "0.204804", 
     jsonrpc: "2.0", 
     id: "", 
     result: {}
}
```

Updates multiple profileData objects for a given account.

Required parameters:

####account

The account identifier or array of account identifiers for which to update profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the external_account parameter, account is not required.

####external_account

The external account identifier or array of external account identifiers for which to update profile data. When requesting profile data for multiple accounts, it is recommended the caller use an array of account identifiers to increase efficiency, and reduce the overhead of making multiple requests to the API.

**NOTE:** If you are calling this method with the account parameter, external_account is not required.

####profile_data

Array of objects with `profile_option` and `value` attributes designating which profile options are to be updated and their new values.

Response: On success, empty results will be returned.

