## Trials
Manage trials and trials settings.

### Trials Settings
Manage trials settings.

<!-------------------- LIST TRIALS SETTINGS -------------------->

#### List trials settings

`GET /trials_settings`

```shell
# Retrieve trials settings
curl "https://cloudmc_endpoint/rest/trials_settings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
      "organization": {
        "id": "23910576-d29f-4c14-b663-31d728ff49a5",     
      },
      "duration": 14,
      "extensionDays": 7,
      "maxConcurrentTrials": 5,
      "cleanupDelayDays": 5,
      "expirationReminderDays": 3,
      "allowMultipleTrialSameEmail": false,
      "enableRecaptcha": true,
      "recaptchaSitekey": "6Lfg9rkZAAAAAHAwlr6_qs4QBTFRHVFgLhK3XXX",
      "recaptchaSecretkey": "6Lfg9rkZAAAAAOSjYqghXeQ7zfagZTqXXXRmXXE",
      "contactUsEmail": "email@gmail.com",
      "contactUsPhone": "555-555-555",
      "registrationHTML": {
        "en": "<div>Registration HTML EN</div>",
        "fr": "<div>Registration HTML FR</div>"
      },
      "termsAndConditionsHTML": {
        "en": "<div>Terms and conditions HTML EN</div>",
        "fr": "<div>Terms and conditions HTML FR</div>"
      }
    }
  ]
}
```
List the trials settings configured on the system.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only settings for the provided organization id. If not provided, will default to the user organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial settings.
`organization.id`<br/>*UUID* | The organization id that the trial settings is linked to.
`duration`<br/>*integer* | The number of days a trial account will remain active.
`extensionDays`<br/>*integer* | The number of days that a trial administrator adds when extending an active trial.
`maxConcurrentTrials`<br/>*integer* | The number of organizations that can concurrently have an active trial account. A value of zero indicates that there is no upper limit.
`cleanupDelayDays`<br/>*integer* | The number of days after the trial expiration before the system will delete the trial's resources.
`expirationReminderDays`<br/>*integer* | The number of days before the trial's end that the trial administrator will receive an email notification that the trial is about to expire.
`allowMultipleTrialSameEmail`<br/>*boolean* | If more than one trial account can be created using the same email address.
`enableRecaptcha`<br/>*boolean* | If the reCAPTCHA verification on the sign up form is displayed. The reCAPTCHA site key and secret key must be present.
`recaptchaSitekey`<br/>*string* | The site key obtained from the reCAPTCHA admin console (Google).
`recaptchaSecretkey`<br/>*string* | The secret key obtained from the reCAPTCHA admin console (Google).
`contactUsEmail`<br/>*string* | The email address that trial user can contact for more info/support.
`contactUsPhone`<br/>*string* | The phone number that trial user can contact for more info/support.
`registrationHTML`<br/>*Object* | Mapped object containing the registration information HTML in different languages.
`termsAndConditionsHTML`<br/>*Object* | Mapped object containing the terms and conditions HTML name in different languages.



<!-------------------- GET TRIAL SETTINGS -------------------->

#### Retrieve trial settings

`GET /trials_settings/:id`

```shell
# Retrieve trial settings
curl "https://cloudmc_endpoint/rest/trials_settings/b41f2aa3-e2d1-48d8-9760-8b874c20e8ae" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5",     
    },
    "duration": 14,
    "extensionDays": 7,
    "maxConcurrentTrials": 5,
    "cleanupDelayDays": 5,
    "expirationReminderDays": 3,
    "allowMultipleTrialSameEmail": false,
    "enableRecaptcha": true,
    "recaptchaSitekey": "6Lfg9rkZAAAAAHAwlr6_qs4QBTFRHVFgLhK3XXX",
    "recaptchaSecretkey": "6Lfg9rkZAAAAAOSjYqghXeQ7zfagZTqXXXRmXXE",
    "contactUsEmail": "email@gmail.com",
    "contactUsPhone": "555-555-555",
    "registrationHTML": {
      "en": "<div>Registration HTML EN</div>",
      "fr": "<div>Registration HTML FR</div>"
    },
    "termsAndConditionsHTML": {
      "en": "<div>Terms and conditions HTML EN</div>",
      "fr": "<div>Terms and conditions HTML FR</div>"
    }
  }
}
```
Retrieve the trial settings configured associated to the id on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial settings.
`organization.id`<br/>*UUID* | The organization id that the trial settings is linked to.
`duration`<br/>*integer* | The number of days a trial account will remain active.
`extensionDays`<br/>*integer* | The number of days that a trial administrator adds when extending an active trial.
`maxConcurrentTrials`<br/>*integer* | The number of organizations that can concurrently have an active trial account. A value of zero indicates that there is no upper limit.
`cleanupDelayDays`<br/>*integer* | The number of days after the trial expiration before the system will delete the trial's resources.
`expirationReminderDays`<br/>*integer* | The number of days before the trial's end that the trial administrator will receive an email notification that the trial is about to expire.
`allowMultipleTrialSameEmail`<br/>*boolean* | If more than one trial account can be created using the same email address.
`enableRecaptcha`<br/>*boolean* | If the reCAPTCHA verification on the sign up form is displayed. The reCAPTCHA site key and secret key must be present.
`recaptchaSitekey`<br/>*string* | The site key obtained from the reCAPTCHA admin console (Google).
`recaptchaSecretkey`<br/>*string* | The secret key obtained from the reCAPTCHA admin console (Google).
`contactUsEmail`<br/>*string* | The email address that trial user can contact for more info/support.
`contactUsPhone`<br/>*string* | The phone number that trial user can contact for more info/support.
`registrationHTML`<br/>*Object* | Mapped object containing the registration information HTML in different languages.
`termsAndConditionsHTML`<br/>*Object* | Mapped object containing the terms and conditions HTML name in different languages.


<!-------------------- UPDATE TRIALS SETTINGS -------------------->

#### Update trial settings

`PUT /trials_settings/:id`

```shell
# Updates an existing trial's settings
curl -X PUT "https://cloudmc_endpoint/rest/trials_settings/:id" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
  "organization": {
    "id": "23910576-d29f-4c14-b663-31d728ff49a5",     
  },
  "organizationId": "23910576-d29f-4c14-b663-31d728ff49a5",
  "duration": 14,
  "extensionDays": 7,
  "maxConcurrentTrials": 5,
  "cleanupDelayDays": 5,
  "expirationReminderDays": 3,
  "allowMultipleTrialSameEmail": false,
  "enableRecaptcha": true,
  "recaptchaSitekey": "6Lfg9rkZAAAAAHAwlr6_qs4QBTFRHVFgLhK3XXX",
  "recaptchaSecretkey": "6Lfg9rkZAAAAAOSjYqghXeQ7zfagZTqXXXRmXXE",
  "contactUsEmail": "email@gmail.com",
  "contactUsPhone": "555-555-555",
  "registrationHTML": {
    "en": "<div>Registration HTML EN</div>",
    "fr": "<div>Registration HTML FR</div>"
  },
  "termsAndConditionsHTML": {
    "en": "<div>Terms and conditions HTML EN</div>",
    "fr": "<div>Terms and conditions HTML FR</div>"
  }
}
```
> The above command return JSON structured like this:

```json
{
  "data": {
    "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5",     
    },
    "duration": 14,
    "extensionDays": 7,
    "maxConcurrentTrials": 5,
    "cleanupDelayDays": 5,
    "expirationReminderDays": 3,
    "allowMultipleTrialSameEmail": false,
    "enableRecaptcha": true,
    "recaptchaSitekey": "6Lfg9rkZAAAAAHAwlr6_qs4QBTFRHVFgLhK3XXX",
    "recaptchaSecretkey": "6Lfg9rkZAAAAAOSjYqghXeQ7zfagZTqXXXRmXXE",
    "contactUsEmail": "email@gmail.com",
    "contactUsPhone": "555-555-555",
    "registrationHTML": {
      "en": "<div>Registration HTML EN</div>",
      "fr": "<div>Registration HTML FR</div>"
    },
    "termsAndConditionsHTML": {
      "en": "<div>Terms and conditions HTML EN</div>",
      "fr": "<div>Terms and conditions HTML FR</div>"
    }
  }
}
```

Updates a specific trial's settings.

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial settings.
`organization.id`<br/>*UUID* | The organization id that the trial settings is linked to. It cannot be changed.
`duration`<br/>*integer* | The number of days a trial account will remain active.
`extensionDays`<br/>*integer* | The number of days that a trial administrator adds when extending an active trial.
`maxConcurrentTrials`<br/>*integer* | The number of organizations that can concurrently have an active trial account. A value of zero indicates that there is no upper limit.
`cleanupDelayDays`<br/>*integer* | The number of days after the trial expiration before the system will delete the trial's resources.
`expirationReminderDays`<br/>*integer* | The number of days before the trial's end that the trial administrator will receive an email notification that the trial is about to expire.
`allowMultipleTrialSameEmail`<br/>*boolean* | If more than one trial account can be created using the same email address. 
`contactUsEmail`<br/>*string* | The email address that trial user can contact for more info/support.
`registrationHTML`<br/>*Object* | Mapped object containing the registration information HTML in different languages.
`termsAndConditionsHTML`<br/>*Object* | Mapped object containing the terms and conditions HTML name in different languages.

Optional | &nbsp;
---------- | -----------
`contactUsPhone`<br/>*string* | The phone number that trial user can contact for more info/support.
`enableRecaptcha`<br/>*boolean* | If the reCAPTCHA verification on the sign up form is displayed. The reCAPTCHA site key and secret key must be present. Default is false.
`recaptchaSitekey`<br/>*string* | The site key obtained from the reCAPTCHA admin console (Google). Mandatory if recaptcha is enabled.
`recaptchaSecretkey`<br/>*string* | The secret key obtained from the reCAPTCHA admin console (Google). Mandatory if recaptcha is enabled.

### Trials Management
Manage trials through it lifecycle.

<!-------------------- LIST TRIALS -------------------->

#### List trials

`GET /trials`

```shell
# Retrieve trials
curl "https://cloudmc_endpoint/rest/trials" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "expiryDate": "2020-10-24T13:38:57.000Z",
      "hasActivatedUser": false,
      "firstName": "John",
      "lastName": "Doe",
      "persistedOrganizationId": "0518842d-1ad6-4b66-abc4-2cf48d502b4c",
      "resellerOrganization": {
        "id": "23910576-d29f-4c14-b663-31d728ff49a5",     
      },
      "createdDate": "2020-10-19T13:36:25.000Z",
      "organizationName": "John Doe Corp",
      "activity": [
        5,
        1,
        0,
        null,
        null,
        null
      ],
      "organization": {
        "serviceConnections": [
          {
            "commitmentTrackingEnabled": false,
            "metricsTrackingEnabled": false,
            "serviceCode": "gcp",
            "iconOverrideUrl": "",
            "name": "gcp",
            "locations": [],
            "id": "749e314b-d979-4882-9ba8-417862381266",
            "state": "PROVISIONED",
            "type": "gcp",
            "reachable": true,
            "trialEnvironmentLimit": 2
          }
        ],
        "name": "John Doe Corp",
        "id": "0518842d-1ad6-4b66-abc4-2cf48d502b4c"
      },
      "id": "019d31ed-fae2-4c83-96e6-1e67c5ac5192",
      "email": "john.doe@yahoo.com",
      "status": "ONGOING"
    }
  ]
}
```

List the trials configured on the system.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only settings for the provided organization id. If not provided, will default to the user organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial.
`resellerOrganization.id`<br/>*UUID* | The reseller organization id that the trial belongs to.
`status`<br/>*string* | The status of the trial. Possible values are:  SUBMITTED, PENDING, DENIED, ONGOING, EXPIRED, PURGED, CONVERTED.
`firstName`<br/>*string* | The first name of the person that requested the trial.
`lastName`<br/>*string* | The last name of the person that requested the trial.
`email`<br/>*string* | The email address of the person that requested the trial.
`organizationName`<br/>*string* | The name of the organization for which the requester is doing the trial for.
`createdDate`<br/>*string* | The creation date of the trial.
`expiryDate`<br/>*string* | The expiration date of the trial.
`persistedOrganizationId`<br/>*UUID* | The id of the organization created in the system once the trial is approved.
`organization`<br/>*Object* | The organization object created in the system for this organization once the trial is approved.


<!-------------------- GET TRIAL -------------------->

#### Retrieve trial

`GET /trials/:id`

```shell
# Retrieve trial
curl "https://cloudmc_endpoint/rest/trials/b41f2aa3-e2d1-48d8-9760-8b874c20e8ae" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
    "resellerOrganization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5",     
    },
    "lastName": "Doe",
    "approvalDate": "2020-10-19T13:38:57.000Z",
    "activity": [
      5,
      1,
      0,
      null,
      null,
      null
    ],
    "extensionEmailDate": "2020-10-21T14:09:18.000Z",
    "language": "en",
    "blurb": "We need CloudMC services",
    "expiryDate": "2020-10-24T13:38:57.000Z",
    "email": "john.doe@yahoo.com",
    "organizationName": "John Doe Corp",
    "manuallyApproved": false,
    "extensionCount": 0,
    "hasActivatedUser": false,
    "firstName": "John",
    "persistedOrganizationId": "0518842d-1ad6-4b66-abc4-2cf48d502b4c",
    "createdDate": "2020-10-19T13:36:25.000Z",
    "phoneNumber": "5144436363",
    "organization": {
      "serviceConnections": [
        {
          "commitmentTrackingEnabled": false,
          "metricsTrackingEnabled": false,
          "serviceCode": "gcp",
          "iconOverrideUrl": "",
          "name": "gcp",
          "locations": [],
          "id": "749e314b-d979-4882-9ba8-417862381266",
          "state": "PROVISIONED",
          "type": "gcp",
          "reachable": true,
          "trialEnvironmentLimit": 2
        }
      ],
      "name": "John Doe Corp",
      "id": "0518842d-1ad6-4b66-abc4-2cf48d502b4c"
    },
    "username": "john.doe@yahoo.com",
    "status": "ONGOING"
  }
}
```
Retrieve the trial associated to the id on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial.
`resellerOrganization.id`<br/>*UUID* | The reseller organization id that the trial belongs to.
`status`<br/>*string* | The status of the trial. Possible values are:  SUBMITTED, PENDING, DENIED, ONGOING, EXPIRED, PURGED, CONVERTED.
`firstName`<br/>*string* | The first name of the person that requested the trial.
`lastName`<br/>*string* | The last name of the person that requested the trial.
`email`<br/>*string* | The email address of the person that requested the trial.
`phoneNumber`<br/>*string* | The phone number of the person that requested the trial.
`organizationName`<br/>*string* | The name of the organization for which the requester is doing the trial for.
`createdDate`<br/>*string* | The creation date of the trial.
`expiryDate`<br/>*string* | The expiration date of the trial.
`persistedOrganizationId`<br/>*UUID* | The id of the organization created in the system once the trial is approved.
`organization`<br/>*Object* | The organization object created in the system for this organization once the trial is approved.
`username`<br/>*string* | The username associated to the creator of the trial.
`approvalDate`<br/>*string* | The approval date of the trial.
`denialDate`<br/>*string* | The denial date of the trial.
`denialReason`<br/>*string* | The reason the trial is denied.
`extensionCount`<br/>*integer* | The number of times the trial was extended.
`language`<br/>*string* | The language used when creating the trial.
`manuallyApproved`<br/>*boolean* | If the trial is manually approved.
`extensionEmailDate`<br/>*string* | The date the extension email notification was sent.
`extensionDate`<br/>*string* | The date the trial was extended.
`shutdownDate`<br/>*string* | The date the trial was shutdown.
`purgeDate`<br/>*string* | The date the trial was purged.
`conversionDate`<br/>*string* | The date the trial was converted to an active organization.
`blurb`<br/>*string* | The cloud requirements entered in the trial registration.



      
<!-------------------- REMAINING SLOTS TRIAL -------------------->

#### Trial remaining slots 

`POST /trials/:id/remaining`

```shell
# Get trial remaining slots
curl -X GET "https://cloudmc_endpoint/rest/trials/remaining" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": 10
}
```
Indicates how many organizations can concurrently have an active trial with automatic approval.

Query Params | &nbsp;
---- | -----------
`organization_id`<br/>*UUID* | Return only settings for the provided organization id. If not provided, it will default to the reseller configuration matching the url.


<!-------------------- ACTIVATE TRIAL -------------------->

#### Activate trial

`POST /trials/:id/activate`

```shell
# Activate a trial
curl -X PUT "https://cloudmc_endpoint/rest/trials/:id/activate" \
   -H "MC-Api-Key: your_api_key"
```

Activate the trial for the provided id.

<!-------------------- EXTEND TRIAL -------------------->

#### Extend trial

`POST /trials/:id/extend`

```shell
# Extend a trial
curl -X PUT "https://cloudmc_endpoint/rest/trials/:id/extend" \
   -H "MC-Api-Key: your_api_key"
```

Extend the trial for the provided id.

Query Params | &nbsp;
---- | -----------
`extendDate`<br/>*long* | The date in a long format to which the trial will be extend to. Default value is the expired date adding with the number of days for an extension defined in the trial settings.


<!-------------------- TERMINATE TRIAL -------------------->

#### Terminal trial

`POST /trials/:id/terminate`

```shell
# Extend a trial
curl -X PUT "https://cloudmc_endpoint/rest/trials/:id/terminate" \
   -H "MC-Api-Key: your_api_key"
```

Terminate the trial for the provided id.

Query Params | &nbsp;
---- | -----------
`purge`<br/>*boolean* | Indicate if the trial needs to be purge as well. Default is false.


<!-------------------- DENY TRIAL -------------------->

#### Deny trial

`POST /trials/:id/deny`

```shell
# Deny a trial
curl -X PUT "https://cloudmc_endpoint/rest/trials/:id/deny" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```
As per client request
``` 
Deny the trial for the provided id. The body of the request is the reason for being denied.


<!-------------------- CONVERT TO BILLABLE -------------------->

#### Convert to billable

`POST /trials/:id/convertToBillable`

```shell
# Cnvert to billable a trial
curl -X PUT "https://cloudmc_endpoint/rest/trials/:id/convertToBillable" \
   -H "MC-Api-Key: your_api_key"
```

Convert to billable the trial for the provided id.

Query Params | &nbsp;
---- | -----------
`billableStartDate`<br/>*long* | The date time in a long format for which the trial will be converted. It is mandatory.



<!-------------------- GET TRIAL ACTIVITIES -------------------->

#### Retrieve trial activities

`GET /trials/:id/activity`

```shell
# Retrieve trial activities
curl "https://cloudmc_endpoint/rest/trials/b41f2aa3-e2d1-48d8-9760-8b874c20e8ae/activity" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "userLastname": "Doe",
      "organizationId": "0518842d-1ad6-4b66-abc4-2cf48d502b4c",
      "requesterIp": "127.0.0.1",
      "userEmail": "john.doe@yahoo.com",
      "id": "5e854a75-11d2-47ea-a1b4-df7d5886294c",
      "userOrganizationId": "23910576-d29f-4c14-b663-31d728ff49a5",
      "organizationName": "John Doe corpo",
      "created": "2020-10-20T15:41:18.666Z",
      "userId": "39f2b0ea-85f0-49a0-b005-c34fa62baf27",
      "eventContext": "{...}",
      "eventCode": "email_template.preview",
      "userFirstname": "John",
      "userOrganizationName": "System",
      "category": "SYSTEM",
      "updated": "2020-10-20T15:41:19.149Z",
      "status": "SUCCESS",
      "username": "john.doe@yahoo.com"
    }
  ]
}
```

Retrieve the activities related to the trial associated to the id on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The activity Id.
`organizationId`<br/>*UUID* | The id of the organization impacted by the activity.
`organizationName`<br/>*UUID* | The name of the organization impacted by the activity.
`userId`<br/>*UUID* | The id of the person that made the activity.
`username`<br/>*string* | The username of the person that made the activity.
`userOrganizationId`<br/>*UUID* | The organization id of the user that made the activity.
`userOrganizationName`<br/>*string* | The organization name of the user that made the activity.
`userFirstName`<br/>*string* | The last name of the person that made the activity.
`userLastName`<br/>*string* | The last name of the person that made the activity.
`userEmail`<br/>*string* | The email address of the person that made the activity.
`createdDate`<br/>*string* | The creation date of the activity.
`updatedDate`<br/>*string* | The update date of the activity.
`requesterIp`<br/>*string* | The requester ip address
`parentId`<br/>*UUID* | The organization object created in the system for this organization once the trial is approved.
`environmentId`<br/>*UUID* | The id of the impacted environment.
`environmentName`<br/>*string* | The name of the impacted environment.
`serviceConnectionId`<br/>*UUID* | The id of the impacted service connection.
`serviceConnectionName`<br/>*string* | The name of the impacted service connection.
`serviceConnectionType`<br/>*string* | The type of the impacted service connection.
`category`<br/>*string* | The category of the activity. Possible values: SYSTEM, SERVICE_OPERATION.
`status`<br/>*string* | The status of the activity. Possible values: PENDING, SUCCESS, FAILURE, PARTIAL_SUCCESS.
`eventContext`<br/>*string* | Information link to the context of the activity in a JSON format.
`serviceError`<br/>*string* | Description of an error in the service operation activities.
`apiKeyId`<br/>*UUID* | The ID of the api key used to make this activity.
`apiKeyName`<br/>*string* | The name of the api key used to make this activity.
         


<!-------------------- GET TRIAL USERS-------------------->

#### Retrieve trial users

`GET /trials/:id/users`

```shell
# Retrieve trial users
curl "https://cloudmc_endpoint/rest/trials/b41f2aa3-e2d1-48d8-9760-8b874c20e8ae/users" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "firstName": "John",
      "lastName": "Doe",
      "failedLoginCount": 0,
      "id": "11391f05-3828-49d7-b7f8-eca7f353cbc2",
      "userName": "john.doe@yahoo.com",
      "loginCount": 0
    }
  ]
}
```

Retrieve the users related to the trial associated to the id on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial.
`firstName`<br/>*string* | The first name of the user.
`lastName`<br/>*string* | The last name of the user.
`username`<br/>*string* | The username of the user.
`failedLoginCount`<br/>*integer* | The count of failed login for that user.
`loginCount`<br/>*integer* | The count of successful login for that user.
`failedLoginCount`<br/>*integer* | The count of failed login for that user.
`lastLogin`<br/>*string* | The date of the last login
`lastFailedLogin`<br/>*string* | The date of the last failed login




<!-------------------- RESEND EMAIL -------------------->

#### Resend trial email

`GET /trials/:id/resend_email`

```shell
# Resend trial email
curl "https://cloudmc_endpoint/rest/trials/b41f2aa3-e2d1-48d8-9760-8b874c20e8ae/resend_email" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": true
}
```

Resend a trial email based on the status and type provided. If no email is send, it returns false.

Query Param | &nbsp;
---------- | -----------
`email`<br/>*UUID* | The type of email to resend. Possible values: validation, user_activation.


<!-------------------- GET TRIAL STATUSES -------------------->

#### Retrieve trial statuses

`GET /trials/statuses`

```shell
# Retrieve trial statuses
curl "https://cloudmc_endpoint/rest/trials/statuses" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    "SUBMITTED",
    "PENDING",
    "DENIED",
    "ONGOING",
    "EXPIRED",
    "PURGED",
    "CONVERTED"
  ]
}
```

Retrieve the possible trial statuses in the application.
