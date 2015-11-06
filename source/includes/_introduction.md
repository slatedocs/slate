# Introduction

Welcome to the Yoyo Wallet platform.

The platform opens up the functionality of Yoyo Wallet to application developers.

The main feaures of the platform are:

- Identity
- Payment
- Loyalty
- Vouchers
- Analytics

## Accessing the platform

There are two different ways you can access the Yoyo Wallet platform.

- via an SDK
- via the RESTful API

Before doing anything with the Yoyo Wallet platform you'll need an account.

## Getting a Yoyo Wallet account

If you're interested in developing an application on the Yoyo Wallet platform, please [contact us](http://yoyowallet.com/contact-us/)

Once you're registered with a Yoyo Wallet account you'll get the following information.

Parameter | Description
--------- | -----------
account_id | This is your unique account identifer
access_key | This is your access key
secret_key | This is your secret key (keep it somewhere safe...)

We'll also create an administrative user so you can login to our [dashboard](https://dashboard.yoyoplayground.net) and manage your account.

## SDKs

We have developed iOS and Android SDKs that make it easy to interact with the most useful endpoints on our platform.  These SDKs are focused on making it easy to build an application on top of the Yoyo Wallet platform.

In fact we're using the SDK ourselves to build the next version of Yoyo Wallet as we speak.

### iOS SDK

Talk you our engineers at the hackathon about getting a copy of the SDK.

### Android SDK

The Android SDK can be downloaded via Gradle

```java
// Put this in your app module's build.gradle
repositories {
    maven { url 'http://maven.justyoyo.net:8081/nexus/content/groups/public/' }
}

dependencies {
    compile 'com.yoyowallet.yoyo:yoyo-sdk-android:0.1.0-SNAPSHOT'
}
```

## RESTful API UI

If you're a web developer you may prefer to code directly against our RESTful API.  To make life easier for you web devs, we've also put a nice browser front end on the API for you to explore.

The sandbox version can be found here: [https://api.yoyoplayground.net/apidocs/](https://api.yoyoplayground.net/apidocs/)

The Yoyo developers like to eat their own dogfood, so the API is also used by our admin dashboards as well as the mobile SDKs.
Therefore there are quite a LOT of endpoints in here.

We'll be documenting the most important ones to get you on your way to developing the next killer application on top of the Yoyo Wallet platform.

### Authentication challenge

When you use the RESTful UI for the first time you will see the authentication challenge dialog box.  This is because you are trying to make an authenticated request to the API.

<img src="images/auth-challenge.png" alt="Authentication challenge" style="width: 400px;"/>

- user name = **$access_key**
- password = **$secret_key**

From now on the browser will take care of adding the appropriate authentication header to your requests.

If you don't have an **$access_key** or **$secret_key** yet, see [getting a Yoyo Wallet account](#getting-a-yoyo-wallet-account)
