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

Retrieve a specific certificate.

```ruby
require 'mifiel'

certificate = Mifiel::Certificate.find('07320f00-f504-47e0-8ff6-78378d2faca4')
certificate.type_of
certificate.owner
certificate.tax_id
# ...
```

```shell
curl "http://www.mfiel.com.mx/api/v1/keys/07320f00-f504-47e0-8ff6-78378d2faca4"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys/:id`

### Response

Returns a [Certificate Model object](#certificate)

## Get All Certificates

Retrieve all certificates in your account.

```ruby
require 'mifiel'

certificates = Mifiel::Certificate.all
```

```shell
curl "https://www.mifiel.com/api/v1/keys"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

### HTTP Request

`GET https://www.mifiel.com/api/v1/keys`

### Response

Returns an Array of [Certificate Model object](#certificate)

## Delete a Certificate

Deletes a certificate in your account.

```ruby
require 'mifiel'

Mifiel::Certificate.delete('07320f00-f504-47e0-8ff6-78378d2faca4')
```

```shell
curl -X DELETE "https://www.mifiel.com/api/v1/keys/07320f00-f504-47e0-8ff6-78378d2faca4"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

### HTTP Request

`DELETE https://www.mifiel.com/api/v1/keys/:id`
