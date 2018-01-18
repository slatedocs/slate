## Customer Documents - List

```shell
curl -X GET {server}/api/v1/patients/{patient_id}/documents \
  -H 'Authorization: Bearer {jwt_token}' \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'
```

```ruby
RestClient::Request.new(
  :method => :get,
  :url => '{server}/api/v1/patients/{patient_id}/documents',
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
  "documents":[
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
  ]
}
```

### HTTP Request

To retrieve the list of a patient's current list of documents, make a request to:

`GET {server}/api/v1/patients/{patient_id}/documents`

### Headers

Parameter     | Default
--------------|------------------------
Authorization | Bearer {jwt_token}
Accept        | application/json
Content-type  | application/json

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### URL Parameters

The following parameters need to be included in the URL of the request:

Attribute  | Required | Description
-----------|----------|----------------------
patient_id | true     | MDLIVE ID for patient
