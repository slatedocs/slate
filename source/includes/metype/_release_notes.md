# Release Notes

## 3 Aug 2018 Release Notes - Metype

1. Sign-in to Metype using your LinkedIn account. This is available on Metype home page, Comment widget sign-in, Feed widget sign-in and also available to publishers using Metype login to manage their user identities.
![Metype LinkedIn Sign In](../../images/Metype_LinkedIn_SSO_SignIn.png "Metype LinkedIn Sign In")
![Metype LinkedIn Sign In Home](../../images/Metype_LinkedIn_Home_SignIn.png "Metype LinkedIn Sign In Home")
![Metype LinkedIn Sign In Feed](../../images/Metype_LinkedIn_Feed_SignIn.png "Metype LinkedIn Sign In Feed")


![Metype LinkedIn Sign In Comment](../../images/Metype_LinkedIn_Comment_SignIn.png "Metype LinkedIn Sign In Comment")



## 27 Jul 2018 Release Notes - Metype

1. The Live Feed is now enhanced to allow users to login and view their notificaions.

![Feed Notifications Logged In](../../images/Notifications_on_Feed_In.png "Feed Notifications Logged in") ![Feed Notifications Logged Out](../../images/Notifications_on_Feed_Out.png "Feed Notifications Logged out")


## 26 Jul 2018 Release Notes - Metype

```shell
<div id='metype-container' class='iframe-container' data-metype-account-id='2' data-metype-host='https://www.metype.com/' data-metype-primary-color='#0000ff' data-metype-bg-color='#ffffff' data-metype-font-color='#4a4a4a'> data-metype-comment-widget-id="comment-widget-2"</div>
<script type='text/javascript'>
  var metypeContainer = document.getElementById("metype-container"),
    page_url = metypeContainer.getAttribute("data-metype-page-url");
  metypeContainer.setAttribute('data-metype-page-url', page_url || window.location.href);
  metypeContainer.setAttribute('data-metype-window-height', window.innerHeight);
  metypeContainer.setAttribute('data-metype-screen-width', window.screen.width);
  talktype(function() {
    talktype.commentWidgetIframe(metypeContainer);
  });
</script>
```
1. Publishers can now embed many conversations on a single page. 


**Note to developers:** The commenting widget allows an additional field `data-metype-comment-widget-id` in the `<div>` tag of the commenting widget, and can have any arbitrary value. E.g.,
`data-metype-comment-widget-id="comment-widget-2"`.


## 4 Jul 2018 Release Notes - Metype

1. Notifications for reactions to comments - commenters will now get notified when other users react on their comments.
![Comment Reactions Notify](../../images/Comment_Reactions_4Jul18.png "Comment Reactions Notification")
2. Story Reactions - Publishers can now use Story Reactions to emote and engage with their audience without having to type in anything. 
![Story Reactions](../../images/Story_Reactions_4Jul18.png "Story Reactions")
Write to us at metype@quintype.com to get your own set of story reactions configured for your account.
3. Bug fixes and loading speed optimisations on the widgets.


