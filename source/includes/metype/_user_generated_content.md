# User Generated Content (UGC)

Metype provides a form called user generated content to enable users to submit their opinions and views.

## Terminology - UGC
* `Page`: It is the web page where you want to insert your UGC widget. This acts as a unique identifier for the UGC widget.
* `User`: A person who can login and use the UGC widget.
* `Author`: A person who is logged in and has submitted his/her views.
* `User Generated Content (UGC)`: A piece of content submitted by a user or an individual.
This person is not known by the property owner. This can be biased or unbiased about any topic.

## Installation - UGC
```javascript
<!-- Initialization Script -->
<script type='text/javascript'>
  window.talktype = window.talktype || function(f) {
    if (talktype.loaded)
      f();
    else
      (talktype.q = talktype.q || []).push(arguments);
  };
</script>
<!-- Javascript to render the widgets -->
<script src='https://www.metype.com/quintype-metype/assets/metype.js'></script> -->
```
```javascript
<div id='contribution-container'
    data-metype-account-id='XXXXX' <!-- Add your account ID here -->
    data-metype-host='https://www.metype.com/'>
</div>
<script type='text/javascript'>
  // This code is used to render the UGC iframe.
  talktype(function() {
    talktype.contributionWidgetIframe(document.getElementById('contribution-container'));
  });
</script>
```
### Prerequisites
* Sign up for an account at [www.metype.com](https://www.metype.com).
* You will find all your accounts at [www.metype.com/admin](https://www.metype.com/admin) if you are signed in.
* You can find account specific information in the `Embed Metype` Tab.
* Please whitelist your website url in `Allow Multiple Domains` under `Settings` Tab of the admin panel if you are embedding the widget on a website other than the website url provided during account creation. If this is not done you will get an error called `This domain is not whitelisted` on the browser console when you are trying to embed the script. Visually you ll see the `Metype` logo appearing and the widget not rendering on the browser.

### Javascript

* Setup the initialization script in the `<head>` section in case of a website.
If you have already done this to integrate other widgets please ignore this step.
Please find the script in the shell on the right in the shell.


* Setup the embed code for the UGC widget at the position you need to embed.
Please find the script with detailed comments on the right in the shell.
