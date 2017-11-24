<h1 id='REST' class='section-header'>REST</h1>

<h1 id='Requests' class='section-subheader'>Requests</h1>

# Authentication

## Getting your API Key and Secret

You can generate an API key and secret from your [Settings/API](https://wcex.com/settings/api) page. This information will be used to sign requests to private API endpoints.

## Signing a Request

```javascript
import crypto from 'crypto'

// Signing a 'New Order' request

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

* `WCX-APIKEY` Your API key.
* `WCX-SIG` Your request signature (see below).
* `WCX-TIMESTAMP` A current timestamp, in milliseconds since UNIX epoch

To sign a request, first create the message to sign, which is the concatenated string:

`timestamp + method + path + body`

where:

* `timestamp` is the millisecond timestamp, the same as the `WCX-TIMESTAMP` header
* `method` is the UPPERCASE HTTP method used to make the request (`GET`, `POST`, `PUT`, or `DELETE`)
* `path` is the request path, e.g. `/new-order` (without query parameters)
* `body` is the JSON-stringified body sent in the request. This mostly applies to `POST` requests and can be ommitted for requests without a body.

Generate a sha256 HMAC of this string using your API Secret, then base64-encode the output to get the `WCX-SIG` for this request.


## Timestamp

`WCX-TIMESTAMP` is the current timestamp, in milliseconds since UNIX epoch. It has to be within 30 seconds of server time for the request to be valid. This helps prevent man-in-the-middle attacks and provides request replay protection.