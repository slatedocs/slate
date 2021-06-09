# Documents

## Add Document to Claim

> Example Response Body:
```json
{
  "documentUrl": "https://exapi.lossexpress.com/documents/c30ae9da-9222-4de5-81fe-fe1ac590fa0f",
}
```

This route allows for adding documents to claims

### HTTP Request

`POST https://exapi.lossexpress.com/claims/documents/{claimId}`

### Request Body

This route accepts a JSON payload of an object comprising of:

Parameter | Description
--------- | -----------
document | A base64-encoded file string. Acceptable formats: `pdf`, `jpeg`, `jpg`, `tiff`, `gif`, `png`
description | A brief description of the document (eg, Settlement Breakdown)