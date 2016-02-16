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
color     | String  | 37BC9B  | __Optional__ Custom color in hexadecimal (e.g. 555555) to personalize the look and feel of your widget. Typically the primary color of your app.
width     | String  | 100%    | __Optional__ Width of the widget __[px or %]__
height    | String  | 1100    | __Optional__ Height of the widget __[px]__

### Event: Document signed successfully

> Listen for the Success event:

```html
<script type="text/javascript">
window.addEventListener('message', function (e) {
  console.log(e);
  if (e.isTrusted && e.origin === 'https://www.mifiel.com'){
    var data = e.data,
        document = data.document,
        signature = data.signature;
    // document.original_hash;
    // document.file_signed;
  }
}, false);
</script>
```

After the user succesfully signs the document we will send back a [postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage).

## Embedded Signing Flow

Following is a more detailed explanation of the steps involved in requesting and executing signatures within the embedded signing widget.

1. The first step is to create a Document in your backend with the _API_ID_ and _APP_SECRET_. You must pass the __PDF file__ that is being signed (or a SHA256 encoded hash of the PDF), along with the following __parameters__: webhook (callback_url) and the email and name (optional) of each signer.

2. Mifiel will return a __Widget ID__ in the response, which you will then need to pass to the widget (running on your website's front-end).

3. The signature process then takes place within your website. The signer will be able to preview the document, select the files of their FIEL, and enter the password of their FIEL to sign (during this process Mifiel will be verifying that the FIEL is valid and not expired). 

4. If successful, the signer will be presented with a page explaining that the signing was successful and that they will receive an email with the signed document. We will also display a confirmation button (e.g. 'Proceed to next step') which will return the user to the flow of your website.

5. Mifiel will then `POST` the document information to the webhook specified by you (in Step 1): electronic signature of the document, timestamp of signature, the signature page, and information regarding the public certificate(s) used to sign the document.
