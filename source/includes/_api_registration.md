# API Registration

## Introduction

Once you have a [sandbox store](/api/using-oauth-intro), you must register your app to get your **Client ID** and **Client Secret**.

*   The **Client ID** value uniquely identifies your app and you will need to pass it in the header of all your requests to the Stores API.

*   The **Client Secret** value is a secret that your app and Bigcommerce share. You do need to pass the **Client Secret** value once during the [app installation](/api/callbacks) sequence. Thereafter, Bigcommerce uses it to sign payloads in [load, uninstall, and remove user requests](/api/load) and your app uses it to verify the signature to ensure that the request is coming from Bigcommerce.

The app registration wizard requests a number of details that you may not know just yet. You can come back and fill in the additional information later (discussed in [App Submission](/api/completing-reg)).

## Technical Requirements

### Auth Callback and Load Callback URIs

You must have a [Auth Callback URI](/api/callback) and a [Load Callback URI](/api/load#load) to register your app.


> PRO TIP: Because the **Auth Callback URI** and **Load Callback URI** requests originate from the browser and not Bigcommerce, you can use non-publicly-available URIs and a self-signed certificate for a quick start. However, you must switch to and test your app with a publicly available **Auth Callback URI** and **Load Callback URI** before submitting your app for consideration in the App Store.

### Uninstall callback (optional)

If you want to receive a callback when the store owner uninstalls your app, you can provide a [Uninstall Callback URI](/api/load#uninstall).

### Multi-user support (optional)

By default, your app will only be accessible to the store owner (ie. the user who created the store). Optionally, you can allow your app to be accessible to other store users. Consider the following before enabling [multi-user support](/api/multi-user).

*   Once you enable multi-user support, a store admin will additionally need to grant access to users from within the store control panel. For each user account, there are settings to grant access to specific apps.
*   Your app should be aware that when it receives the [Load Callback](/api/load#load), the user information passed in, [may not be the store owner](/api/multi-user#loadrequest). You'll need to determine how to respond if you see a different user. For example, you may want to provision a new user account in order to personalize the experience.
*   You can optionally specify a [Remove User Callback URI](/api/load#remove-user) to receive a callback when a store admin revokes a user's access.

### OAuth scopes

If you know the [OAuth scopes](/api/scopes) that your app requires, you should select these. If you do not know the scopes that you need yet, you can just request the maximum permissions to get going quickly. However, once you determine the scopes you need, you must:

*   Modify the scopes of your app in My Apps and save the changes.
*   Uninstall your draft app from the Control Panel of your sandbox store.
*   Reinstall your draft app in the Control Panel of your sandbox store.
*   Obtain the new OAuth token during the [App Installation](/api/callback) flow.
*   Retest your app to make sure it still functions properly with the new token.

## Registering your app

The following procedure takes you through the minimum number of steps to successfully register your app and get your **Client Secret** and **Client ID**.

1.  Click **Log In** in the top right of the developer portal.
2.  Within the login page, provide your sandbox store credentials.

> PRO TIP: These credentials must be the credentials of the owner of the store where you plan to install your draft app.

3.  Click **My Apps**.
4.  Click **Create an app**.
5.  Type a name for your app in the **Create an App** dialog.
6.  Click **Next**.
7.  Click **Next** again.
8.  Click **Next** one more time.
9.  Type your **Auth Callback URI** in the **Auth Callback URL** box.
10.  Type your **Load Callback URI** in the **Load Callback URL** box.
11.  If you have an **Uninstall Callback URI**, provide this in the **Uninstall Callback URI** box.
12.  If you want to support multiple users, select **Multiple Users** in the **Supported Features** area and provide a **Remove User Callback URI** in the **Remove User Callback URI** box.
13.  Select the OAuth scopes that your app requires. If you do not yet know, select the maximum scopes.
14.  Click **Update & Close**.
15.  Back in **My Apps** hover over your app.
16.  Click **View Client ID**.
17.  Copy the **Client ID** and **Client Secret** values from the dialog and paste them into a safe and secure place.
