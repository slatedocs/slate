# Addresses

## Create
> Example Request:

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/addresses \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "details": {
            "country": "EE",
            "firstLine": "Narva mnt 5-1",
            "postCode": "10113",
            "city": "Tallinn"
          }
        }'
```

> Example Response:

```json
{
  "id": 236532,
  "profile": <your profile id>,
  "details": {
    "country": "EE",
    "firstLine": "Narva mnt 5-1",
    "postCode": "10113",
    "city": "Tallinn",
    "state": "",
    "occupation": null
  }
}
```

Adds address info to user profile.
List of required fields are slightly different for different countries.  
For example state field is required for US, CA, BR and AU addresses but not for other countries.
Please look at [Addresses.Requirements](#addresses-requirements) to figure out which fields are required to create addresses in specific country.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/addresses`**

Field                 | Description                                        | Format
---------             | -------                                            | -----------
profile               | User profile id.                                   | Integer
details.country       | 2 digit ISO country code.                          | Text
details.firstLine     | Address line: street, house, apartment.            | Text
details.postCode      | Zip code                                           | Text
details.city          | City name                                          | Text
details.state         | State code. Required if country is US, CA, AU, BR  | Text
details.occupation    | User occupation. Required for US, CA, JP           | Text


### Response
Field                 | Description                                        | Format
---------             | -------                                            | -----------
id                    | Address id                                         | Integer
profile               | User profile id.                                   | Integer
details.country       | 2 digit ISO country code.                          | Text
details.firstLine     | Address line: street, house, apartment.            | Text
details.postCode      | Zip code                                           | Text
details.city          | City name                                          | Text
details.state         | State code. Required if country is US, CA, AU, BR  | Text
details.occupation    | User occupation. Required for US, CA, JP           | Text



## Get By Id
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/addresses/{addressId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
  "id": 236532,
  "profile": <your profile id>,
  "details": {
    "country": "EE",
    "firstLine": "Narva mnt 5-1",
    "postCode": "10113",
    "city": "Tallinn",
    "state": "",
    "occupation": null
  }
}
```

Get address info by id.
### Request
**`GET https://api.sandbox.transferwise.tech/v1/addresses/{addressId}`**



## List
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/addresses?profile={profileId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
    {
        "id": 7099091,
        "profile": <your profile id>,
        "details": {
            "country": "EE",
            "firstLine": "Veerenni 29",
            "postCode": "12991",
            "city": "Tallinn",
            "state": null,
            "occupation": null
        }
    }
]
```
List of addresses belonging to user profile.

### Request
**`GET https://api.sandbox.transferwise.tech/v1/addresses?profile={profileId}`**





## Requirements
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/address-requirements \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
    "type": "address",
    "fields": [
      {
        "name": "Country",
        "group": [
          {
            "key": "country",
            "type": "select",
            "refreshRequirementsOnChange": true,
            "required": true,
            "displayFormat": null,
            "example": "Germany",
            "minLength": null,
            "maxLength": null,
            "validationRegexp": null,
            "validationAsync": null,
            "valuesAllowed": [
              {
                "key": "AX",
                "name": "Åland Islands"
              },
              ...
              {
                "key": "ZM",
                "name": "Zambia"
              }
            ]
          }
        ]
      },
      {
        "name": "City",
        "group": [
          {
            "key": "city",
            "type": "text",
            "refreshRequirementsOnChange": false,
            "required": true,
            "displayFormat": null,
            "example": "London",
            "minLength": null,
            "maxLength": null,
            "validationRegexp": null,
            "validationAsync": null,
            "valuesAllowed": null
          }
        ]
      },
      {
        "name": "Postal code",
        "group": [
          {
            "key": "postCode",
            "type": "text",
            "refreshRequirementsOnChange": false,
            "required": true,
            "displayFormat": null,
            "example": "10025",
            "minLength": null,
            "maxLength": null,
            "validationRegexp": null,
            "validationAsync": null,
            "valuesAllowed": null
          }
        ]
      }
      ...
    ]
  }
]
```
### Request
**` GET https://api.sandbox.transferwise.tech/v1/address-requirements`**<br/>
**` POST https://api.sandbox.transferwise.tech/v1/address-requirements`**<br/>

GET and POST address-requirements endpoints help you to figure out which fields are required to create a valid address for different countries.
You could even build a dynamic user interface on top of these endpoints. This is a step-by-step guide on how these endpoints work.

1. Call GET /v1/address-requirements to get list of fields you need to fill with values in "details" section for creating a valid address.  Response contains 4 required top level fields: 
 * country   (select field with list of values)
 * city      (text field)
 * postCode  (text field)
 * firstLine (text field)

2. Analyze the list of fields. Because refreshRequirementsOnChange=true for field 'country' then this indicates that there are additional fields required depending on the selected value.
3. Call POST /v1/address-requirements with selected country value to expose sub fields.  <br/>
For example posting {"details": {"country" : "US"}} will also add "state" to list of fields.<br/>
But posting {"details": {"country" : "GB"}} will not.

4. If you choose "US" as country you will notice that "state" field also has refreshRequirementsOnChange=true.  This means you would need to make another POST call to /v1/address-requirements with a specific state value.<br/>
For example posting {"details": { "country" : "US", "state": "AZ" }} will also add "occupation" to list of fields.<br/>
But posting {"details": { "country" : "US", "state": "AL" }} will not.

5. So once you get to the point where you have provided values for all fields which have refreshRequirementsOnChange=true then you have complete set of fields to compose a valid request to create an address object. 
For example this is a valid request to create address in US Arizona:
<br/> POST /v1/addresses:<br/>
{
    "profile" : your-profile-id,<br/>
    "details": {<br/>
        "country" : "US",<br/>
        "state": "AZ",<br/>
        "city": "Phoenix",<br/>
        "postCode": "10025",<br/>
        "firstLine": "50 Sunflower Ave.",<br/>
        "occupation": "software engineer"<br/>
    }
}<br/>


### Response
Field                                       | Description                                        | Format
---------                                   | -------                                            | -----------
type                                        | "address"                                          | Text
fields[n].name                              | Field description                                  | Text
fields[n].group[n].key                      | Key is name of the field you should include in the JSON                                     | Text
fields[n].group[n].type                     | Display type of field (e.g. text, select, etc)                                  | Text
fields[n].group[n].refreshRequirementsOnChange |  Tells you whether you should call POST address-requirements once the field value is set to discover required lower level fields.  | Boolean
fields[n].group[n].required                 | Indicates if the field is mandatory or not                                 | Boolean
fields[n].group[n].displayFormat            | Display format pattern.                                | Text
fields[n].group[n].example                  | Example value.                                | Text
fields[n].group[n].minLength                | Min valid length of field value.                                   | Integer
fields[n].group[n].maxLength                | Max valid length of field value.                             | Integer
fields[n].group[n].validationRegexp         | Regexp validation pattern.                                     | Text
fields[n].group[n].validationAsync          | Validator URL and parameter name you should use when submitting the value for validation | Text
fields[n].group[n].valuesAllowed[n].key     | List of allowed values. Value key                           | Text
fields[n].group[n].valuesAllowed[n].name    | List of allowed values. Value name.                          | Text

