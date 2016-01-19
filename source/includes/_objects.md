# Objects

## Document

```json
{
  "id": "29f3cb01-744d-4eae-8718-213aec8a1678",
  "original_hash": "e1a580c27d22b432a8c6f4c57aec89dca46bb89b492d3bc537bf90282a6889da",
  "signed_hash": null,
  "blockchainized": false,
  "btc_tx": null,
  "btc_tx_link": null,
  "file_file_name": "test-pdf.pdf",
  "name": null,
  "signed_by_all": true,
  "signed": true,
  "signed_at": "2016-01-19T16:34:37.921Z",
  "status": [1, "Firmado"],
  "owner": {
    "email": "signer@email.com",
    "name": "Signer 1"
  },
  "already_signed": [{
    "email": "signer@email.com",
    "name": "Signer 1"
  }],
  "has_not_signed": [],
  "file": "/api/v1/documents/72b41ab9-3a11-458a-9cfa-03c8d8756986/file",
  "file_download": "/api/v1/documents/72b41ab9-3a11-458a-9cfa-03c8d8756986/file?download=true",
  "file_signed": "/api/v1/documents/72b41ab9-3a11-458a-9cfa-03c8d8756986/file_signed",
  "file_signed_download": "/api/v1/documents/72b41ab9-3a11-458a-9cfa-03c8d8756986/file_signed?download=true",
  "file_zipped": "/api/v1/documents/72b41ab9-3a11-458a-9cfa-03c8d8756986/zip",
  "signatures": [{
    "email": "signer@email.com",
    "signed": true,
    "signed_at": "2016-01-19T16:34:37.887Z",
    "tax_id": "AAA010101AAA"
  }]
}
```

Field           | Type |  Description
--------------- | ---- | -----------
id              | String | 
original_hash   | String | Hash of the original (unsigned) document
file_file_name  | String | Name of the uploaded file
name            | String | 
signed_by_all   | Boolean | `true` if all signers have signed the document
signed_at       | Date | Timestamp of date signed (when all signatures have been collected)
already_signed  | String[] | People that have signed
has_not_signed  | String[] | People that have not signed
status          | Array | [code, code_message] `0: not signed, 1: signed`
owner           | Object | The owner of the document. The user who created the document.
file            | String | URL where the original document can be downloaded
file_signed     | String | URL where the signed file can be downloaded
signatures      | Object[] | Signatures on a signed document

## Certificate

```json
{
  "id": "07320f00-f504-47e0-8ff6-78378d2faca4",
  "type_of": "FIEL",
  "cer_hex": "308204cf30...1303030303030323",
  "owner": "ACCEM SERVICIOS EMPRESARIALES SC",
  "tax_id": "AAA010101AAA",
  "expires_at": "2017-04-28T19:43:23.000Z",
  "expired": false
}
```

Field           | Type |  Description
--------------- | ---- | -----------
id              | String | The ID of the Certificate
type_of         | String | Type of certificate used: `FIEL` or `CSD`
owner           | String | Name of the owner as defined in the certificate
tax_id          | String | RFC or identifier of owner as defined in the certificate
cer_hex         | String | Certificate in Hexadecimal
expires_at      | Date | Expiration date of the Certificate
expired         | Boolean | true` if the Certificate is expired

