### JS SDK 

initialize in body as below

```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options: {} // options as described below
    }]
 </script>
<script type="text/javascript" src="https://s3.ap-south-1.amazonaws.com/anarock.misc/form.js" async defer></script></head>
```

e.g.

```html

<!DOCTYPE html>
  <html lang="en-us">
  <head>
  </head>
<body>
  <div id="anarock-form"></div>
  <div id="anarock-form1"></div>
  <script>
    var form_container = document.getElementById('anarock-form')
    var form_container1 = document.getElementById('anarock-form1')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "ENVIRONMENT",
      options: {} // options as described below
    },
    {
      container: form_container1,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "ENVIRONMENT",
      options: {} // options as described below
    }]
  </script>
  <script type="text/javascript" src="https://s3.ap-south-1.amazonaws.com/anarock.misc/form.js" async defer></script>
  </body>
</html>
```

Including this SDK exposes `window.createForm` function which takes in below parameters

| Parameter | Type | Default Value | Required | Description |
| --- | --- | --- | --- | --- |
| form_container | html_element - document.getElementById | null | true | html_element where the form should be placed |
| API_KEY | string | null | true | API Key given by anarock team |
| CHANNEL_NAME | string | null | true | CHANNEL NAME given by anarock team |
| CAMPAIGN_ID | string | null | true | CAMPAIGN ID given by anarock team |
| ENVIRONMENT | string | 'staging' | true | possible values are `staging` or `production` |
| options | object | null | - | possible keys are `showRemarks` or `remarksTitle`, `show_label`, `show_placeholder`, `contacting_authority`, `show_thankyou`, `dnc_checked` |


In the `options` object 

`showRemarks` is a boolean. Should be passed `true` if you want a queries section in the form as in the second form at https://marketing.anarock.com/static/test.html

`remarksTitle` is a string, Label that should be showing as title of queries section in the form. 

`show_label` is a boolean to show or hide label in input boxes. Default value is `true`.

`show_placeholder` is a boolean to show or hide label in input boxes. Default value is `false`.

`show_placeholder` && `show_label` both cannot be same at the same point of time.

`contacting_authority` this should be the project name to show the name for dnd checkbox

`show_thankyou` is a boolean to check if after success thank you screen to be shown or not. default value is `true`

`dnc_checked` is a boolean to autocheck the DNC checkbox. default value is `false`

Working example can be seen here. https://marketing.anarock.com/static/test.html

`window.onLeadSuccess` && `window.onLeadFailure` are the two functions that are called on submission of lead. These are called with 2 arguments  `lead_id` && `data_submitted_in_anarock_database`


`data_submitted_in_anarock_database` will have a signature as defined below

```json
  {
      "name": "string",
      "phone": "string",
      "email": "string",
      "country_code": "country_code || 'in'",
      "campaign_id": "string",
      "source": "string",
      "sub_source": "string",
      "placement": "string",
      "remarks": "string",
      "extra_details": "JSON object"
  }
```

e.g. `window.onLeadSuccess(78642, {name: 'Test' .....})` or `window.onLeadFailure(null, {name: 'Test' .....})`

### Enable DNC checkbox by default

You can pass `dnc_checked` as `true` in the options to set the checkbox by default as selected.


```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: ENVIRONMENT,
      options:  { dnc_checked: true } // options as described below
    }]
 </script>
```


### Thank you page redirection

`show_thankyou` flag in options can be used to show a thank you message in place of form.

also, to do redirections to your own thankyou page. You can use the 

```js
window.onLeadSuccess = function(leadId, data_submitted_in_anarock_database) { window.location.href = '/thankyou'; }
window.onLeadFailure = function(null, data_submitted_in_anarock_database) { window.location.href = '/thankyou'; }
```

### Saving Lead to Your Own Database

To save the data submitted to anarock to your database, you need to define the `window.onLeadSuccess` function. This function is called with 2 parameters `leadID`, `data_submitted_in_anarock_database` (signature is defined above). 

You can use the function as below

```js
window.onLeadSuccess = function (leadId, data_submitted_in_anarock_database) {
     // Make the API request to your server with leadId and data stored.
}
```

### You can modify css as you wish.

below are the classes used. You can override them in your code.

```html

  .ap-lead-form
  .am-input-container
  .am-input-label
  .am-input
  .ap-agree-box
  .am-button primary
```

