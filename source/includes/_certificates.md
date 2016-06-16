# Certificates

At the moment we only support signing with the FIEL (the most frequently used advanced electronic signature in Mexico). We will  soon be adding support for additional types of electronic signatures and will update the documentation as we do so.

## Create a Certificate

```ruby
require 'mifiel'

certificate = Mifiel::Certificate.create(
  file: 'path/to/my-certificate.cer'
)
```

```shell
curl -X POST https://www.mifiel.com/api/v1/keys \
  -F "file=@my-certificate.cer" \
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Certificate;

$certificate = new Certificate([
  'file' => 'path/to/my-certificate.cer'
])
$certificate->save();
?>
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
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Certificate;

$certificate = Certificate::find('07320f00-f504-47e0-8ff6-78378d2faca4');
$certificate->cer_hex;
$certificate->type_of;
$certificate->owner;
# ...
?>
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
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Certificate;

$certificates = Certificate::all();
?>
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
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Certificate;

Certificate::delete('id');
?>
```

Allows you to delete a specific certificate in your account.

### HTTP Request

`DELETE https://www.mifiel.com/api/v1/keys/:id`
