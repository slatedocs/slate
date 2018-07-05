# Comments

Metype provides a commenting system for your users to engage with your content.

## Terminology - Comments
* `Page`: It is the web page where you want to insert your commenting widget. This acts as a unique identifier for the commenting widget.
* `Comment Realm`: An instance of a commenting widget is a comment realm. There could be multiple comment realms in a page.
* `User`: A person who can login and use the commenting widget.
* `Author`: A person who is logged in and has commented.
* `Moderator`: A person who moderates comments on a property.
* `Admin`: A person who manages the property settings. As of now all moderators are admins.
* `Spam`: A comment can be automatically or manually marked as spam on metype. This would mean that the mdoerator does not want to see the comment appear again on his property.
* `Trash`: A comment can be trashed by a moderator. This means the comment can be visible again on his property.
* `Auto Moderation`: A moderation methodology in which comment can be automatically spammed by metype system.
* `Pre Moderation`: A moderation methodology in which the comment flows into a pending queue.
* `Profanity`: Dirty language used in comments.

## Installation - Comments
### Prerequisites
* Sign up for an account @ www.metype.com.
* You will find all your accounts @ www.metype.com/admin if you are signed in.
* You can find account specific information in the `Embed Metype` Tab.
* Please whitelist your website url in `Allow Multiple Domains` under `Settings` Tab of the admin panel if you are embedding the widget on a website other than the website url provided during account creation. If this is not done you will get an error called `This domain is not whitelisted` on the browser console when you are trying to embed the script. Visually you ll see the `metype` logo appearing and the widget not rendering on the browser.


### Javascript
* Setup the initialization script in the `<head>` section in case of a website.
If you have already done this to integrate other widgets please ignore this step.
Please find the script in the shell on the right in the shell.

```shell
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

* Setup the embed code for the commenting widget at the position you need to embed.
Please find the script with detailed comments on the right in the shell.

```shell
<!-- Commenting Widget embed code. Html Element with the necessary attributes.
The color and font are confiruable according to your liking -->
<div id='metype-container'
     class='iframe-container'
     data-metype-account-id='XXXXX' <!-- Add your account ID here -->
     data-metype-host='https://www.metype.com/'
     data-metype-primary-color='#0987d5' <!-- Majority color of the widget can be customised -->
     data-metype-bg-color='#ffffff' <!-- Background color of the widget can be customised -->
     data-metype-font-color='#4a4a4a'> <!-- Font color of the widget can be customised -->
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
```

### Wordpress
1. Make a note of your Metype Account ID. This is present under the `Embed Metype` Tab in your admin panel.
2. Now visit your WordPress admin page. E.g. yourwebsite.com/wp-admin.
3. Go to `Plugins` and click on `Add new`.
4. Search for `Metype`.
5. You’ll find `Metype` by `Quintype Technologies India Pvt Ltd`.
6. Click on `Install Now`.
7. Click on `Activate`.
8. You will now be able to see Metype on the left hand side of the WordPress admin page.
9. Enter your Metype Account ID, review your settings and save changes.
   Note: The Metype Account ID is the one you had noted down in Step 1, available in metype.com/admin —> Embed Metype.
10. The Metype commenting widget and feed widget will now begin to appear in all of your WordPress pages.

### Blogger
1. Navigate to `Settings -> Posts, comments and sharing -> Comments`.
2. Choose the `Hide` option in the `Comment Location` dropdown.
3. Click on `Layout` on the left handside.
4. Click on `Add a Gadget` in the layout.
5. Click on `HTML/Javascript`.
6. Check the `Show HTML/Javascript` checkbox.
7. Type `Metype Comments` in the `title` field.
8. Add the HTML and Javascript in the shell on the right in the `content` field. Dont forget to add your `account id` and other UI customizations in the script.
```
<script type='text/javascript'>
  window.talktype = window.talktype || function(f) {
    if (talktype.loaded)
      f();
    else
      (talktype.q = talktype.q || []).push(arguments);
  };
</script>

<!-- Commenting Widget embed code. Html Element with the necessary attributes.
The color and font are confiruable according to your liking -->
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
9. Click on `Save` at the end of the page.
10. Now the `Metype Comments` gadget is available in your layout. You can move it as per your requirements in your posts layout.


## Comments Count API

* The total comments count can be fetched for a page or multiple pages using the api call on the shell.
The page ids should be comma seperated and base64 encoded. A maximum of 10 page urls can be passed.

``` shell
GET https://www.metype.com/api/v1/accounts/:account_id/pages?page_ids=base_64_enc_string1,base_64_enc_string2

Response:
[
    {
        "url": "http://www.example.com/1",
        "comments_count": 1
    },
    {
        "url": "http://www.example.com/2",
        "comments_count": 1
    }
]
```
