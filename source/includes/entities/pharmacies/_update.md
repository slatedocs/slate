## Pharmacies - Update the patient's current pharmacy

<span style="color: red;">**DEPRECATED**</span>

Set the given pharmacy as the patient's current pharmacy.

### HTTP Request

`PUT {server_url}/api/v1/patients/{id}/pharmacies/{pharmacy_id}`

This request must include a valid User JWT token, please see our [documentation](#user-tokens).

### Header Parameter

Parameter    | Default
---------    | -------
Content-type | application/json
Authorization| Bearer {jwt_token}
