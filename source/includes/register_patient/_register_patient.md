# Registering a Patient

```shell
curl -X POST {server_url}/api/v1/patients
-H "Content-type: application/json"
-H "Authorization: Bearer 34a2sample-api-token"
-d '{
 "patient": {
    "first_name" : "Test",
    "last_name"  : "Test",
    "username"   : "testpatient2",
    "email"      : "test@gmail.com",
    "password"   : "123-abc-12",
    "password_confirmation" : "123-abc-12",
    "phone" : "9546666666",
    "zip" : "33327",
    "gender" : "male",
    "birthdate" : "02/22/1988",
    "affiliation_id" : "96"
  }
}'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "#{server_url}/api/v1/patients",
  :headers => {
    "Content-type" => "application/json",
	"Authorization" => "Bearer 34a2sample-api-token"
  },
  :payload => {
		"patient" => {
			"first_name" => "Test",
			"last_name"  => "Test",
			"username"   => "testpatient2",
			"email"      => "test@gmail.com",
			"password"   => "123-abc-12",
			"password_confirmation" => "123-abc-12",
			"phone" : "9546666666",
			"zip" : "33327",
			"gender" : "male",
			"birthdate" : "02/22/1988",
			"affiliation_id" : "96"
		}
  }
).execute
```

> The above command returns JSON structured like this:

```json
{
  "patient": {
    "id": 93,
    "first_name": "Test",
    "last_name": "Test",
    "middle_name": null,
    "username": "testpatient2",
    "email": "test@gmail.com",
    "address1": null,
    "address2": null,
    "city": "FORT LAUDERDALE",
    "zip": "33327",
    "phone": "9546666666",
    "work_phone": null,
    "state": "FL",
    "gender": "Male",
    "birthdate": "1988-02-22",
    "affiliation_id": 96
  },
  "token": [
    true,
    [
      "c86ebc21-f590-4ae0-856c-296b35a7a7de",
      "1510940999178369if"
    ],
  ]
}
```
Your credentials allow you to register patient's under your affiliation,
if the services you provide for your patient's through MDLIVE are subsidized. You must
perform an eligibility check before registering them.

In order to register a patient, you must have a valid JWT token, please see our [documentation](#api-tokens)

Once you have successfully authenticated and received a JWT token, the next step is to gather the necessary attributes
from the patient:

 |Attribute | Required | Description
-|--------- | -------  | -----------
patient |  |true     | parent attribute
 |first_name| true     | The patient's first name
 |last_name | true     | The patient's last name
 |username  | true     | The username the patient will use to sign in to MDLIVE [*](#patient-username-validation)
 |email     | true     | The email the patient will use to receive notifications from MDLIVE
 |password  | true     | The password the patient will use to sign in to MDLIVE  [*](#password-restrictions)
 |password_confirmation | true     | Confirmation of the password he patient will use to sign in to MDLIVE
 |zip       | true     | The patient's zip code of residence
 |gender    | true     | The patient's gender, must be either male or female
 |birthdate | true     | The patient's date of birth, must be in '%m/%d/%Y" format
 |phone     | true     | The phone the patient will use to sign in to MDLIVE


<aside id="password-restrictions" class="warning">
  TODO: Explain the password restrictions MDLIVE has in place.
</aside>

<aside id="patient-username-validation" class="warning">
  Before attempting to create the patient,
  The patient's username needs to be validated usin
  To obtain an API JWT Token
</aside>

