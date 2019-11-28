---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
- shell
- html
- css


toc_footers:


includes:
- errors

search: true
---
# What is the Web SDK

Web KYC is an online tool that enables you to verify the identity of your users by checking that the person looking to verify their identity using a document, such as a passport, is the actual document holder.

Depending on the requested scope, we can return the user details parsed out from the user ID along with the actual images of the document.

### Web KYC OAuth 2.0 Flow

We use OAuth 2.0, the industry standard for third-party authorization.  Further information about this standard can be found here.  There is also a simplified introduction available.
The standard defines several grant types. We use the Authorization Code grant type. At first glance, it may seem complicated, but it can be summed up to five simple steps:

### Redirect to Authenteq Identity Server

The user selects Sign up with Authenteq on your website and is redirected to the Authenteq Identity Server.

<img src="http://localhost:4567/images/flow.png"> </img>

### Identification Process

The Authenteq Identity Server performs the identification process. The first step of that process is the liveness test. We make sure that the person in front of the web or front-facing camera is a real human being, and not a mannequin, picture, or person in a mask. The user then takes a picture of the Id he or she wishes to use in the identification process.
We then make sure that the person in front of the camera is the actual document holder by matching pictures from the liveness process with the picture from the Id document. If the identification is successful, we OCR the user details from the document.

### Redirect with code back to the client system

When the identification process is completed successfully, the Authenteq Identity Server redirects the user back to your service, passing an alphanumerical code in the parameters. The redirect is performed to a predefined URI in the client system, which should inform the user about the successful identification and pass the code for further processing.
See Integrating with Authenteq for more information.

### Code to token exchange

As mentioned, when the identification process is completed successfully, the Authenteq Identity Server redirects the user back to your service, passing an alphanumerical code in the parameters.
In your backend, you make a call to the Authenteq API. You exchange the code for a token that will be used to authorize further calls.  
As an additional security measure, the exchange also requires your secret, provided to you when integrating with Authenteq. This ensures that even if the code is intercepted, it would be useless in any attempted attack.

### Details Retrieval

When you have a token, you can get the user details parsed out from the Id document used in the identification process. We only store the user data temporarily so it must be retrieved from the Authenteq API within 15 minutes of token generation.

---

# Getting Started

This tutorial explains the Web SDK identity verification flow. It will give you a notion of how the data from the user's ID will get to your system.

## Introduction

In this tutorial we will not implement anything, but instead, we will go through the identification process and we will use curl to call the Authenteq API. We strongly recommend following this tutorial before you jump to the integration explained in the guide "How to integrate Web SDK?".
Before we start, please prepare your ID. It can be a passport, national identity document or driving license. You should also have clientId and secret provided by our support.

## Direct User to Authenteq Identity Server

> To start the Web SDK identity verification flow, you direct the user to our identity verification website:

```
https://identity.authenteq.com/authorize?response_type=code&redirect_uri=<redirectUri>&client_id=<clientId>&state=randomrandom
```
Put  your **`clientId`** in the URL and replace **`redirectUri`** with the address you provided during registration.
Open the above link in your browser.

<aside class="notice">
Open the link in your browser
</aside>

## User Performs Identification

Follow the steps of the identification (introduction, liveness check, document scan, redirect). Your user will go through the same process. Continue upon the successful redirect.

>You should have been redirected to:
```
<redirect_uri>?code=...&state=...
```

## Getting the Code

Now the user was redirected back to your service. With that redirect, we send back the `code` in a parameter.
Go to the address bar of your browser and copy the value of the `code` parameter.
You may notice that it is not the only parameter. The other one is the state, which is the random string we sent earlier. You may wonder why to send the same value back and forth? It is to make sure, that it is your service that initiated the identification process. Once you generate state you should save its value in a session or a cookie. When your service receives redirect it should compare value received with the saved state and ignore the code if the values don't match. This check is optional but also highly recommended.

## Exchanging Code for a Token

> Once you have a code you can exchange it for a token, which you will use to authorize the request to retrieve the user details.

```shell
$ curl -XPOST \
-F 'grantType=authorization_code' \
-F 'code=<code>' \
-F 'redirectUri=<redirectUri>' \
-F 'clientId=<clientId>' \
-F 'clientSecret=<clientSecret>' \
https://api.authenteq.com/v2/web-kyc/token

{"token":"eyJhbGc..."}
```

Execute the command above with the code you got earlier and put values to **`clientId`**, **`clientSecret`** and  **`redirectUri`** . Copy the **`token`** from the response.
Why do we need to exchange the code for the token? Couldn't we just use code to authorize future requests? The answer is: we could, but the exchange gives an extra layer of protection. It requires a secret that is only known by you. So even if an attacker would intercept the code, he won't be able to do anything with it. The secret must be kept secret, so the exchange must happen in the backend of your service.




<aside class="warning">
Please, note that you can exchange the code only once! If you try again the endpoint will return an error.
</aside>




## Retrieving User Details
```shell
$ curl -X GET -H 'Authorization: Bearer <token>' https://api.authenteq.com/v2/web-kyc/details
```
```perl
{
   croppedDocs: {
    front: "<base64_encoded_JPEG_image>",
    back: "<base64_encoded_JPEG_image>",
},
details:
{
    documentNumber: "8136431812",
    issuingCountry: "DEU",
    documentType: "FG617451",
    givenNames: "ANNA MARIA",
    surname: "SCHMIDT",
    dateOfBirth: "1987-01-12",
    nationality: "DEU",
    dateOfIssue: "2017-01-30",
    dateOfExpiry: "2027-01-30",
    sex: "F"
   }
}
```
Now you have everything to retrieve user data. Let's call **`/details`** endpoint. We need to place the **`token`** in the **`Authorization`** header with a prefix Bearer.
 

Execute curl  with the proper token and we are done! User details reached your system.

<aside class="warning">
Please, remember that we store the data only for 15 min.
</aside>



# How to Integrate Web SDK

## Steps
Confirming a user's identity with Authenteq Web KYC with OAuth 2.0 flow is fairly simple. You can integrate our solution into your system with four basic steps.

### 1) Get your client details

Once you sign up, we will create a client account for your system. You will get from us:

* **`clientId`** - an identifier that you will use to authorize requests. You will pass that openly in the URL parameters
* **`clientSecret`** - an alphanumeric string that you will use for token exchange and retrieving user details
To create the account we will need the following information:
* **`redirectUri`** - the URI that your user is redirected to on successful identity verification.  The link must be an HTTPS link. (i.e: https://example.com/success)
* **`logo`** - your company logo that will be displayed on top of the page during the identity check

### 2) Create the "Sign Up with Authenteq" Button

>

```
https://identity.authenteq.com/authorize?state=abc&response_type=code&redirect_uri=https://demo-portal.authenteq.com/webkycdemoclient/results&back=https://&client_id=com.authenteq.demo
```

To initialize the identity process you must redirect your users to our Identity Server using the following link:

The URL must contain the following parameters:

* **`response_type`** - indicates the type of OAuth flow. Currently, we only support a code flow, so the value should be code
* **`client_id`** - the client identifier provided to you
* **`redirect_uri`** - the URI where we will redirect users on successful identity verification. To prevent possible fraud, it must match the URI defined in your account
* **`scope`** - a list of user properties you want to get from user details.  Currently, the only supported value is kyc
* **`state`** - a random string generated by your application that you can use to verify that the redirect that comes to your website is from the identification process started by your website. You can store the state value in the cookie and verify that it matches the value that arrived in the redirect
* **`back_url`** - the URL for the Back to ... link in the identity server (optional)

By following the link the user will begin the identification process:  

* Liveness test
* Id scan
* Identity verification - where we verify that the person who performed the liveness test is the document holder

>

```html
<a class="AuthenteqButton" href="https://identity.authenteq.com/oauth?response_type=<...>&client_id=<...>&redirect_uri=<...>&scope=<...>&state=<...>&back=<...>">
<img class="AuthenteqButton-logo" src="authenteq-logo.png" alt="Authenteq Logo" />
<div class="AuthenteqButton-caption">Sign Up with Authenteq</div>
</a>
```
```css
.AuthenteqButton,
.AuthenteqButton:hover,
.AuthenteqButton:active {
margin: 0 auto;
display: block;
position: relative;

height: 48.59px;
width: 286px;
border-radius: 28px;
background-color: #F29E2E;
box-shadow: 0 5px 10px -5px rgba(0,0,0,0.2);

color: #FFFFFF;
font-family: Roboto;
font-size: 15px;
line-height: 18px;
text-align: center;
}

.AuthenteqButton-logo {
display: block;
width: 30px;
height: 30px;
position: absolute;
top: 9px;
left: 16px;
}

.AuthenteqButton-caption {
position: absolute;
top: 9px;
left: 62px;

height: 30px;
width: 224px;
color: #FFFFFF;
font-family: Roboto;
font-size: 15px;
line-height: 30px;
font-weight: 100;
text-align: center;
border-left: 1px solid #FFFFFF;
}
```

To inform the user that their identity will be verified using an external service you should use our custom button:
<img src="http://localhost:4567/images/button.png"></img>

### 3) Exchange code for the token

When the identify verification process is complete, we will redirect the user to the redirect URI and add two parameters:

  *   **`code`** - the code that you will use to retrieve the authorization token
  *   **`state`** - the random string you passed in the link to the Authenteq Identity Server

Before you proceed with the token exchange, verify that the state value equals the value you set in the link to the Authenteq Identity Server. You can do that by comparing it with the state value saved in the cookie or session.


> The response will be a JSON object:

```perl
{
"token": "fa3243fsd...",
}
```
> <aside class="warning">
This Request should be performed in the backend of your service.
</aside>


To exchange the token, you will have to perform a POST request to <a>https://api.authenteq.com/v2/web-kyc/token</a> and provide the following parameters:

  *   **`grantType`** - indicates token exchange. Its value should be authorizationCode
  *   **`code`** - the code passed to redirectUri in the parameters
  *   **`redirectUri`** - the redirect URI that was used to receive the code
  *   **`clientId`** - your client Id
  *   **`clientSecret`** - your secret


<i><small>
You may ask why we don't send the token immediately. The code use to retrieve the authorization token is sent as a URL parameter, and usually stored in server logs. If we pass the token immediately, the valuable security information would be stored in server logs, which are usually not the most protected resource.
Once the code is exchanged for the token you can no longer use it, so the value stored in the server logs becomes useless.  
However, the main reason is that you need to provide your secret to retrieve the token. This way we can make sure that even if someone intercepted the code, using, for example, a malicious browser plugin, it would be impossible to use the code to hijack the data transfer to access user details.
</i></small>


### 4) Get user details





```
Authorization: Bearer <token>
```
To authorize the request, you must pass the token in the Authorization header of your request:

> The endpoint will then return the user details:

```perl
{
  croppedDocs: {
    front: "<base64_encoded_JPEG_image>",
    back: "<base64_encoded_JPEG_image>",
  },
  details:
  {
    documentNumber: "8136431812",
    issuingCountry: "DEU",
    documentType: "FG617451",
    givenNames: "ANNA MARIA",
    surname: "SCHMIDT",
    dateOfBirth: "1987-01-12",
    nationality: "DEU",
    dateOfIssue: "2017-01-30",
    dateOfExpiry: "2027-01-30",
    sex: "F"
   }
}
```
You can get the details by performing GET request to: https://api.authenteq.com/v2/web-kyc/details

Once you have a token, you have 15 minutes to retrieve the user details. After that time, the token expires and you no longer can access the data.

# API Reference
The details of API endpoints for WebKYC

> Response:
 200: OK
 Redirect to redirect_uri with code and state passed as parameters.
 https://example.com/result?code=<...>&state=<...>

### Request:

<table>
    <tbody>
        <tr>
            <td>response_type</td>
            <td> <code>string</code> </td>
            <td> Defines the grant type. The only supported grant type is OAuth Authorization Code, so the value should be <code>code</code> </td>
            </tr>
            <td>client_id</td>
            <td> <code>string</code> </td>
            <td> The clientId identifier assigned to the client.</td>
            </tr>            
            <td>redirect_uri</td>
            <td> <code>string</code> </td>
            <td> The redirect URI that will be used to pass the code back to the client service. It must match the URI stored in the client settings.</td>
            </tr>
            <td>scope</td>
            <td> <code>string</code> </td>
            <td> The list of user properties you want to get from user details.  Currently, the only supported value is <code>kyc</code> </td>
            </tr>
            <td>state</td>
            <td> <code>string</code> </td>
            <td> A random string generated by the client application that will be passed back with the code. It should be stored in a session or a cookie.</td>
            </tr>
            <td>back_url</td>
            <td> <code>string</code> </td>
            <td> The URL for the <strong>Back to</strong> link in the identity server.
 </td>
            </tr>
    </tbody>
</table>
