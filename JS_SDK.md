There are 2 types of JS SDKs available for integration. 

1. Form DSK

```html

<!DOCTYPE html>
  <html lang="en-us">
  <head>
  <script type="text/javascript" src="https://ea-assests.anarock.com/form.js"></script></head>
<body>
  <div id="anarock-form"></div>
  <script>
    var form_container = document.getElementById('anarock-form')
    window.createForm(form_container, API_KEY, CHANNEL_NAME, CAMPAIGN_ID, ENVIRONMENT, options)
  </script>
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
| CAMPAIGN_ID | string | null | true | CAMPAIGN ID given by anarock team |
| ENVIRONMENT | string | 'staging' | true | possible values are `staging` or `production` |
| options | object | null | - | possible keys are `showRemarks` or `remarksTitle`, `show_label`, `show_placeholder`, `contacting_authority` |


In the `options` object 

`showRemarks` is a boolean. Should be passed true if you want a queries section in the form as in the second form at https://marketing.anarock.com/static/test.html

`remarksTitle` is a string, Label that should be showing as title of queries section in the form. 

`show_label` is a boolean to show or hide label in input boxes. Default value is true.

`show_placeholder` is a boolean to show or hide label in input boxes. Default value is false.

`show_placeholder` && `show_label` both cannot be same at the same point of time.

`contacting_authority` this should be the project name to show the name for dnd checkbox

Working example can be seen here. https://marketing.anarock.com/static/test.html


You can modify css as you wish.

below is the html structure of the form

```html
<div id="anarock-form-1" style="width: 320px;">
  <div class="ap-lead-form">
    <div class="am-input-container">
      <div class="am-input-label">Name*</div>
      <input class="am-input" maxlength="100">
    </div>
    <div class="am-input-container">
      <div class="am-input-label">Email*</div>
      <input class="am-input" maxlength="100">
    </div>
    <div class="am-input-container phone focussed">
      <div class="am-input-label">Phone*</div>
        <select>
          <option value="in">India - +91</option>
        </select>
          <input class="am-input" maxlength="20">
      </div>
    <div class="am-input-container text   textarea ">
      <div class="am-input-label">Add your query</div>
      <textarea rows="3" class="am-input" maxlength="400"></textarea>
    </div>
    <div class="ap-agree-box">
      <input type="checkbox" value="agree" id="ap-agree">
      <label for="ap-agree">I agree and authorize team to contact me. This will override the registry with DNC / NDNC</label>
    </div>
    <div class="am-button primary " type="submit" value="Submit">Submit</div>
    </div>
  </div>
</div>
```



