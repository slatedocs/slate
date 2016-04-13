# Apps Overview – Getting Started 

## Build best-of-breed solutions for fast-growing online businesses

The Bigcommerce Stores API features a RESTful architecture, allowing you to code in the language of your choice. All connections require authentication and are secured by TLS encryption. It supports [the JSON media type][11] and uses UTF-8 character encoding.

With clever use of this API, you can automate various commerce, business, and publishing tasks and integrate all kinds of apps with our platform.

## Let's get started!

### 1\. Join the Technology Partner Program

Before you begin, you'll need a sandbox store. Bigcommerce offers app developers free sandbox stores through its Technology Partner Program. To get your sandbox store, [apply to become a Bigcommerce Technology Partner][47]. To be approved as a partner, you will need:

* A website
* The ability to support users of your app
* A PayPal account: if you want to get paid for referring people to Bigcommerce (optional)

NOTE: The email address you use in this form must be the same as the email address that you use to log into your sandbox store and the same as the email address you use to log into [My Apps][48].

Once approved, you will receive one or more emails containing:

* **Your Partner ID**: required to submit an app for [App Store][49] consideration
* **Temporary Partner Portal credentials**: change your password immediately after logging in

NOTE: If you do not receive your Partner ID by email, contact [appstore@bigcommerce.com][50].

### 2\. Get a Sandbox Store

To get into your sandbox store, log into the Partner Portal, then click **Create a Trial Store**. When you log into your store, use the same email that you used when applying to become a Technology Partner.

NOTE: Although the name of the **Create a Trial Store** option indicates that the store may be temporary, it is not.

###   3\. Get your keys

#### Public apps

Public apps (also known as [Single-Click Apps][51]) can be listed in the App Store for easy installation in all Bigcommerce stores. They use OAuth to obtain an access token and communicate with the central Bigcommerce API endpoint. Building a public app is the recommended approach in almost all cases. Before you start, we suggest reviewing the [App Store acceptance requirements][23]. To start making API requests, you'll need a [**Client ID** and **Client Secret**][15], and an [OAuth token][16].

#### Private apps

Private apps require the manual creation of an API token for each store, and are most useful for custom integrations for a single Bigcommerce store. They use HTTP Basic Authentication, and communicate directly with the store's API endpoints. From the Control Panel of your sandbox store, you can [get the base path, user ID, and API token][27] that you need to start making calls.

  

## Client libraries

To make it easier for our developers, we provide [client libraries][13] in a variety of popular languages.