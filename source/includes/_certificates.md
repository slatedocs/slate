# Certificates

At the moment we only support signing with the FIEL (the most frequently used advanced electronic signature in Mexico). We will  soon be adding support for additional types of electronic signatures and will update the documentation as we do so.

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

Uploads the certificate of a signer in your account.

### HTTP Request

`POST https://www.mifiel.com/api/v1/keys`

### Parameters

Field | Type |  Description
----- | ---- | ------------
file  | String | `.cer` File of your FIEL

<aside class="info">
  You only have to send the public certificate of the signer. We will never store the private key in our servers.
</aside>

### Response

Returns a [Certificate Model](#certificate)

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

Allows you to retrieve a specific certificate.

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys/:id`

### Response

Returns a [Certificate Model](#certificate)

## Get All Certificates

```ruby
require 'mifiel'

certificates = Mifiel::Certificate.all
```

```shell
curl "https://www.mifiel.com/api/v1/keys"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Allows you to retrieve ALL certificates in your account.

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys`

### Response

Returns an Array of a [Certificate Model](#certificate)

## Delete a Certificate

```ruby
require 'mifiel'

Mifiel::Certificate.delete('07320f00-f504-47e0-8ff6-78378d2faca4')
```

```shell
curl -X DELETE "https://www.mifiel.com/api/v1/keys/07320f00-f504-47e0-8ff6-78378d2faca4"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Allows you to delete a specific certificate in your account.

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

> JSON Example response:

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

Lists all of the public SAT Certificates used to generate all FIELs

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys/:id`

### Response parameters

Field           | Type  |  Description
--------------- | ----  | -----------
cer_hex         | HEX   | SAT Root Certificate in hex form
expires_at      | Date  | Expiration date of the certificate
expired         | Boolean | `true` if expires_at is prior to today
