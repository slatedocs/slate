# Objects

## Document

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

## Key

Field           | Type |  Description
--------------- | ---- | -----------
id              | String | The ID of the Certificate
type_of         | String | Type of certificate used: `FIEL` or `CSD`
owner           | String | Name of the owner as defined in the certificate
tax_id          | String | RFC or identifier of owner as defined in the certificate
cer_hex         | String | Certificate in Hexadecimal
expires_at      | Date | Expiration date of the Certificate
expired         | Boolean | true` if the Certificate is expired