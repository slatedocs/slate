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
| requireOTP | boolean | false | - | possible values are `true` or `false` |
| options | object | null | - | possible keys are `showRemarks` or `remarksTitle`, `show_label`, `show_placeholder`, `contacting_authority`, `show_thankyou`, `dnc_checked`, `projects`, `skipMandatoryEmail` , `selectedProject`,  `default_country`, `host`|


In the `options` object 

`showRemarks` is a boolean. Should be passed `true` if you want a queries section in the form as in the second form at https://marketing.anarock.com/static/test.html

`remarksTitle` is a string, Label that should be showing as title of queries section in the form. 

`show_label` is a boolean to show or hide label in input boxes. Default value is `true`.

`show_placeholder` is a boolean to show or hide label in input boxes. Default value is `false`.

`show_placeholder` && `show_label` both cannot be same at the same point of time.

`contacting_authority` this should be the project name to show the name for dnd checkbox

`show_thankyou` is a boolean to check if after success thank you screen to be shown or not. default value is `true`

`dnc_checked` is a boolean to autocheck the DNC checkbox. default value is `false`

`host` is a string of your own domain if anarock system is deployed at your end locally. 

 `projects` is an array of Objects of the following signature `[{name: '', campaign_id: ''}]` pass this to show project dropdown in the form.
 
 `selectedProject` is an object of following signature `{name: '', campaign_id: ''}` pass this to select one project by default
 
` default_country` is a string, that will define the default country selected in the dropdown.
List of all countries is given here https://s3.console.aws.amazon.com/s3/object/anarock.misc/countryCode.js. Use the url_name to pass. 
e.g if you want the default selected country to be U.A.E. then pass `{default_country: ae}` as options
 
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
      env: ENVIRONMENT,
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
      env: ENVIRONMENT,
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
      env: ENVIRONMENT,
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
      env: ENVIRONMENT,
      options:  { 
        projects: [{name: 'Project1', campaign_id: 'project-1'}, {name: 'Project2', campaign_id: 'project-2'}],
        selectedProject: {name: 'Project1', campaign_id: 'project-1'}
      }
    }]
 </script>
```

### Change Projects DropDown Options and Selected Project in Dropdown dynamically

To cater to use cases where you might have to change selected project based on utm parameters, two objects are exposed

`window.createdAnarockForms` this is an Object with keys as `id` of the containers. If id is not present `class_` index of the form in the anarockForms array is used as key e.g. `class_0` , `class_1`

`window.createdAnarockForms` contains key `form` against each entry and methods `setProjects` or `setSelectedProject`
 can be used.
 
 if below is your code
 
 ```html
<script>
    var form_container = document.getElementById('anarock-form') // 'anarock-from' is the `id` of the form
    window.anarockForms = [{
      container: form_container,
      key: "API_KEY",
      channel_name: "CHANNEL_NAME",
      campaign_id: "CAMPAIGN_ID",
      env: ENVIRONMENT,
      options:  { 
        projects: [{name: 'Project1', campaign_id: 'project-1'}, {name: 'Project2', campaign_id: 'project-2'}],
        selectedProject: {name: 'Project1', campaign_id: 'project-1'}
      }
    }]
 </script>
```

and now you want to change the selected project. You can do as below

```js
window.createdAnarockForms['anarock-form'].form.setSelectedProject({name: 'Project2', campaign_id: 'project-2'})
```
the campaign_id in the selectedProjet object will superceed the default campaign_id for submission of lead.

of you can change the options in this form as 

```js
window.createdAnarockForms['anarock-form'].form.setProjects([{name: 'Project3', campaign_id: 'project-3'}, {name: 'Project4', campaign_id: 'project-4'}])
```

This way you can control what is default selected value show in project selection in form and also you can control that using the above methods

If you want to remove the projects dropdown just call 
```js
window.createdAnarockForms['anarock-form'].form.setProjects(null)
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

