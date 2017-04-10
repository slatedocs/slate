# Documents

## Create a Document

> Send only **original_hash** and **name** if you do not want us to have the document.

```ruby
require 'mifiel'

document = Mifiel::Document.create(
  file: 'path/to/my-file.pdf',
  signatories: [
    { 
      name: 'Signer 1', 
      email: 'signer1@email.com', 
      tax_id: 'AAA010101AAA' 
    }, 
    { 
      name: 'Signer 2', 
      email: 'signer2@email.com', 
      tax_id: 'AAA010102AAA' 
    }
  ],
  callback_url: 'https://www.example.com/webhook/url'
)

# if you don't want us to have the PDF, you can send us 
# the original_hash and the name of the document. Both are required.
file_contents = File.read('path/to/my-file.pdf')
original_hash = Digest::SHA256.hexdigest(file_contents)
document = Mifiel::Document.create(
  original_hash: original_hash,
  name: 'my-file.pdf'
  signatories: [ ... ]
)
```

```shell
curl -X POST https://www.mifiel.com/api/v1/documents \
  -F "file=@my-file.pdf" \
  -F "signatories[0][name]=Signer 1" \
  -F "signatories[0][email]=signer@email.com" \
  -F "callback_url=https://www.example.com/webhook/url" \
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Document;

$document = new Document([
  'file_path' => 'path/to/my-file.pdf',
  'signatories' => [
    [ 
      'name' => 'Signer 1', 
      'email' => 'signer1@email.com', 
      'tax_id' =>  'AAA010101AAA' 
    ],
    [ 
      'name' => 'Signer 2', 
      'email' => 'signer2@email.com', 
      'tax_id' =>  'AAA010102AAA'
    ]
  ]
]);
// if you don't want us to have the PDF, you can just send us 
// the original_hash and the name of the document. Both are required.
$document = new Document([
  'original_hash' => hash('sha256', file_get_contents('path/to/my-file.pdf')),
  'name' => 'my-file.pdf',
  'signatories' => ...
]);

$document->save();
?>
```

```python
from mifiel import Document, Client
client = Client(app_id='APP_ID', secret_key='APP_SECRET')

signatories = [
  { 
    'name': 'Signer 1', 
    'email': 'signer1@email.com', 
    'tax_id': 'AAA010101AAA' 
  },
  { 
    'name': 'Signer 2', 
    'email': 
    'signer2@email.com', 
    'tax_id': 'AAA010102AAA'
  }
]
document = Document.create(
  client=client, 
  signatories=signatories, 
  file='test/fixtures/example.pdf'
)
# if you don't want us to have the PDF, you can just send us 
# the original_hash and the name of the document. Both are required.
document = Document.create(
  client=client, 
  signatories=signatories, 
  dhash='some-sha256-hash'
)
```

Create a document to be signed by passing either a PDF file or the Hash of the file.

If you are using our [embedded signing widget](#widget), we suggest that you pass a __File__ so that it can be displayed to the end user (signer) within the signing flow on your webpage. Also when using the widget you must pass the __email of the signer__ (name is optional) so that we can send them a copy of the signed document when the signing process is complete.


### HTTP Request

`POST https://www.mifiel.com/api/v1/documents`

### Parameters

Field                 | Type |  Description
--------------------- | ---- | -----------
file         | String | __Optional__ File to be signed (The hash will be automatically extracted from the file and signed)
original_hash | String | __Optional__ _SHA256 encoded_ Hash of the original, unsigned document (The hash will be signed)
signatories  | Array | A list containing the __name__, __tax_id__ (RFC) and __email__ of each __signer__
callback_url | String | __Optional__ A Callback URL to post when the document gets signed

<aside class="info">
  <ul style="margin: 0; padding: 0">
    <li>Either the <b>file</b> or <b>original_hash</b> must be passed.</li>
    <li>The <b>email</b> in the <b>signatories</b> param is <b>required</b> when using embedded signing.</li>
  </ul>
</aside>

### Response

Returns a [Document Model](#document)

## Get a Specific Document

```ruby
require 'mifiel'

document = Mifiel::Document.find('29f3cb01-744d-4eae-8718-213aec8a1678')
document.original_hash
document.file
document.file_signed
document.widget_id
# ...
```

```shell
curl "https://www.mfiel.com.mx/api/v1/documents/29f3cb01-744d-4eae-8718-213aec8a1678"
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Document;

$document = Document::find('29f3cb01-744d-4eae-8718-213aec8a1678');
$document->original_hash;
$document->file;
$document->file_signed;
# ...
?>
```

```python
from mifiel import Document, Client
client = Client(app_id='APP_ID', secret_key='APP_SECRET')

document = Document.find(client, 'id')
document.original_hash
document.file
document.file_signed
# ...
```

Allows you to retrieve a specific document.

### HTTP Request

`GET https://www.mifiel.com/api/v1/documents/:id`

### Response

Returns a [Document Models](#document)

## Get All Documents

```ruby
require 'mifiel'

documents = Mifiel::Document.all
```

```shell
curl "https://www.mifiel.com/api/v1/documents"
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Document;

$documents = Document::all();
?>
```

```python
from mifiel import Document, Client
client = Client(app_id='APP_ID', secret_key='APP_SECRET')

documents = Document.all(client)
```

Allows you to retrieve all documents in your account.

### HTTP Request

`GET https://www.mifiel.com/api/v1/documents`

### Response

Returns an Array of [Document Model](#document)

## Delete a Document

```ruby
require 'mifiel'

Mifiel::Document.delete('29f3cb01-744d-4eae-8718-213aec8a1678')
```

```shell
curl -X DELETE "https://www.mifiel.com/api/v1/documents/29f3cb01-744d-4eae-8718-213aec8a1678"
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```php
<?php
require 'vendor/autoload.php';
use Mifiel\Document;

Document::delete('29f3cb01-744d-4eae-8718-213aec8a1678');
?>
```

```python
from mifiel import Document, Client
client = Client(app_id='APP_ID', secret_key='APP_SECRET')

Document.delete(client, '29f3cb01-744d-4eae-8718-213aec8a1678')
```

Allows you to delete a specific document in your account.

### HTTP Request

`DELETE https://www.mifiel.com/api/v1/documents/:id`

## Request signature

Sends an email request for the document to be signed.

```ruby
require 'mifiel'

document = Mifiel::Document.find('29f3cb01-744d-4eae-8718-213aec8a1678')
email = 'signer@email.com'
cc = ['signer@email.com', 'viewer@email.com']
document.request_signature(email, cc: cc)
```

```shell
curl -X POST "https://www.mifiel.com/api/v1/documents/29f3cb01-744d-4eae-8718-213aec8a1678/request_signature" \
  -H "Authorization: APIAuth APP-ID:hmac-signature"
```

```python
from mifiel import Document, Client
client = Client(app_id='APP_ID', secret_key='APP_SECRET')

email = 'signer@email.com'
cc = ['signer@email.com', 'viewer@email.com']
document = Document.find(client, '29f3cb01-744d-4eae-8718-213aec8a1678')
document.request_signature(email, cc=cc)
```

> Response from Mifiel:

```json
  {
    "status": "success",
    "message": "Correo enviado",
    "data": {
      "document": {
        "id": "29f3cb01-744d-4eae-8718-213aec8a1678"        
      }
    }
  }
```

### HTTP Request

`POST https://www.mifiel.com/api/v1/documents/:id/request_signature`

### Parameters

Field     | Type |  Description
--------- | ---- | -----------
email     | String | Email of the signer
cc        | String | Email of any non-signing viewers that should receive a copy of the signed document
