# Embedded Signing

## Widget

> Copy this code and paste it just before the <b>&lt;/body&gt;</b> tag.

```html
<script type="text/javascript">
  window.mifiel=window.mifiel||[],function(){"use strict";for(var e=["widget"],i=function(e){return function(){window.mifiel.push([e].concat(Array.prototype.slice.call(arguments,0)))}},t=0;t<e.length;t++){var n=e[t];window.mifiel[n]||(window.mifiel[n]=i(n))}if(!document.getElementById("mifiel-js")){var r=document.createElement("script"),o=document.getElementsByTagName("script")[0];r.type="text/javascript",r.id="mifiel-js",r.async=!0,r.src="https://www.mifiel.com/sign-widget-v1.0.0.js",o.parentNode.insertBefore(r,o)}}();
</script>
```

> Then insert the widget in the desired view (page) by including the following snippet:

```html
<script type="text/javascript">
  window.mifiel.widget({
    widgetId: 'c8aa73d1-db06-4d18-9f56-196b00f6eb69',
    appendTo: 'id-of-the-element-to-append',
    successBtnText: 'Proceed to next step'
  });
</script>
```

The widget is an embedded signing tool that we have created to allow your users to sign documents in an iFrame within your page. By embedding this tool, your users can sign seamlessly without having to leave the flow of your website.

_Note: The signers do not have to have an account in [mifiel.com](https://www.mifiel.com)_

To begin, you have to copy and paste our code snippet (_shown to your right_) into the code of the page where the signing flow will take place.

You can also find the code snippet [here](https://www.mifiel.com/sign-snippet-v1.0.0.min.js).

### Options

Field     | Type    | Default |  Description
--------- | ------- | ------- | ------------
widgetId  | String  |         | Widget ID. You can get it with `document.widget_id` in Ruby
appendTo  | String  | body    | ID of the element in the page
successBtnText | String | 'OK' | Text of the button at the end of the signing flow. When the user click
pdf       | Base64  |   null  | __Optional__ PDF in Base64 if you did not send us the PDF when you created the document.
color     | String  | 37BC9B  | __Optional__ Custom color in hexadecimal (e.g. 555555) to personalize the look and feel of your widget. Typically the primary color of your app.
width     | String  | 100%    | __Optional__ Width of the widget __[px or %]__
height    | String  | 1100    | __Optional__ Height of the widget __[px]__

## Events

> Listen for Mifiel events:

```html
<script type="text/javascript">
window.addEventListener('message', function (e) {
  console.log(e);
  // accept messages from known hosts only
  // change to https://stageex.mifiel.com if necessary
  if (e.origin !== 'https://www.mifiel.com') {
    return;
  }
  // We will always send an object
  if (typeof e.data !== 'object') {
    return;
  }
  // document signed succesfully
  if (e.data.eventType === 'mifiel.widget.success') {
    var data = e.data,
        doc = data.document,
        signature = data.signature;
    // doc.original_hash;
    // doc.file_signed;
  }
  // Event errors
  if (e.data.eventType === 'mifiel.widget.error') {
    var error = e.data.error;
    // error.code => 1001
    // error.message => 'Invalid PDF, the pdf param has no data'
  }
}, false);
</script>
```

We will send a [postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage) to your page to notify any of the events listed below.

In order to secure the events sent by the widget you **must** verify that the event is coming from our servers. 

You can identify the events by *e.data.eventType*. The success event will have **"mifiel.widget.success"** and the error events will have **"mifiel.widget.error"**.

### Success event 

We will send the document json object and the signature of the user.

### Error events

Error events have the property *eventType* set as **"mifiel.widget.error"** and a error object *(e.data.error)* with *code* and *message* properties:

#### Widget setup error events

Event               | Code | Message
------------------- | ---- | -------
Empty PDF           | 1001 | Invalid PDF, the pdf param has no data
Hashes do not match | 1002 | Invalid PDF, the provided pdf param is not the same as the uploaded one

_Note: We send this errors only when you did not send us the PDF when the document was created._

#### User error events

Event               | Code | Message
------------------- | ---- | -------
Invalid Certificate | 2001 | Certificate is not valid
Invalid Private Key | 2002 | Invalid Private Key
Invalid Pasword     | 2003 | Invalid password
Files do not match  | 2004 | .key file does not belong to the .cer file

#### Server error events

Event               | Code | Message
------------------- | ---- | -------
Signature failure   | 3002 | Fail to sign document

<!-- Fail to request sigatures | 3001 | Fail to request signatures -->

## Embedded Signing Flow

Following is a more detailed explanation of the steps involved in requesting and executing signatures within the embedded signing widget.

1. The first step is to create a Document in your backend with the _API_ID_ and _APP_SECRET_. You must pass the __PDF file__ that is being signed (or a SHA256 encoded hash of the PDF and the name of the file), along with the following __parameters__: webhook (callback_url) and the email and name (optional) of each signer.

2. Mifiel will return a __Widget ID__ in the response, which you will then need to pass to the widget (running on your website's front-end).

3. The signature process then takes place within your website. The signer will be able to preview the document, select the files of their FIEL, and enter the password of their FIEL to sign (during this process Mifiel will be verifying that the FIEL is valid and not expired). 

4. If successful, the signer will be presented with a page explaining that the signing was successful and that they will receive an email with the signed document. We will also display a confirmation button (e.g. 'Proceed to next step') which will return the user to the flow of your website.

5. Mifiel will then `POST` the document information to the webhook specified by you (in Step 1): electronic signature of the document, timestamp of signature, the signature page, and information regarding the public certificate(s) used to sign the document.
