## Medications - Create

```shell
curl -X POST {server_url}/api/v1/patients/{id}/medications
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-user-token"
-d '{
  "medication": {
    "name": "Hydrocortisone Ace (Topical)",
    "current": true,
    "dosage": "Aereosol",
    "frequency": "twice daily"
  }
}'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/api/v1/patients/{id}/medications",
  :headers => {
    "Content-type" => "application/json",
    "Authorization" => "Bearer 34a2sample-user-token"
  },
  :payload => {
    medication: {
      name: "Hydrocortisone Ace (Topical)",
      current: true,
      dosage: "Aereosol",
      frequency: "twice daily"
    }
  }
).execute
```

> The command above returns JSON structured like this:

```json
{
  "id": 4,
  "user_id": 62,
  "name": "Hydrocortisone Ace (Topical)",
  "dosage": "Aereosol",
  "start_date": null,
  "ndc": null,
  "prescriber": null,
  "stop_date": null,
  "prescription_date": null,
  "form": null,
  "dose": null,
  "route": null,
  "frequency": "twice daily",
  "active": true,
  "created_at": "2018-01-08T12:27:25.688-05:00",
  "updated_at": "2018-01-08T12:27:25.688-05:00",
  "origin": null,
  "notes": null,
  "cui": null,
  "session_guid": null,
  "deleted": "N",
  "source": "Self Reported",
  "current_condition": true,
  "updated_by": null,
  "new_crop_medication_id": null,
  "prescription_id": null,
  "quantity": 1,
  "status": "Active",
  "dc_reason": null,
  "discontinued_date": null,
  "last_updated_at": "01/08/2018"
}
```

To add a medication to a patient, make a request to:


### HTTP Request

`POST {server_url}/api/v1/patients/{id}/medications`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).


### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer example.jwttoken


### Request Body

Attribute   |           | Required | Description
----------- | ----------| -------- | -----------
            | id        | true     | ID of the patient
medication  |           | true     | Parent attribute for medication
            | name      | true  | Name of the medication (string)
            | current   | false | Permitted values are true, false
            | dosage    | false | Dosage of the medication (string)
            | frequency | false | Frequency of the medication (string)


### Response codes

HTTP Status Code | Reason
---------------- | ------
200              | Successful operation
400              | Missing or empty medication
401              | Not authorized or invalid token data
