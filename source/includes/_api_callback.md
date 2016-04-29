# App Installation

## Introduction

A user at a store's Control Panel kicks off the installation sequence by clicking to install your app. Bigcommerce redirects the user to the **Auth Callback URI** provided during [app registration](/api/registration). The **Auth Callback URI** must be publicly available, fully qualified, and served over TLS.

>PRO TIP: The install request comes from the client browser, rather than directly from Bigcommerce. This allows you to use a non-publicly-available **Auth Callback URI** while testing your app.</span></div>

The following diagram illustrates the entire sequence.

![bc-oauth-install-seq](//assets.contentful.com/2r9etoq3k4k4/5DLR21MrzUK0YAycqWkA2U/7c68a950e83ec1f906a79f2e41b89e45/bc-oauth-install-seq.svg)

The remainder of this section discusses each action your app needs to take during the sequence.

1.  [Receiving the **GET** request](#get-req)
2.  [Responding to the **GET request**](#get-response)
3.  [Making the **POST** request](#post-req)
4.  [Receiving the **POST** response](#post-receipt)

## Receiving the GET request

### Overview

The **GET** request to your **Auth Callback URI** contains a temporary code that you can exchange for a permanent OAuth token and a unique value that identifies the store installing your app, as well as other values.

### Parameters

The following table details the full list of parameters and values included in the **GET** request from Bigcommerce to your **Auth Callback URI**. Bigcommerce passes these within the URI itself as query parameters.

| Parameter | Description |
| --- | --- |
| **code** | Temporary code to exchange for a permanent OAuth token. See [Making the **POST** request](#post-req) below for more information about this exchange. |
| **scope** | List of scopes authorized by the user. As a best practice, you should validate this list to ensure that it matches the needs of your app and fail if it does not. However, at this time, the user does not have any opportunity to pick and choose between scopes. The dialog presented to the user requires the user to approve all scopes or none. |
| **context** | The store hash, a unique value that identifies the store that the user who clicked to install your app is logged into. Bigcommerce passes this along with a context path, as follows: `stores/{store_hash}`. Save the store hash value as you will need to pass it in all your requests to the Stores API. |

### Example

```
GET /auth?code=qr6h3thvbvag2ffq&scope=store_v2_orders&context=stores/g5cd38 HTTP/1.1
Host: app.example.com

```

## <a id="get-response"></a>Responding to the GET request

Upon receiving the **GET** request at your **Auth Callback URI**, you should return some HTML to the merchant browser. Bigcommerce renders this in an iframe inside of the Control Panel. It could be a form that collects further information from the user or you could redirect the user to the main page of your app. If you do not pass back some HTML, the user will be left looking at a blank screen. Such an app would not be accepted into the App Store.

## <a id="post-req"></a>Making the POST request

### Overview

The primary purpose of the **POST** request is to exchange the temporary access code for a permanent OAuth token. However, there are a number of additional values you need to pass to accomplish the exchange. Pass the parameters and their values inside the request body, using query parameters and URL-encoding. To accomplish this, you must include the following HTTP header: **Content-Type: application/x-www-form-urlencoded**

Make the **POST** request to the following address: **https://login.bigcommerce.com/oauth2/token**.

Upon receiving the **POST**, Bigcommerce marks the status of your app as "Installed," removes the progress indicator overlay, and places your app icon in the left-hand navigation of the Control Panel. With the progress indicator overlay removed, the user can interact with the HTML that you returned in your [**GET** response](#get-response).

### Parameters

Include values for each of the following parameters.

| Parameter | Description |
| --- | --- |
| **client_id** | The Client ID for your app, obtained during [registration](/api/registration). |
| **client_secret** | The Client Secret for your app, obtained during [registration](/api/registration). |
| **code** | Temporary access code received in the [**GET** request](#get-req) discussed above. |
| **scope** | List of OAuth scopes received in the [**GET** request](#get-req) discussed above. |
| **grant_type** | Always use the following: **authorization_code**. |
| **redirect_uri** | Must be identical to your registered **Auth Callback URI**. |
| **context** | The store hash received in the [**GET** request](#get-req), in the format: **stores/{_store_hash_}** |

### Examples


*   [HTTP](#token-http)
```
POST /oauth2/token HTTP/1.1
Host: login.bigcommerce.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 186

client_id=236754&client_secret=m1ng83993rsq3yxg&code=qr6h3thvbvag2ffq&scope=store_v2_orders&grant_type=authorization_code&redirect_uri=https://app.example.com/oauth&context=stores/g5cd38
```

*   [PHP](#token-php)

```
use Bigcommerce\Api\Connection;
$tokenUrl = "https://login.bigcommerce.com/oauth2/token";
$connection = new Connection();
$connection->useUrlencoded();
$response = $connection->post($tokenUrl, array(
    "client_id" => "236754",
    "client_secret" => "m1ng83993rsq3yxg",
    "redirect_uri" => "https://app.example.com/oauth",
    "grant_type" => "authorization_code",
    "code" => $request->get("code"),
    "scope" => $request->get("scope"),
    "context" => $request->get("context"),
));
$token = $response->access_token;
```
## <a id="post-receipt"></a>Receiving the POST response

### Overview

The **POST** response will include a JSON object containing the permanent OAuth token, user information, and other values. Upon receiving the permanent OAuth token, store it securely. You should also store the user and store hash values to identify the user and store at load and uninstall. The following sections detail the contents of the JSON body.

### JSON Values

| Name | Data Type | Value Description |
| --- | --- | --- |
| **access_token** | string | The permanent OAuth token that your app can use to make requests to the Stores API on behalf of the user. Store this value securely. |
| **scope** | string | List of authorization scopes. |
| **id** | integer | Unique identifier for the user. Store this value to identify the user at load and uninstall. |
| **email** | string | The user’s email address. Store this value to identify the user at load and uninstall. |
| **context** | string | The store hash, as well as a base path: **stores/{_store_hash_}** |

### JSON Example

```
{
  "access_token": "g3y3ab5cctiu0edpy9n8gzl0p25og9u",
  "scope": "store_v2_orders",
  "user": {
    "id": 24654,
    "email": "merchant@mybigcommerce.com"
  },
  "context": "stores/g5cd38"
}
```
