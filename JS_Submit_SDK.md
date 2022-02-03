# Submit Lead JS SDK

JavaScript SDK which provides wrapper over sync/push lead API and also supports OTP verification feature to submit OTP verified lead

It is recommended that `submit.js` script be added inside the head tag of the HTML page as shown below:

```html
<!DOCTYPE html>
  <html lang="en-us">
  <head>
    <script type="text/javascript" src="https://s3.ap-south-1.amazonaws.com/anarock.misc/submit.js" defer async></script>
  </head>
  <body>
  ....
  </body>
</html>
```

> Note:
> 1. You should either use `form.js` or `submit.js` depending on your use case.
> 2. `form.js` provides UI form components out of the box with default form fields, whereas `submit.js` gives you flexibility to show/render your own form UI.
  3. Remove "defer async" if it is not hit in the loadeding the form page.  


### This SDK exposes __two__ methods with `window.Anarock` object:

#### 1. `submitLead` - _window.Anarock.submitLead_
Primary function to submit or pushing a lead to host database

```js
window.Anarock.submitLead({
  api_key: '<API-KEY>', // get your api/auth key from support team
  env: 'staging',
  host: 'anarock.com',
  channel_name: 'website',
  campaign_id: 'website-internal-test',
  name: 'Abc Xyz',
  email: 'abc@test.com',
  purpose: 'buy',
  country_code: 'in',
  phone: '9999999999', // valid 10-digits phone number
  source_id: 1, // check the proper mapping with leads source dashboard
  sub_source_id: 1, // check the proper mapping with leads subsource dashboard
  source: 'sms',
  sub_source: 'sms-december-campaign',
  onLeadSuccessCallback(leadID, data) {
    console.log('lead captured with ID:', leadID)
  },
  onLeadFailureCallback(errorMessage) {
    console.log(errorMessage)
  },
  extra_details: { // optional
    buildingNo: '102',
    flatNo: '304A'
    // other details
  },
  is_broker: false, // optional
  homeloan_required: true // optional
})
```

The description of supported parameters are mentioned below:
| Parameter | Type | Default Value | Required | Description |
| --- | --- | --- | --- | --- |
| name | string | '' | true |name of the lead |
| phone | integer or string | null | true | phone number of lead |
| country_code | string | 'in' | true | Standard ISO3166-1 alpha-2 code for a country. Link: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2 |
| email | string | null | true | email id of lead |
| campaign_id | string | null | true | campaign_id - specific for a project - ask from anarock team |
| channel_name | string | null | true | channel_name - specific for an agency - ask from anarock team |
| api_key | string | null | true | api_key - specific for an agency - ask from anarock team |
| onLeadSuccessCallback | function | null | - | function that will be called on successful submission of lead, arguments are (lead_id, data_submitted) |
| onLeadFailureCallback | function | null | - | function that will be called on failure of lead submission, arguments are (null, data_submitted) |
| onInvalidPhone | function | null | - | called if the phone number passed is invalid for the given country_code in parameters, if phone number is wrong, lead will never be submitted  |
| extra_details | object | null | - | an object with custom key-value pairs. `{ buildingNo: "102", flatNo: "304A", ...}` |

> Note: There are more request body parameters supported by sync/push lead API one can use, please refer here: https://github.com/anarock/leads#query-parameters


#### 2. `requestOTP` - _window.Anarock.requestOTP_ (optional)
call this function to send OTP code to the users' phone number for verification

```js
  let validateResponse = null;

  // on Request/Send OTP button click
  function onRequestOTPButtonClick() {
    window.Anarock.requestOTP({
      api_key: '<API-KEY>', // get your auth key from support team
      env: 'staging',
      host: 'anarock.com',
      channel_name: 'website',
      campaign_id: 'website-internal-test',
      country_code: "in",
      phone: '9999999999', // valid 10-digits phone number entered by the user
      successCallback(resp) {
        console.log("otp sent", resp);
        // store this response to use it later when submitting the lead
        validateResponse = resp
      },
      failureCallback(err) {
        console.log("request otp error", err);
      }
    });
  };

  // this function can be called after clicking on Submit OTP button
  function onSubmitOTPButtonClick() {
    window.Anarock.submitLead({
      validateResponse: validateResponse, // data stored earlier on requestOTP success callback
      otp: 1234, // OTP entered by the user
      country_code: validateResponse.country_code,
      phone: validateResponse.phone,
      current_time: validateResponse.timeStamp,
      hash: validateResponse.hash,
      env: 'staging',
      host: 'anarock.com',
      channel_name: 'website',
      campaign_id: 'website-internal-test',
      name: 'Abc Xyz',
      email: 'abc@test.com',
      purpose: 'buy',
      source_id: 1, // check the proper mapping with leads source dashboard
      sub_source_id: 1, // check the proper mapping with leads subsource dashboard
      source: 'sms',
      sub_source: 'sms-december-campaign',
      onLeadSuccessCallback(leadID, data) {
        console.log('lead captured with ID:', leadID)
      },
      onLeadFailureCallback(errorMessage) {
        console.log(errorMessage)
      }
    })
  };
```

