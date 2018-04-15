<h1 id='REST' class='section-header'>REST</h1>

### Endpoint URL

`https://api.wcex.com`


# Authentication

## Getting your API Key

Your API key and secret are available on your [**Settings**](https://wcex.com/settings) page. Use them to sign requests to private API endpoints.

## Signing a Request

```javascript
import crypto from 'crypto'

// Signing a New Order request

const API_SECRET = "6a0ef...";

const TIMESTAMP = Date.now();

const body = JSON.stringify({
	product: "ETH-BTC",
	side: "sell",
	size: "10",
	price: "0.04",
	condition: "PO"
});

const message_to_sign = TIMESTAMP + "POST" + "/new-order" + body;

const hmac = crypto.createHmac('sha256', API_SECRET);

return hmac.update(message_to_sign).digest('base64');

```

Requests to private REST API endpoints must contain these headers:

* `WCX-APIKEY` Your API key
* `WCX-SIG` Your request signature (see below)
* `WCX-TIMESTAMP` A current timestamp, in milliseconds since UNIX epoch

To sign a request, first create the message to sign, which is the concatenated string:

`timestamp + method + path + body`

where:

* `timestamp` is the millisecond timestamp, the same one you pass to the `WCX-TIMESTAMP` header
* `method` is the UPPER CASE HTTP method used to make the request (`GET`, `POST`, `PUT`, or `DELETE`)
* `path` is the request path, e.g. `/new-order` (without query parameters)
* `body` is the JSON-stringified body sent in the request. This generally applies to `POST` requests and can be omitted for requests without a body.

Generate a SHA-256 HMAC of this string using your API secret, then Base64-encode the output to get `WCX-SIG`.


## Timestamp

`WCX-TIMESTAMP` is the current timestamp, in milliseconds since UNIX epoch. Providing it helps prevent man-in-the-middle attacks and provides request replay protection.

It has to be within 30 seconds of server time for the request to be valid. You can check the server time using the [/time](#time) endpoint.