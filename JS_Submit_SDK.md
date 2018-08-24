

2. Submit Lead SDK

It is reccommended that this SDK is loaded in the head tag of the page as shown below.

```html
<!DOCTYPE html>
  <html lang="en-us">
  <head>
    <script type="text/javascript" src="https://s3.ap-south-1.amazonaws.com/anarock.misc/submit.js"></script>
  </head>
  <body>
  ....
  </body>
</html>
```

Including this SDK exposes `window.submitLeadToAnarock` function which takes in below parameters

```js
window.submitLeadToAnarock({name: 'name', phone: 9819619866, country_code: 'in', email: 'yadav.rahul026@gmail.com', remarks: 'remarks to be submitted', campaign_id: 'campaign-id', channel_name: 'channel_name', api_key: 'asd298379246798s7d', onLeadSuccessCallback: function(){}, onLeadFailureCallback: function(){}, onInvalidPhone: (){}, env: 'staging'}
```
The description of various parameters is given below.

| Parameter | Type | Default Value | Required | Description |
| --- | --- | --- | --- | --- |
| name | string | '' | true |name of the lead |
| phone | integer or string | null | true | phone number of lead |
| country_code | string | 'in' | true | Standard ISO3166-1 alpha-2 code for a country. Link: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 |
| email | string | null | true | email id of lead |
| campaign_id | string | null | true | campaign_id - specific for a project - ask from anarock team |
| channel_name | string | null | true | channel_name - specific for an agency - ask from anarock team |
| api_key | string | null | true | api_key - specific for an agency - ask from anarock team |
| onLeadSuccessCallback | function | null | - | function that will be called on successful submission of lead, arguments are (lead_id, data_submitted_to_anarock) |
| onLeadFailureCallback | function | null | - | function that will be called on failure of lead submission, arguments are (null, data_submitted_to_anarock) |
| onInvalidPhone | function | null | - | called if the phone number passed is invalid for the given country_code in parameters, if phone number is wrong, lead will never be submitted to anarock database  |

It is very important to handle `onInvalidPhone` and show user with appropritate messages on UI if you are using Form SDK. 

In addition to `onLeadSuccessCallback` and `onLeadFailureCallback` optional global functions can be defined as `window.onLeadSucess` called on successful submission and `window.onLeadFailure` called on failure in submitting the lead to anarock database.
