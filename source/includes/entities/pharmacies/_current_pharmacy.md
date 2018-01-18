## Pharmacies - Get the patient's current pharmacy

<span style="color: red;">**DEPRECATED\***</span>

*To get the patient's pharmacy please use [this endpoint](#retrieve-a-patient).

Retrieve the patient's current pharmacy.

### HTTP Request

`GET {server_url}/api/v1/patients/{id}/pharmacies/current_pharmacy`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}
