## Introduction

OAuth apps benefit from a high level of integration with the BigCommerce platform. Users interacting with your app will enjoy a seamless experience. BigCommerce achieves this by rendering your app's user interface inside of an iframe within the control panel. To ensure acceptance into the App Store, your app should be able to perform all of its functions inside of the iframe.

While very usable and friendly, the iframe approach does require special attention from app developers. The remainder of this page discusses several functional areas to consider when designing and developing your app.

*   [Mixed content](#mixed)
*   [Same-origin policies](#xss)
*   [P3P and cookies](#p3p)

## About mixed content

The BigCommerce control panel is served over TLS/SSL. Your app must be hosted on a web server that accepts and sends TLS/SSL requests. In addition, all of the resources referenced in the HTML that you present to the end users must be served over TLS/SSL. You may find protocol-agnostic addressing helpful.

If the user interface retrieves images, scripts, or other assets over a connection not encrypted with TLS/SSL, the user will experience errors and possibly an inability to interact with your app. Before submitting your app, use an [online crawler](https://www.jitbit.com/sslcheck/) to check for insecure content.

## About same-origin policies

[Same-origin policies](http://en.wikipedia.org/wiki/Same-origin_policy) restrict apps running within iframes from performing certain activities, such as interacting with other services and making OAuth connections. While apps that operate within the BigCommerce iframe get strong preference during App Store considerations, we sometimes make exceptions for apps that need to interact and authenticate to other services. If your app requires this, we advise you to open a new tab for actions that cannot occur within the iframe.

## About P3P and cookies

Internet Explorer is one of the browsers that BigCommerce [supports](/api/browsers) and our merchants do use it to access the control panel. If your app needs to set a cookie, you will need to craft a [P3P policy](http://en.wikipedia.org/wiki/P3P). Otherwise, your app will experience issues on Internet Explorer. Please review the following pages for more information.

*   [Craft a P3P policy to make IE behave](http://www.techrepublic.com/blog/software-engineer/craft-a-p3p-policy-to-make-ie-behave/)
*   [MSDN Intro to P3P Cookie Blocking](http://blogs.msdn.com/b/ieinternals/archive/2013/09/17/simple-introduction-to-p3p-cookie-blocking-frame.aspx)
