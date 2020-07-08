### Trials
Manage trials and trials settings.

<!-------------------- LIST TRIALS SETTINGS -------------------->

#### List trials settings

`GET /trials_settings`

```shell
# Retrieve trials settings
curl "https://cloudmc_endpoint/v1/trials_settings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
      "duration": 14,
      "extensionDays": 7,
      "maxConcurrentTrials": 5,
      "cleanupDelayDays": 5,
      "expirationReminderDays": 3,
      "allowMultipleTrialSameEmail": false,
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

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial settings.
`duration`<br/>*integer* | The number of days a trial account will remain active.
`extensionDays`<br/>*integer* | The number of days that a trial administrator adds when extending an active trial.
`maxConcurrentTrials`<br/>*integer* | The number of organizations that can concurrently have an active trial account. A value of zero indicates that there is no upper limit.
`cleanupDelayDays`<br/>*integer* | The number of days after the trial expiration before the system will delete the trial's resources.
`expirationReminderDays`<br/>*integer* | The number of days before the trial's end that the trial administrator will receive an email notification that the trial is about to expire.
`allowMultipleTrialSameEmail`<br/>*boolean* | If more than one trial account can be created using the same email address. 
`contactUsEmail`<br/>*string* | The email address that trial user can contact for more info/support.
`contactUsPhone`<br/>*string* | The phone number that trial user can contact for more info/support.
`registrationHTML`<br/>*Object* | Mapped object containing the registration information HTML in different languages.
`termsAndConditionsHTML`<br/>*Object* | Mapped object containing the terms and conditions HTML name in different languages.



<!-------------------- GET TRIAL SETTINGS -------------------->

#### Retrieve trial settings

`GET /trials_settings/:id`

```shell
# Retrieve trial settings
curl "https://cloudmc_endpoint/v1/trials_settings/b41f2aa3-e2d1-48d8-9760-8b874c20e8ae" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
    "duration": 14,
    "extensionDays": 7,
    "maxConcurrentTrials": 5,
    "cleanupDelayDays": 5,
    "expirationReminderDays": 3,
    "allowMultipleTrialSameEmail": false,
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
Return the trial settings configured associated to the id on the system.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial settings.
`duration`<br/>*integer* | The number of days a trial account will remain active.
`extensionDays`<br/>*integer* | The number of days that a trial administrator adds when extending an active trial.
`maxConcurrentTrials`<br/>*integer* | The number of organizations that can concurrently have an active trial account. A value of zero indicates that there is no upper limit.
`cleanupDelayDays`<br/>*integer* | The number of days after the trial expiration before the system will delete the trial's resources.
`expirationReminderDays`<br/>*integer* | The number of days before the trial's end that the trial administrator will receive an email notification that the trial is about to expire.
`allowMultipleTrialSameEmail`<br/>*boolean* | If more than one trial account can be created using the same email address. 
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

```js
{
  "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
  "duration": 14,
  "extensionDays": 7,
  "maxConcurrentTrials": 5,
  "cleanupDelayDays": 5,
  "expirationReminderDays": 3,
  "allowMultipleTrialSameEmail": false,
  "contactUsEmail": "email@gmail.com",
  "contactUsPhone": "555-555-555",
  "registrationHTML": {
    "en": "<div>Registration HTML EN</div>",
    "fr": "<div>Registration HTML FR</div>",
  },
  "termsAndConditionsHTML": {
    "en": "<div>Terms and conditions HTML EN</div>",
    "fr": "<div>Terms and conditions HTML FR</div>",
  }
}
```
> The above command return JSON structured like this:

```js
{
  "data": {
    "id": "b41f2aa3-e2d1-48d8-9760-8b874c20e8ae",
    "duration": 14,
    "extensionDays": 7,
    "maxConcurrentTrials": 5,
    "cleanupDelayDays": 5,
    "expirationReminderDays": 3,
    "allowMultipleTrialSameEmail": false,
    "contactUsEmail": "email@gmail.com",
    "contactUsPhone": "555-555-555",
    "registrationHTML": {
      "en": "<div>Registration HTML EN</div>",
      "fr": "<div>Registration HTML FR</div>",
    },
    "termsAndConditionsHTML": {
      "en": "<div>Terms and conditions HTML EN</div>",
      "fr": "<div>Terms and conditions HTML FR</div>",
    }
  }
}
```

Updates a specific trial's settings.

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the trial settings.
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
