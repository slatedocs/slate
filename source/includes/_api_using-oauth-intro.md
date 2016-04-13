# Building Public Apps – Overview

## Introduction

Public apps (also known as [Single-Click Apps](https://www.bigcommerce.com/single-click-apps/)) can be listed in the App Store for easy installation in all Bigcommerce stores. They use OAuth to obtain an access token and communicate with the central Bigcommerce API endpoint. Building a public app is the recommended approach in almost all cases. Before you start, we suggest reviewing the [App Store acceptance requirements](/api/approval-requirements). To start making API requests, you'll need a [**Client ID** and **Client Secret**](/api/registration), and an [OAuth token](/api/callback).

## API Endpoint

Public API requests are protected by TLS, and use the following base URI: `**https://api.bigcommerce.com**`. The exact paths are noted in the Reference section for each resource.

## Request Headers

Public API requests are authenticated by the following HTTP headers:

*   `**X-Auth-Client**`: the **Client ID**. To get your **Client ID**, you must complete [App Registration](/api/registration).
*   `**X-Auth-Token**`: the OAuth token. To get your OAuth token, you must complete [App Installation](/api/callback).

In addition, while not all resources require the `**Accept**` and `**Content-Type**` headers, many do. To ensure that your calls succeed, always include these headers.

## Managing Users' Session Timeouts

We recommend that you add Bigcommerce's JavaScript SDK to your Single-Click Apps, to protect your apps' users from getting logged out of the Bigcommerce control panel after a period of idleness. To include our SDK, add this script tag to your Single-Click App:

`**<script src="//cdn.bigcommerce.com/jssdk/bc-sdk.js">**`

Next, initialize the SDK. The basic initialization call is:

`**Bigcommerce.init();**`

Optionally, you can pass a logout callback function within the initialization call:

`**Bigcommerce.init({
      onLogout: callback
});**`

This callback function will run when the user explicitly logs out of the Bigcommerce control panel, or is automatically logged out. The callback will allow your app to respond to this logout.

## Monetizing Your App

If you want to charge merchants for your app, please note that Bigcommerce expects you to handle the billing aspects of the transaction. Your app needs to take care of collecting the fee from the merchant. Under the standard contract, within thirty days of collecting this revenue, you must send Bigcommerce 20% and retain the remaining 80% for yourself. Reporting should be sent monthly to partnerpayments@bigcommerce.com.
