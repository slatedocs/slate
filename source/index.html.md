---
title: Instant Access Partner - API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='http://instantaccess.io/partner.php'>Partner Sing Up</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# IA Documentation


# IA Partner Integration

> To integrate IA on your website, add this code snippet to your website:

```javascript
<!-- IA Authentication -->
    <iframe id="ia-framework-login" src="" width="410" height="50" frameBorder="0"></iframe>
    <script type="text/javascript">
      window.onload = function(e){
        var client_id = 'IA_PARTNER_CLIENT_ID_KEY';
        var client_secret = 'IA_PARTNER_CLIENT_SECRET_KEY';

       function successIA(usernameOrEmail) {
          // Handle successLogin in IA
          window.location = 'IACompleteRegisteration.php?iaUser='+usernameOrEmail
        }

       function deniedIA(message) {
          alert(message);
        }

       function timeoutIA(message) {
          alert(message);
        }


       document.getElementById('ia-framework-login').src = 'http://52.26.104.251/api/partner/authorize/view?client_id=‘+client_id+‘&client_secret=‘+client_secret;
        //listen to ia back
        window.addEventListener('message',function(event) {
          if(event.origin !== 'http://52.26.104.251') return;
          if(event.data.action === 'alert')
            alert(event.data.message);
          else if(event.data.action === 'auth') {
            switch (event.data.status) {
              case 'success':
                successIA(event.data.usernameOrEmail);
                break;
              case 'denied':
                deniedIA(event.data.message);
                break;
              case 'timeout':
                timeoutIA(event.data.message);
                break;
            }
          }
        },false);
      }
    </script>
    <!-- End of login with IA -->
```


IA uses client id and client secret keys to allow using of IA service.
You can register a new Partner keys at our [partner portal](http://example.com/developers).

In order to complete the IA integration, you need to add the `code snippet` in your own website in the place you want to use IA in.

<aside class="notice">
You must replace <code>IA_PARTNER_CLIENT_ID_KEY</code> with your IA partner client id key.
</aside>

<aside class="notice">
You must replace <code>IA_PARTNER_CLIENT_SECRET_KEY</code> with your IA partner client secret key.
</aside>
