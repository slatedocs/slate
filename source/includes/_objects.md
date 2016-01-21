# Objects

## Document

Contains information about the PDF file being signed

```json
{
  "id": "29f3cb01-744d-4eae-8718-213aec8a1678",
  "original_hash": "e1a580c27d22b432a8c6f4c57aec89dca46bb89b492d3bc537bf90282a6889da",
  "file_file_name": "test-pdf.pdf",
  "signed_by_all": true,
  "signed": true,
  "signed_at": "2016-01-19T16:34:37.921Z",
  "status": [1, "Firmado"],
  "owner": {
    "email": "signer1@email.com",
    "name": "Jorge Morales"
  },
  "file": "/api/v1/documents/6e0143b0-084b-4b61-800d-486b111b0695/file",
  "file_download": "/api/v1/documents/6e0143b0-084b-4b61-800d-486b111b0695/file?download=true",
  "file_signed": "/api/v1/documents/6e0143b0-084b-4b61-800d-486b111b0695/file_signed",
  "file_signed_download": "/api/v1/documents/6e0143b0-084b-4b61-800d-486b111b0695/file_signed?download=true",
  "file_zipped": "/api/v1/documents/6e0143b0-084b-4b61-800d-486b111b0695/zip",
  "signatures": [{
    "email": "signer1@email.com",
    "signed": true,
    "signed_at": "2016-01-19T16:34:37.887Z",
    "certificate_number": "20001000000200001410",
    "tax_id": "AAA010101AAA",
    "signature": "77cd5156779c..4e276ef1056c1de11b7f70bed28",
    "user": {
      "email": "signer1@email.com",
      "name": "Jorge Morales"
    }
  }]
}

```

Field           | Type |  Description
--------------- | ---- | -----------
id              | String | 
original_hash   | String | Hash of the original (unsigned) document
file_file_name  | String | Name of the uploaded file
signed_by_all   | Boolean | `true` if all signers have signed the document
signed_at       | Date | Timestamp of date signed (when all signatures have been collected)
already_signed  | String[] | People that have signed
has_not_signed  | String[] | People that have not signed
status          | Array | [code, code_message] `0: not signed, 1: signed`
owner           | Object | The owner of the document. The user who created the document.
file            | String | Path where the original document can be downloaded
file_signed     | String | Path where the signed file can be downloaded
file_zipped     | String | Path where the file and signed file in a zip file can be downloaded 
signatures      | Object[] | Array of a [Signature Model](#signature)

## Certificate

Contains information regarding the advanced electronic signatures (e.g. FIEL) used to sign the document

```json
{
  "id": "07320f00-f504-47e0-8ff6-78378d2faca4",
  "type_of": "FIEL",
  "cer_hex": "308204cf30...1303030303030323",
  "owner": "JORGE MORALES MENDEZ",
  "tax_id": "MOMJ811012643",
  "expires_at": "2017-04-28T19:43:23.000Z",
  "expired": false
}
```

Field           | Type |  Description
--------------- | ---- | -----------
id              | String | The ID of the Certificate
type_of         | String | Type of certificate used (e.g. `FIEL`)
owner           | String | Name of the owner as defined in the certificate
tax_id          | String | RFC (tax ID) or other identifier of owner as defined in the certificate
cer_hex         | String | Certificate in hexadecimal
expires_at      | Date | Expiration date of the Certificate
expired         | Boolean | `true` if the Certificate is expired

## Signature

Contains information regarding the signers that have successfully signed the document

```json
{
  "email": "signer1@email.com",
  "signed": true,
  "signed_at": "2016-01-19T16:34:37.887Z",
  "certificate_id": "20001000000200001410",
  "tax_id": "AAA010101AAA",
  "signature": "77cd5156779c..4e276ef1056c1de11b7f70bed28",
  "user": {
    "email": "signer1@email.com",
    "name": "Signer 1"
  }
}
```

Field           | Type |  Description
--------------- | ---- | -----------
id              | String | The ID of the Certificate used to sign
email           | String | Email of the signer
signed          | Boolean | `true` if signed
signed_at       | Date   | Timestamp of the date signed
certificate_number | String | Certificate number assigned by the certificate authority (e.g. SAT)
tax_id          | String | RFC of the signer
signature       | String | Electronic signature on the document (in hexadecimal)
