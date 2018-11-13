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

This endpoint retrieves all the registered guests belonging to the selected booking and the police registration status.


### HTTP Request

`GET https://api.chekin.io/api/v1/checkins/bookings/<ID>/checkins_summary`

<aside class="success">
Remember — you need to replace ID with the id of a reservation.
</aside>


### Response

The police registration is executed in background and can fail for different reasons (Police login error, Police website temporary offline ..)
Then a progress status is returned in the field status. 


### Check-in Status

Status | Description
-------| -----------
NEW | The guest's data has been saved in CheKin and will be sent to the police soon.
PRO | The guest's data is being sen't to the police. The process hasn't finished yet.
COM | The guest's data was registered in the police website successfully.
NOL | Police login credentials were not provided. The data won't we sent to the police.
ERR | An error occurred while saving the guests data in the police website. This can happens if the data is invalid or if the police website answers with an error. You can check status_details to get more information about the error.

Also, the field "is_complete" will be True if status equals COMPLETE (the person was successfully registered in the police) or false for any other status.


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
If police credentials are setup for the related accommodation, then the data is automatically sent to the police this day, unless the parameter is_pre_checkin is set to True (see below). 


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
is_pre_checkin | false | False by default. If set to true, the data will be sent to the police the day of the check-in date instead of being sent immediately. 


<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>

## Generate Police Documentation

```shell
curl -X POST \
  https://api.chekin.io/api/v1/checkins/persons \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json' \
  -F checkin=1473 \
  -F 'signature_file=@/path/to/file/signature.png'
```


> The above command returns JSON structured like this:

```json
  {
      "checkin": 4134,
      "signature_file": "https://a_secure_url_to_access_the_file"
  }
```

For each registered person is necessary to upload the signature of the guest. 
After uploading the signature CheKin will generate a pdf file called "Legal Part File" that serves as proof of registration in the police. 

### HTTP Request

`POST https://api.chekin.io/api/v1/checkins/persons/signature`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
checkin | true | It must be the ID of a check-in previously created (See section "Register a Person / Check-in").
signature_file | true | A .png file with the handwritten signature and transparent background.


<aside class="warning">
Warning: The content type for this request must be multipart/form-data. JSON isn't accepted in file uploads.
</aside>


## Get Police Documentation

For each reservation, once all the guests are registered, CheKin will generate single pdf file including all the legal parts and the contract.


```shell
curl -X GET \
  https://api.chekin.io/api/v1/checkins/bookings/4520/docs \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
  {
      "contract_url": "https://api.chekin.io/lnk/abcd1",
      "parts_url": "https://api.chekin.io/lnk/abcd2"
  }
```

### HTTP Request

`GET https://api.chekin.io/api/v1/checkins/bookings/<ID>/docs`

This endpoint returns two short links to retrieve the legal parts file and the contract for one booking.

<aside class="success">
Remember — you need to replace ID with the id of a Reservation.
</aside>

## Get Guests Books

Once a day for each Accommodation, CheKin groups the part files by 500 in a single pdf file, called "Guests Book", numerating the parts from 1 to 500.


```shell
curl -X GET \
  https://api.chekin.io/api/v1/housings/254/books \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
  {
      "offset": 1,
      "status": "COM",
      "status_details": "",
      "created": "2018-11-13T01:00:01.390465Z",
      "modified": "2018-11-13T01:07:18.682501Z",
      "books": [
          {
              "housing": 268,
              "book_num": 1,
              "parts_qty": 500,
              "parts_starting_num": 1,
              "book_file_permalink": "https://test.chekin.io/lnk/abcd1"
          },
          {
              "housing": 268,
              "book_num": 2,
              "parts_qty": 123,
              "parts_starting_num": 1,
              "book_file_permalink": "https://test.chekin.io/lnk/abcd2"
          }
      ]
  }
```

### HTTP Request

`GET https://test.chekin.io/api/v1/housings/<ID>/books`

This endpoint returns a list of books for one Accommodation.

<aside class="success">
Remember — you need to replace ID with the id of an Accommodation.
</aside>


### Book Object

Field | Description |
----- | ----------- |
housing | Is the id of the accomodation to which this book belongs.
book_num | Books are numbered starting from 1. As each book can contain only 500 legal part files, there can be more than one. 
parts_qty | The number of part files inside this book (one part file = one person registered in the police)
parts_starting_num | 1 by default, but can eb changed from CheKin App in case the property manager.
book_file_permalink | A link to open / download this book (pdf).

