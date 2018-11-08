# Check-ins & Police Registration

## Get Persons Registered / Check-ins status


```shell
curl -X GET \
  https://api.chekin.io/api/v1/checkins/bookings/4574/checkins_summary \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```


> The above command returns JSON structured like this:

```json
[
    {
        "id": 4134,
        "created": "2018-11-07T23:09:43.247852Z",
        "booking": 4574,
        "name": "ERIC FERNANDO",
        "surname": "SANCHEZ GALVEZ",
        "doc_type": "D",
        "doc_number": "48912467T",
        "expedition_date": "2016-02-03",
        "sex": "M",
        "nationality": "ESP",
        "birth_date": "1982-11-21",
        "phone": null,
        "status": "NOL",
        "status_details": "El manager de la vivienda debe completar el usuario / contraseña desde la app.",
        "is_pre_checkin": false,
        "is_complete": false
    },
    {
        "id": 4133,
        "created": "2018-11-07T23:09:16.114004Z",
        "booking": 4574,
        "name": "CARLOS ALBER",
        "surname": "LAGARES GALLARDO",
        "doc_type": "D",
        "doc_number": "75560632C",
        "expedition_date": "2014-03-28",
        "sex": "M",
        "nationality": "ESP",
        "birth_date": "1981-11-12",
        "phone": null,
        "status": "NOL",
        "status_details": "El manager de la vivienda debe completar el usuario / contraseña desde la app.",
        "is_pre_checkin": false,
        "is_complete": false
    }
]
```

This endpoint retrieves all the persons registered belonging to the selected booking and their police registration status.


### HTTP Request

`GET https://api.chekin.io/api/v1/checkins/bookings/<ID>/checkins_summary`

<aside class="success">
Remember — you need to replace ID with the id of a reservation.
</aside>

The police registration can take some time and can fail for different reasons (Police login error, Police website temporary offline ..)

### Check-in Status

Status | Description
-------| -----------
NEW | The guest's data has been saved in CheKin and will be sent to the police soon.
PRO | The guest's data is being sen't to the police. The process hasn't finished yet.
COM | The guest's data was registered in the police website successfully.
NOL | Police login credentials were not provided. The data won't we sent to the police.
ERR | An error occurred and the data wasn't registered in the police system. Check status_details to get more information about the error.

## Register a Person / Check-in


```shell
curl -X POST \
  https://api.chekin.io/api/v1/checkins/persons \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json' \
  -d '[
          {
              "booking": 1723,
              "doc_type": "P",
              "doc_number": "BBB12223",
              "sex":"M",
              "name": "Juan",
              "surname": "Perez",
              "expedition_date": "2014-02-15",
              "birth_date": "1987-07-20",
              "nationality": "ARG"
          },
          {
              "booking": 1723,
              "name": "Jose",
              "surname": "Lopez",
              "doc_type": "D",
              "doc_number": "12345648A",
              "expedition_date": "2010-01-23",
              "sex": "M",
              "nationality": "ESP",
              "birth_date": "1981-03-15",
              "is_pre_checkin": true,
              "id": 2423
          }
      ]'
```


> The above command returns JSON structured like this:

```json
[
    {
        "id": 4136,
        "created": "2018-11-08T21:45:43.434417Z",
        "guest_type": null,
        "booking": 4574,
        "name": "JUAN",
        "surname": "PEREZ",
        "doc_type": "P",
        "doc_number": "ABC12345",
        "expedition_date": "2014-02-15",
        "expedition_place": null,
        "sex": "M",
        "nationality": "ARG",
        "birth_date": "1987-07-20",
        "birth_place": null,
        "phone": null,
        "status": "NEW",
        "status_details": "",
        "is_pre_checkin": false,
        "send_to_police": true,
        "use_in_contract": false
    },
    {
        "id": 2423,
        "created": "2018-11-08T21:45:43.514356Z",
        "guest_type": null,
        "booking": 4574,
        "name": "JOSE",
        "surname": "LOPEZ VEGA",
        "doc_type": "D",
        "doc_number": "12345678S",
        "expedition_date": "2010-01-23",
        "expedition_place": null,
        "sex": "M",
        "nationality": "ESP",
        "birth_date": "1981-03-15",
        "birth_place": null,
        "phone": null,
        "status": "NEW",
        "status_details": "",
        "is_pre_checkin": false,
        "send_to_police": true,
        "use_in_contract": false
    }
]
```

This endpoint Registers the guests data in relation to a booking (check-in).  
If police credentials are setup for the related accommodation, then the data is automatically sent to the police.


### HTTP Request

`POST https://api.chekin.io/api/v1/checkins/persons`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
booking | true | It must be the ID of a reservation managed by this user.
doc_type | true | "P" (Passport) / "D" (Spanish DNI) / "X" 
doc_number | true | An alpha-numeric string shown in the identification document.
sex | true | "F" (Female) / "M" (Male) 
name | true | The guest's name/s.
surname | true | The guest's surname/s
expedition_date | true | The issue date of the identification document in format YYYY-MM-DD, i.e. 2010-11-23
birth_date | true | The guest's birth date in format YYYY-MM-DD, i.e. 1982-10-15
nationality | true | Country code in ISO 3-letters format, i.e. ESP (Spain) / DEU (Germany) / ITA (Italy)


<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>
