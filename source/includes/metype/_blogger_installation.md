# Install Metype on Blogger

## Metype Comments on Blogger


```shell
<!-- Script for Blogger -->
<script type='text/javascript'>
  window.talktype = window.talktype || function(f) {
    if (talktype.loaded)
      f();
    else
      (talktype.q = talktype.q || []).push(arguments);
  };
</script>

<!-- Commenting Widget embed code. Html Element with the necessary attributes.
The color and font are configurable according to your liking -->
<div id='metype-container'
     class='iframe-container'
     data-metype-account-id='XXXXX'
     data-metype-host='https://www.metype.com/'
     data-metype-primary-color='#0987d5'
     data-metype-bg-color='#ffffff'
     data-metype-font-color='#4a4a4a'>
</div>

<script type='text/javascript'>
  var metypeContainer = document.getElementById("metype-container"),
    page_url = metypeContainer.getAttribute("data-metype-page-url");

  //You can change the page url incase of infinite scroll to render different widgets.
  metypeContainer.setAttribute('data-metype-page-url', page_url || window.location.href);

  // The rest of the commands are for metype to render the widget as an iframe
  metypeContainer.setAttribute('data-metype-window-height', window.innerHeight);
  metypeContainer.setAttribute('data-metype-screen-width', window.screen.width);
  talktype(function() {
    talktype.commentWidgetIframe(metypeContainer);
  });
</script>

<!-- Script that loads the metype library. This can be moved to the head -->
<script src='https://www.metype.com/quintype-metype/assets/metype.js'></script>
```
Follow the steps below to install the Metype Comments widget on your Blogger website.

1. Navigate to `Settings -> Posts, comments and sharing -> Comments`.
2. Choose the `Hide` option in the `Comment Location` dropdown.
3. Click on `Layout` on the left handside.
4. Click on `Add a Gadget` in the layout.
5. Click on `HTML/Javascript`.
6. Check the `Show HTML/Javascript` checkbox.
7. Type `Metype Comments` in the `title` field.
8. Add the script for Blogger specified in the shell on the right in this section in the `content` field. Dont forget to add your `account id` and other UI customizations in the script.
9. Click on `Save` at the end of the page.
10. Now the `Metype Comments` gadget is available in your layout. You can move it as per your requirements in your posts layout.


## Metype Feed on Blogger


```shell
<!-- Script for Blogger -->
<script type='text/javascript'>
  window.talktype = window.talktype || function(f) {
    if (talktype.loaded)
      f();
    else
      (talktype.q = talktype.q || []).push(arguments);
  };
</script>

<!-- Feed Widget embed code. Html Element with the necessary attributes.
The color and font are configurable according to your liking -->
<div id='feed-metype-container'
     class='feed-iframe-container'
     data-metype-account-id='XXXXX'
     data-metype-host='https://www.metype.com/'
     data-metype-publisher='John Doe'
     data-metype-primary-color='#0987d5'
     data-metype-secondary-color='#ffffff'>
  <!-- This is a clickthru button on the right side of the web page. A click of this will open the feed. -->
  <div id='metype-clickthru' class='metype-clickthru' onClick="talktype.toggleButton()"></div>

  <!-- This is to close the feed -->
  <div class="metype-feed-slide-icon" id="metype-feed-slide-icon" onclick="talktype.slideButton()"></div>
</div>

<script type='text/javascript'>
  // This is required to render the iframe.
  talktype(function() {
    talktype.feedWidgetIframe(document.getElementById('feed-metype-container'));
  });
</script>

<!-- Script that loads the metype library. This can be moved to the head and called only once -->
<script src='https://www.metype.com/quintype-metype/assets/metype.js'></script>
```

Follow the steps below to install the Metype Feed widget on your Blogger website.

1. Click on `Layout` on the left handside.
2. Click on `Add a Gadget` in the layout.
3. Click on `HTML/Javascript`.
4. Check the `Show HTML/Javascript` checkbox.
5. Leave the title empty.
6. Add the script for Blogger specified in the shell on the right in the `content` field. Dont forget to add your `account id` and other UI customizations in the script.
7. Click on `Save` at the end of the page.
8. Now the gadget is available in your layout. You can move it as per your requirements. Normally the feed is called only once.
