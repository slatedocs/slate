# Documents

## Create a Document

Create a document to be signed by passing a File or a Hash of the file.

Either the _"File"_ or _"Hash"_ must be passed.

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

### HTTP Request

`POST https://www.mifiel.com/api/v1/documents`

### Parameters

Field                 | Type |  Description
--------------------- | ---- | -----------
file         | File | __Optional__ File to be signed (The hash will be automatically extracted from the file and signed)
hash         | String | __Optional__ Hash of the original, unsigned document (The hash will be signed)
signatories  | Array | A list containing the name and email of each signer
callback_url | String | __Optional__ A Callback URL to post when the document gets signed

### Response

Returns a [Document Model object](#document)

## Get a Specific Document

Retrieve a specific document.

```ruby
require 'mifiel'

document = Mifiel::Document.find('29f3cb01-744d-4eae-8718-213aec8a1678')
document.original_hash
document.file
document.file_signed
# ...
```

```shell
curl "https://www.mfiel.com.mx/api/v1/documents/29f3cb01-744d-4eae-8718-213aec8a1678"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

### HTTP Request

`GET https://www.mifiel.com/api/v1/documents/:id`

### Response

Returns a [Document Model object](#document)

## Get All Documents

Retrieve all documents in your account.

```ruby
require 'mifiel'

documents = Mifiel::Document.all
```

```shell
curl "https://www.mifiel.com/api/v1/documents"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

### HTTP Request

`GET https://www.mifiel.com/api/v1/documents`

### Response

Returns an Array of [Document Model object](#document)

## Delete a Document

Deletes a document in your account.

```ruby
require 'mifiel'

Mifiel::Document.delete('29f3cb01-744d-4eae-8718-213aec8a1678')
```

```shell
curl -X DELETE "https://www.mifiel.com/api/v1/documents/29f3cb01-744d-4eae-8718-213aec8a1678"
  -H "Authorization: APIAuth your-hmac-auth-header"
```

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

### HTTP Request

`POST https://www.mifiel.com/api/v1/documents/:id/sign`

### Parameters

Either `key` or `certificate` must be provided.

Field       | Type |  Description
----------- | ---- | -----------
key         | String | __Optional__ The ID of the key used to sign the document
certificate | String | __Optional__ The signing certificate
signature   | String | The signature (generated using the key and the hash of the document)

## Request signature

```ruby
require 'mifiel'

document = Mifiel::Document.find('29f3cb01-744d-4eae-8718-213aec8a1678')
email = 'signer@email.com'
cc = ['my@email.com', 'other@email.com']
document.request_signature(email, cc: cc)
```


```shell
curl -X POST "https://www.mifiel.com/api/v1/documents/29f3cb01-744d-4eae-8718-213aec8a1678/request_signature" \
  -H "Authorization: APIAuth your-hmac-auth-header"
```
```

### HTTP Request

`POST https://www.mifiel.com/api/v1/documents/:id/request_signature`

### Parameters

Field     | Type |  Description
--------- | ---- | -----------
email     | String | Email of the person you want to sgn
cc        | String | Your email or any email that want to get a copy of the document when signed
