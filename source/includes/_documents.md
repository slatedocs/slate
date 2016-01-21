# Documents

## Create a Document

```ruby
require 'mifiel'

file_contents = File.read('my-file.pdf')
signers = [
  { name: 'Signer 1', email: 'signer1@email.com' },
  { name: 'Signer 2', email: 'signer2@email.com' }
]
document = Mifiel::Document.create(file_contents, signers)
```

```shell
curl -X POST https://www.mifiel.com/api/v1/documents \
  -F "file=@my-file.pdf" \
  -F "signatories[0][name]=Signer 1" \
  -F "signatories[0][email]=signer@email.com" \
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Create a document to be signed by passing either a PDF file or the Hash of the file.

If you are using our [embedded signing widget](#widget), we suggest that you pass a __File__ so that it can be displayed to the end user (signer) within the signing flow on your webpage. Also when using the widget you must pass the __email of the signer__ (name is optional) so that we can send them a copy of the signed document when the signing process is complete.


### HTTP Request

`POST https://www.mifiel.com/api/v1/documents`

### Parameters

Field                 | Type |  Description
--------------------- | ---- | -----------
file         | String | __Optional__ File to be signed (The hash will be automatically extracted from the file and signed)
hash         | String | __Optional__ Hash of the original, unsigned document (The hash will be signed)
signatories  | Array | A list containing the __name__, __tax_id__ (RFC) and __email__ of each __signer__
callback_url | String | __Optional__ A Callback URL to post when the document gets signed

<aside class="info">
  <ul style="margin: 0; padding: 0">
    <li>Either the <b>file</b> or <b>hash</b> must be passed.</li>
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
  -H "Authorization: APIAuth your-hmac-auth-header"
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
  -H "Authorization: APIAuth your-hmac-auth-header"
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
  -H "Authorization: APIAuth your-hmac-auth-header"
```

Allows you to delete a specific document in your account.

### HTTP Request

`DELETE https://www.mifiel.com/api/v1/documents/:id`

## Sign a Document

```ruby
require 'mifiel'

document = Mifiel::Document.find('29f3cb01-744d-4eae-8718-213aec8a1678')

private_key = File.read('FIEL_AAA010101AAA.key')
private_key_pass = '12345678a'
certificate_id = '1d041a80-1d50-43ce-8534-64832de3be6b'

document.build_signature(private_key, private_key_pass)
document.sign(certificate_id: certificate_id)
# Or
certificate = File.read('FIEL_AAA010101AAA.cer')
document.sign(certificate: certificate)
```

Allows the specified document to be signed.

The documents get signed client-side. For security purposes, the private key and password of the signer never reach our server.

### HTTP Request

`POST https://www.mifiel.com/api/v1/documents/:id/sign`

### Parameters

Field          | Type   | Description
-------------- | ------ | -----------
certificate_id | String | __Optional__ The ID of the certificate that corresponds to the private key being used to sign 
certificate    | String | __Optional__ The certificate (.cer file) corresponding to the private key being used to sign
signature      | String | The electronic signature on the successfully-signed document

<aside class="info">
  Either the <b>certificate_id</b> or <b>certificate</b> must be provided.
</aside>

### Response

Returns a [Document Model](#document)

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
  -H "Authorization: APIAuth your-hmac-auth-header"
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
