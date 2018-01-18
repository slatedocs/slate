## Customer Documents - Show

```shell
curl -X GET {server_url}/api/v1/patients/{patient_id}/documents/{document_id} \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => '{server_url}/api/v1/patients/{patient_id}/documents/{document_id}',
  :headers => {
    'Authorization' => 'Bearer {jwt_token}',
    'Content-type' => 'application/json',
    'Accept' => 'application/json'
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "id":1,
  "mime_type":"image/png",
  "record_type":"Patient Record",
  "upload_date":"2018-01-16T20:51:06+00:00",
  "document_name":"DOGE.png",
  "upload_by":"test patient",
  "extension":"png",
  "thumbnail":"iVBORw0KGgoAAAANSUhEUgAAAG4AAABuAQAAAADuIBtWAAAABGdBTUEAALGP\nC/xhBQAAAAJiS0dEAAHdihOkAAAAB3RJTUUH4gEQCjcT4w8KOgAAABVJREFU\nOMtjYBgFo2AUjIJRMAroAQAGcgABdoTxvAAAACV0RVh0ZGF0ZTpjcmVhdGUA\nMjAxOC0wMS0xNlQxNTo1NToxOS0wNTowMG8EODEAAAAldEVYdGRhdGU6bW9k\naWZ5ADIwMTgtMDEtMTZUMTU6NTU6MTktMDU6MDAeWYCNAAAAAElFTkSuQmCC\n"
}
```

### HTTP Request

To retrieve a specific document, make a request to:

`GET {server_url}/api/v1/patients/{patient_id}/documents/{document_id}`

### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer {jwt_token}
Accept        | application/json
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute   | Required | Description
------------|----------|----------------------
patient_id  | true     | MDLIVE ID for patient
document_id | true     | MDLIVE ID for document
