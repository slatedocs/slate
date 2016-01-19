# Certificates

## Create a Certificate

```ruby
require 'mifiel'

file_contents = File.read('my-certificate.cer')
certificate = Mifiel::Certificate.create(file_contents)
```

```shell
curl -X POST https://www.mifiel.com/api/v1/keys \
  -F "file=@my-certificate.cer" \
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Create a certificate in your account.

### HTTP Request

`POST https://www.mifiel.com/api/v1/keys`

### Parameters

Field | Type |  Description
----- | ---- | ------------
file  | File | `.cer` File of your FIEL 

<aside class="info">
  You have to send us just the public certificate. We will never store the private key in our servers.
</aside>

### Response

Returns a [Certificate Model object](#certificate)

## Get a Specific Certificate

```ruby
require 'mifiel'

certificate = Mifiel::Certificate.find('07320f00-f504-47e0-8ff6-78378d2faca4')
certificate.type_of
certificate.owner
certificate.tax_id
# ...
```

```shell
curl "https://www.mfiel.com.mx/api/v1/keys/07320f00-f504-47e0-8ff6-78378d2faca4"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Retrieve a specific certificate.

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys/:id`

### Response

Returns a [Certificate Model object](#certificate)

## Get All Certificates

```ruby
require 'mifiel'

certificates = Mifiel::Certificate.all
```

```shell
curl "https://www.mifiel.com/api/v1/keys"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Retrieve all certificates in your account.

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys`

### Response

Returns an Array of [Certificate Model object](#certificate)

## Delete a Certificate

```ruby
require 'mifiel'

Mifiel::Certificate.delete('07320f00-f504-47e0-8ff6-78378d2faca4')
```

```shell
curl -X DELETE "https://www.mifiel.com/api/v1/keys/07320f00-f504-47e0-8ff6-78378d2faca4"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Deletes a certificate in your account.

### HTTP Request

`DELETE https://www.mifiel.com/api/v1/keys/:id`

## SAT Root Certificates

```ruby
require 'mifiel'

sat_certificates = Mifiel::Certificate.sat
```

```shell
curl "https://www.mifiel.com/api/v1/keys/sat"
```

> Example JSON response

```json
[
  {
    "cer_hex": "505003081ac310b3...009060355040613024d583",
    "expires_at": "2017-06-10T19:41:06.000Z",
    "expired": false
  },
  {
    "cer_hex": "302d060355040a0...653572766963696f20646520",
    "expires_at": "2018-06-10T09:11:26.000Z",
    "expired": false
  }
]
```

Lists all public SAT Certificates used to generate FIELs

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys/:id`

### Response parameters

Field           | Type  |  Description
--------------- | ----  | -----------
cer_hex         | HEX   | SAT Root Certificate in hex form
expires_at      | Date  | Expiration date of the certificate
expired         | Boolean | `true` if expires_at is less than today
