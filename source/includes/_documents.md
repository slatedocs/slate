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

Create a document to be signed by passing either a File (in PDF) or a Hash of the file.
_Note: Either the "File" or "Hash" must be passed._

If you are using our [embedded signing widget](#widget), we suggest that you pass a File so that it can be displayed to the end user (signer) within the signing flow.


### HTTP Request

`POST https://www.mifiel.com/api/v1/documents`

### Parameters

Field                 | Type |  Description
--------------------- | ---- | -----------
file         | String | __Optional__ File to be signed (The hash will be automatically extracted from the file and signed)
hash         | String | __Optional__ Hash of the original, unsigned document (The hash will be signed)
signatories  | Array | A list containing the name and email of each signer (the email is __required__ to send a copy of the signed document to the signer)
callback_url | String | __Optional__ A Callback URL to post when the document gets signed

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

Returns a [Document Model](#document)

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

### HTTP Request

`POST https://www.mifiel.com/api/v1/documents/:id/sign`

<aside class="info">
  The documents get signed client-side. For security purposes, the private key and password of the signer never reach our server.
</aside>

### Parameters

Either the `certificate_id` or `certificate` must be provided.

Field          | Type   | Description
-------------- | ------ | -----------
certificate_id | String | __Optional__ The ID of the certificate that corresponds to the key being used to sign 
certificate    | String | __Optional__ The certificate (.cer file) corresponding to the key being used to sign
signature      | String | The signature (generated using the key and the hash of the document)

### Response

Returns a [Document Model](#document)

## Request signature

Sends a request for the document to be signed (to be used when the person interacting with your webpage is not the actual signer, e.g. signer's lawyer or assistant)

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
