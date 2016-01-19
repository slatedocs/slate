# Widget

> Copy this code and paste it at the end of the `<body>`.

```html
<script type="text/javascript">
  window.mifiel=window.mifiel||[],function(){"use strict";for(var e=["widget"],i=function(e){return function(){window.mifiel.push([e].concat(Array.prototype.slice.call(arguments,0)))}},t=0;t<e.length;t++){var n=e[t];window.mifiel[n]||(window.mifiel[n]=i(n))}if(!document.getElementById("mifiel-js")){var r=document.createElement("script"),o=document.getElementsByTagName("script")[0];r.type="text/javascript",r.id="mifiel-js",r.async=!0,r.src="https://www.mifiel.com/sign-widget-v1.0.0.js",o.parentNode.insertBefore(r,o)}}();
</script>
```

> Then, append the widget to the page with:

```html
<script type="text/javascript">
  window.mifiel.widget({
    widgetId: 'c8aa73d1-db06-4d18-9f56-196b00f6eb69',
    appendTo: 'id-of-the-element-to-append'
  });
</script>
```

You can use the widget to allow your users to sign documents without the need to have an account in [mifiel.com](https://www.mifiel.com)

To begin you have to copy and paste our snippet code (_in the right_) in the page that you want to display the widget in.

You can also find the snippet code in [https://www.mifiel.com/sign-snippet-v1.0.0.min.js](https://www.mifiel.com/sign-snippet-v1.0.0.min.js)

### Options

Field     | Type    | Default |  Description
--------- | ------- | ------- | ------------
widgetId  | String  |         | Widget ID. You can get it with `document.widget_id` in Ruby
appendTo  | String  | body    | ID of the element in the page
width     | String  | 100%    | __Optional__ With of the widget __[px or %]__
height    | String  | 1100    | __Optional__ Height of the widget __[px]__

### Succesful sign event

> Listen the success event:

```html
<script type="text/javascript">
window.addEventListener('message', function (e) {
  console.log(e);
  var data = e.data
      document = data.document,
      signature = data.signature;
  // document.original_hash
  // document.file_signed
}, false);
</script>
```

After the user succesfully signs the document we send a [postMessage](https://developer.mozilla.org/en-US/docs/Web/API/Window/postMessage).
