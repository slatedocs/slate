## Payments

To send payments to a mobile subscriber, you create a new payment object. You can also retrieve individual payments or list all payments.

* End Point: https://app.beyonic.com/api/payments

### Creating a new payment

To create a new payment, make a POST to the endpoint above, with the following attributes:

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +256773712831 | Must be in international format
amount | Yes | String, Integer or Decimal | 3000 | Do not include thousands separators
currency | Yes | String | UGX | 3 letter ISO currency code. No currency conversion is done, so the currency must be valid for the selected phonenumber. You must have funded Beyonic an account in this currency. If your account for this currency has zero balance, your payment will fail.
description | Yes | String | Per diem payment | This description will be sent to the recipient along with the payment, so it should be limited to about 140 characters.
payment_type | No | String | money | Options: money (default), airtime - use "airtime" to send an airtime payment instead of a mobile money payment
callback_url | No | String | https://my.website/payments/callback | See "Callback URLs" below for more info.

**Callback URLs**

Callback URLs are used to send notifications of changes in payment status. Not all payments will be completed immediately, especially if it is a payment to a new number that hasn’t been verified, or if your account has approval rules that require other users to approve payments before they are processed.

* Non-HTTPS URLs will be rejected.
* Data will be posted to the URL, and a 200 response is expected.
* In version 1, a non 200 response may result in deletion of the URL, and no further notifications will be sent.
* In version 1, the URL you submit isn’t specific to the payment you have created. Once submitted, it will receive notifications for all future payments made via your organization, whether they are made via the API or via the web-interface.
* Therefore, you are encouraged to use the same URL for all payments. Since URLs are stored at a per-organization level, using different URLs may result in duplicate notifications being sent to the different URLs.
* In version 1, previously submitted urls can be deleted via the web browser, or the Webhooks API methods described elsewhere in this reference.




> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace `meowmeowmeow` with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Isis",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/3"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">If you're not using an administrator API key, note that some kittens will return 403 Forbidden if they are hidden for admins only.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the cat to retrieve