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
      env: "production",
      options: {} // options as described below
    },
    {
      container: form_container1,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
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
| requireOTP | boolean | false | - | possible values are `true` or `false` |
| enableCaptcha | boolean | false | - | possible values are `true` or `false` |
| captchaKey | string | false | - | Need to be generated from this link https://www.google.com/recaptcha/admin/create |
| options | object | null | - | possible keys are `showRemarks` or `remarksTitle`,`remarksMandatory`, `show_label`, `show_placeholder`, `contacting_authority`, `show_thankyou`, `dnc_checked`, `projects`, `skipMandatoryEmail` , `selectedProject`,  `default_country`, `host`, `apartment_type_options`, `city_options`, `dnc_agree_text`, `custom_tnc`, `custom_tnc_text`,`source`, `sub_source`, `placement`, `form_name`|


In the `options` object 

`showRemarks` is a boolean. Should be passed `true` if you want a queries section in the form as in the second form at https://marketing.anarock.com/static/test.html

`remarksTitle` is a string, Label that should be showing as title of queries section in the form. 

`remarksMandatory` is a boolean with default value `false`, setting it `true` will make remark mandatory IF `showRemarks` is also `true`.

`show_label` is a boolean to show or hide label in input boxes. Default value is `true`.

`show_placeholder` is a boolean to show or hide label in input boxes. Default value is `false`.

`show_placeholder` && `show_label` both cannot be same at the same point of time.

`contacting_authority` this should be the project name to show the name for dnd checkbox

`show_thankyou` is a boolean to check if after success thank you screen to be shown or not. default value is `true`

`dnc_checked` is a boolean to autocheck the DNC checkbox. default value is `false`

`dnc_agree_text` text that can be shown instead of default DNC message

`host` is a string of your own domain if anarock system is deployed at your end locally. 

`form_name` one can set a form name which will be added to lead's extra details, if not set value will be `default`

 `projects` is an array of Objects of the following signature `[{name: '', campaign_id: ''}]` pass this to show project dropdown in the form.
 
 `selectedProject` is an object of following signature `{name: '', campaign_id: ''}` pass this to select one project by default
 
` default_country` is a string, that will define the default country selected in the dropdown.
List of all countries is given here https://s3.console.aws.amazon.com/s3/object/anarock.misc/countryCode.js. Use the url_name to pass. 
e.g if you want the default selected country to be U.A.E. then pass `{default_country: ae}` as options

`custom_tnc` is a boolean, that can be used to use your own text around terms and condition to be displayed before the submit button

`custom_tnc_text` is a string can be an string of html elements like `<div><a href="https://google.com">Google</a></div>` this can be used to put your own tncs with links.

`source`, `sub_source`, `placement` -- if you want to override the parameters and not pick from utm parameters

`apartment_type_options` is a object with follow signature 

```json
  {
    "show": true,
    "multi_select": true,
    "options": [{ "id": 1, "name": "1 RK", "custom_name": "Studio Big" }, { "id": 2, "name": "1 BHK" }],
    "title": "Select Interested BHK types",
    "mandatory": true,
    "error": "Select interested BHK type to proceed"
  }
```

Options for are possible values can be taken from this

```json
  [
    { "id": 1, "name": "1 RK" },
    { "id": 2, "name": "1 BHK" },
    { "id": 3, "name": "2 BHK" },
    { "id": 4, "name": "3 BHK" },
    { "id": 5, "name": "3+ BHK" },
    { "id": 6, "name": "2.5 BHK" },
    { "id": 8, "name": "3.5 BHK" },
    { "id": 9, "name": "4 BHK" },
    { "id": 10, "name": "5 BHK" },
    { "id": 11, "name": "Studio" },
    { "id": 12, "name": "Duplex" },
    { "id": 13, "name": "Penthouse" },
    { "id": 7, "name": "1.5 BHK" }
  ]
```

`city_options` is a object with follow signature 

```json
  {
    "show": true,
    "title": "City of residence",
    "mandatory": false,
    "error": "City of residence is mandatory to proceed"
  }
```

Exmaple with both of these options active would look like 

```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options:  {
        dnc_checked: true,
        skipMandatoryEmail:true,
        apartment_type_options: {
          show: true,
          multi_select: true,
          options: [{ id: 1, name: "1 RK" }, { id: 2, name: "1 BHK" }],
          title: "Select Interested BHK types",
          mandatory: true,
          error: "Select interested BHK type to proceed"
        },
        city_options: {
          show: true,
          title: "City of residence",
          mandatory: false,
          error: "City of residence is mandatory to proceed"
        }
      } // options as described below
    }]
 </script>
```
 
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

`window.onOTPSubmit` is triggered with data as shown below when OTP is requested while form submition. 

```json
  {
      "campaign_id": "string",
      "channel": "string",
      "country_code": "string",
      "phone": "string",
      "hash": "string",
      "current_time": "string"
  }
```

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
      env: "production",
      options:  { dnc_checked: true, skipMandatoryEmail:true } // options as described below
    }]
 </script>
```

### Custom host 

By default request are made to anarock database only. in case you have anarock setup deployed locally then you can change your host by passing it in the options as 

```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options:  { host: 'yourdomain.com' } // options as described below
    }]
 </script>
```

### Submitting Leads with OTP only support

By default leads are submitted without OTP via the form, to enable OTP on particular campaign form, you need to pass the parameter `requireOTP` as true while defining the form. 

Once this option is set to true, you need to make sure that all campaign ids are marked as OTP verified campaigns only. Confirm this with your IT team or Anarock Team before making this live. 

```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      requireOTP: true,
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options:  { host: 'yourdomain.com' } // options as described below
    }]
 </script>
```





### Adding Projects Dropdown

You can pass `projects` as `[{name: '', campaign_id: ''}]` in the options to show the project selection dropdown

```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options:  { 
        projects: [{name: 'Project1', campaign_id: 'project-1'}, {name: 'Project2', campaign_id: 'project-2'}, {name: 'Project3', campaign_id: 'project-3'}, {name: 'Project4', campaign_id: 'project-4'}]
      }
    }]
 </script>
```

### Selecting one project by default

When you have passed `projects` in options, you may also pass `selectedProject` in options to set one project selected by defaiult

```html
<script>
    var form_container = document.getElementById('anarock-form')
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options:  { 
        projects: [{name: 'Project1', campaign_id: 'project-1'}, {name: 'Project2', campaign_id: 'project-2'}],
        selectedProject: {name: 'Project1', campaign_id: 'project-1'}
      }
    }]
 </script>
```

### Change Projects DropDown Options and Selected Project in Dropdown dynamically

To cater to use cases where you might have to change selected project or list of projects. 
 if below is your code
 
 ```html
<script>
    var form_container = document.getElementById('anarock-form') // 'anarock-from' is the `id` of the form
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: "production",
      options:  { 
        projects: [{name: 'Project1', campaign_id: 'project-1'}, {name: 'Project2', campaign_id: 'project-2'}],
        selectedProject: {name: 'Project1', campaign_id: 'project-1'}
      }
    }]
 </script>
```

and now you want to change the selected project. You can modify the value in `window.anarockForms` and call `window.initAnarockForms()`. You can use this method to refresh any property.

e.g. 
```
  window.anarockForms[0].options.selectedProject = {
    name: "Project2",
    campaign_id: "project-2"
  };
  window.initAnarockForms()
```

### Thank you page redirection

`show_thankyou` flag in options can be used to show a thank you message in place of form.

also, to do redirections to your own thankyou page. You can use the 

```js
window.onLeadSuccess = function(leadId, data_submitted_in_anarock_database) { window.location.href = '/thankyou'; }
window.onLeadFailure = function(leadId, data_submitted_in_anarock_database) { window.location.href = '/thankyou'; }

// to pass data to your thankyou page

// Thank you page GET request redirection
window.onLeadSuccess = function(leadId, data_submitted_in_anarock_database) { 
  var name = data_submitted_in_anarock_database.name
  var phone = data_submitted_in_anarock_database.phone
  var email = data_submitted_in_anarock_database.email
  var country_code = data_submitted_in_anarock_database.country_code
  window.location.href = '/thankyou?'+'name='+name+'&'+'phone='+phone+'&'+'email='+email+'&'+'country_code='+country_code+'&'+'leadId='+leadId
}
window.onLeadFailure = function(leadId, data_submitted_in_anarock_database) { 
  var name = data_submitted_in_anarock_database.name
  var phone = data_submitted_in_anarock_database.phone
  var email = data_submitted_in_anarock_database.email
  var country_code = data_submitted_in_anarock_database.country_code
  window.location.href = '/thankyou?'+'name='+name+'&'+'phone='+phone+'&'+'email='+email+'&'+'country_code='+country_code
}

// Thank you page POST request redirection
window.onLeadSuccess = function(leadId, data_submitted_in_anarock_database) {
  var request = new XMLHttpRequest();
  request.open('post', '/thankyou.php', true);
  request.setRequestHeader("Content-type", "application/json");
  request.onload = function(){}
  request.onerror = function(){}
  request.send(JSON.stringify(data_submitted_in_anarock_database));
}

// Thank you page POST request redirection
window.onLeadFailure = function(leadId, data_submitted_in_anarock_database) {
  var request = new XMLHttpRequest();
  request.open('post', '/thankyou.php', true);
  request.setRequestHeader("Content-type", "application/json");
  request.onload = function(){}
  request.onerror = function(){}
  request.send(JSON.stringify(data_submitted_in_anarock_database));
}
```

### Saving Lead to Your Own Database

To save the data submitted to anarock to your database, you need to define the `window.onLeadSuccess` function. This function is called with 2 parameters `leadID`, `data_submitted_in_anarock_database` (signature is defined above). 

You can use the function as below

```js
window.onLeadSuccess = function (leadId, data_submitted_in_anarock_database) {
     // Make the API request to your server with leadId and data stored.
  var request = new XMLHttpRequest();
  request.open('post', '/server_url', true);
  request.setRequestHeader("Content-type", "application/json");
  request.onload = function(){}
  request.onerror = function(){}
  request.send(JSON.stringify(data_submitted_in_anarock_database));
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

