---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript
  - php

toc_footers:
  - <span>Write us at soporte@chekin.io to get an API Key</span>

includes:
  - errors

search: true
---

# Introduction

Welcome to the CheKin API! 

You can use our API to access CheKin API endpoints, which can get or update information on Bookings, Persons Registered, Housings and more.

The CheKin API is organized around REST. Our API has predictable, resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. 
We support cross-origin resource sharing, allowing you to interact securely with our API from a client-side web application. 

CheKin API accepts data as JSON or also as multipart/form-data. JSON is returned by all API responses, including errors.

The base url for CheKin API endpoints is `https://api.chekin.io/api/v1/`


# Api Key

> To authorize, use this code:


```shell
# With shell, you can just pass the correct header with each request
curl "https://api.chekin.io/api/v1/"
  -H "Api-Key: yourApiKeyhere"
```

```python

```

```ruby

```

```javascript

```

```php

```

> Make sure to replace `yourApiKeyhere` with your API key.

CheKin uses API keys to allow access to the API. You can ask for an new API key at soporte@chekin.io.
CheKin expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Api-Key: yourApiKeyhere`

<aside class="notice">
You must replace <code>yourApiKeyhere</code> with your personal API key.
</aside>

# User Token Authentication

> To get a user token, use this code:


```shell
curl -X POST \
  https://api.chekin.io/api/v1/users/token/create/ \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'content-type: multipart/form-data;' \
  -F email=usersemail@domain.com \
  -F password=userspassword
```

> The above command returns JSON structured like this:

```json
  {
    "auth_token": "yourUserTokenHere"
  }
```

> Make sure to replace `yourApiKeyhere` with your API key in headers.

To act in behalf of a CheKin user through the CheKin API, and access to his data, you will need to generate a user token. 
To get a token do a `POST` to the tokens endpoint at `https://api.chekin.io/api/v1/users/token/create/` sending user email and password and you will get the token as response. 

CheKin expects for the user token to be included in all authenticated API requests to the server in a header that looks like the following:

`Authorization: Token yourUserTokenHere`

<aside class="notice">
You must replace <code>yourUserTokenHere</code> with your user token.
</aside>

# Accommodations

## Get All accommodations


```shell
curl -X GET \
  https://api.chekin.io/api/v1/housings/ \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```


> The above command returns JSON structured like this:

```json
[
    {
        "id": 267,
        "tradename": "My House 1",
        "housing_type": "HOU",
        "rta_number": "RTAVTA12345678",
        "address": "Street 123",
        "province": 5,
        "municipality": "Barcelona",
        "legal_holder_name": "Peter Parker",
        "legal_holder_nif": "112345646S",
        "legal_holder_phone": "+3356258888",
        "police_type": "POL",
        "police_user": "policeuser",
        "police_password": "policepassword",
        "image": "https://an_url_of_the_picture_of_the_accommodation",
        "signature_url": "https://an_url_for_the_manager_signature_file",
        "is_housing_group": false,
        "police_hostelry_code": "",
        "airbnb_calendar": null,
        "legal_age": 16,
        "rooms_qty": 1,
        "max_capacity": 1,
        "airbnb_ics_url": null,
        "booking_ics_url": null,
        "avantio_ics_url": null
    },
    {
        "id": 1055,
        "tradename": "My House 2",
        "housing_type": "HOU",
        "rta_number": "RTAVTA12345678",
        "address": "Other Street 456",
        "province": 12,
        "municipality": "Madrid",
        "legal_holder_name": "Bruce Wane",
        "legal_holder_nif": "214142355bb",
        "legal_holder_phone": "+34555622122",
        "police_type": "POL",
        "police_user": "policeuser",
        "police_password": "policepassword",
        "image": "https://an_url_of_the_picture_of_the_accommodation",
        "signature_url": "https://an_url_for_the_manager_signature_file",
        "is_housing_group": false,
        "police_hostelry_code": "",
        "airbnb_calendar": "",
        "legal_age": 16,
        "rooms_qty": 1,
        "max_capacity": 1,
        "airbnb_ics_url": "",
        "booking_ics_url": "",
        "avantio_ics_url": ""
    },
]
```

This endpoint retrieves all the accommodations belonging to a user.

### HTTP Request

`GET https://api.chekin.io/api/v1/housings/`

<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>




## Get a Specific Accomodation


```shell
curl -X GET \
  https://test.chekin.io/api/v1/housings/<ID> \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```


> The above command returns JSON structured like this:

```json
{
    "id": 1073,
    "tradename": "My House 3",
    "housing_type": "HOU",
    "rta_number": "RTAVTA1Q24324",
    "address": "Some Street 123",
    "province": 7,
    "municipality": "my town",
    "legal_holder_name": "Juan Perez Gonzales",
    "legal_holder_nif": "321556987",
    "legal_holder_phone": "+33222555666",
    "police_type": "POL",
    "police_user": "",
    "police_password": "",
    "image": "",
    "signature_url": "",
    "is_housing_group": false,
    "police_hostelry_code": "",
    "airbnb_calendar": "",
    "legal_age": 16,
    "rooms_qty": 1,
    "max_capacity": 1,
    "airbnb_ics_url": "",
    "booking_ics_url": "",
    "avantio_ics_url": ""
}
```

This endpoint retrieves details on a specific accommodation.

### HTTP Request

`GET https://api.chekin.io/api/v1/housings/<ID>`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | The ID of the accommodation to retrieve


## Create a new accommodation


```shell
curl -X POST \
  https://api.chekin.io/api/v1/housings/ \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -F 'tradename=My House 3' \
  -F 'rta_number=RTAVTA1Q24324       ' \
  -F 'address=Some Street 123     ' \
  -F province=7 \
  -F 'municipality=my town' \
  -F 'legal_holder_name=Jhon Doe' \
  -F legal_holder_nif=321556987 \
  -F 'legal_holder_phone=+33222555666' \
  -F police_type=POL \
  -F police_user=H12345678 \
  -F police_password=mypassword
```


> The above command returns JSON structured like this:

```json
{
    "id": 1073,
    "tradename": "My House 3",
    "housing_type": "HOU",
    "rta_number": "RTAVTA1Q24324",
    "address": "Some Street 123",
    "province": 7,
    "municipality": "my town",
    "legal_holder_name": "Jhon Doe",
    "legal_holder_nif": "321556987",
    "legal_holder_phone": "+33222555666",
    "police_type": "POL",
    "police_user": "",
    "police_password": "",
    "image": "",
    "signature_url": "",
    "is_housing_group": false,
    "police_hostelry_code": "",
    "airbnb_calendar": "",
    "legal_age": 16,
    "rooms_qty": 1,
    "max_capacity": 1,
    "airbnb_ics_url": "",
    "booking_ics_url": "",
    "avantio_ics_url": ""
}
```

This endpoint allows the creation of a new accommodations belonging to the user.

<aside class="warning">
Warning: As the subscription price depends of the number of accomodations, then adding a new accomodation can increase the price paid by the user.
</aside>

### HTTP Request

`POST https://api.chekin.io/api/v1/housings/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
tradename | true | Give a name to the property.
rta_number | true | Turism identifier provided by spanish government.
address | true | Full address of the accommodation.
province | true | ID of the province to which the accommodation belongs. List of provinces can be GET at https://api.chekin.io/api/v1/housings/provinces/
municipality | true | Municipality to which the accommodation belongs. 
legal_holder_name | true | Full name of the legal holder of the accommodation. 
legal_holder_nif | true | NIF number of the legal holder of the accommodation.
legal_holder_phone | false | The phone number of the legal holder of the accommodation.
police_type | false | Police type and police credentials are required if you want the guests data to be automatically sent to the police. Police type must take one of the following values: POL (Policía Nacional), NAT (Guardia Civil), ERT (Ertzaintza), MOS (Mossos d'Esquadra)
police_user | false | The username used to do login in the police website.
police_password | false | The password used to do login in the police website.
is_housing_group | false | Used only if police type is POL. Set it to true only if the accommodation is registered at the police as part of a Group.
police_hostelry_code | false | Used only if is_housing_group is true. Hostelry code given by the police to this accommodation. A list of available codes for this police user can be retrieved doing a GET to https://api.chekin.io/api/v1/housings/police_hostelry_codes 
legal_age | false | Default is 16 yeard old.
rooms_qty | false | Required for hotels only.
max_capacity | false | Required for hostels or camping only.
airbnb_ics_url | false | If set, CheKin will import new Bookings every 30 minutes from the provided calendar url.
booking_ics_url | false | If set, CheKin will import new Bookings every 30 minutes from the provided calendar url.
avantio_ics_url | false | If set, CheKin will import new Bookings every 30 minutes from the provided calendar url.

<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>


## Delete a Specific Accomodation


```shell
curl "https://api.chekin.io/api/v1/housings/1073"
  -X DELETE
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```

This endpoint deletes a specific accommodation and all its related data.

<aside class="warning">
Warning: This action will delete the accomodation and also all the realted info like checkins, documentation, police part files and books of parts. This action is unrecoverable. The user will receive an email with a last backup of his documentation and it'll be deleted after that.
</aside>

### HTTP Request

`DELETE https://api.chekin.io/api/v1/housings/<ID>`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | The ID of the accommodation to delete


# Reservations

## Get All reservations


```shell
curl -X GET \
  https://api.chekin.io/api/v1/checkins/bookings \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```


> The above command returns JSON structured like this:

```json
[
    [
    {
        "id": 4451,
        "created": "2018-10-29T11:14:52.242486Z",
        "created_by": null,
        "updated_by": null,
        "source_name": "",
        "assigned_user": 431,
        "assigned_user_name": "John",
        "housing": 267,
        "housing_tradename": "House Huelva 1",
        "guest_name": null,
        "guest_phone": null,
        "guest_email": null,
        "checkin_date": "2018-10-29",
        "checkin_date_spa": "29-10-2018",
        "checkin_time": "00:00:00",
        "checkout_date": "2018-10-30",
        "nights": 1,
        "total_guests_qty": 2,
        "adults_qty": 1,
        "price": "127.60",
        "status": "NEW",
        "status_display": "Nuevo",
        "status_details": "",
        "is_contract_required": true
    },
    {
        "id": 4081,
        "created": "2018-10-03T21:03:32.518587Z",
        "created_by": 431,
        "updated_by": 431,
        "source_name": "",
        "assigned_user": 431,
        "assigned_user_name": "Peter",
        "housing": 267,
        "housing_tradename": "House Huelva 2",
        "guest_name": null,
        "guest_phone": "+4456222526",
        "guest_email": null,
        "checkin_date": "2018-10-03",
        "checkin_date_spa": "03-10-2018",
        "checkin_time": "19:07:00",
        "checkout_date": "2018-10-05",
        "nights": 2,
        "total_guests_qty": 2,
        "adults_qty": 2,
        "price": "110.00",
        "status": "COM",
        "status_display": "Verificación policial completada",
        "status_details": "Todos los check-ins han sido verificados correctamente",
        "is_contract_required": true
    },
]
```

This endpoint retrieves all the reservations belonging the accommodations managed by this user.

### HTTP Request

`GET https://api.chekin.io/api/v1/checkins/bookings`

<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>




## Get a Specific reservation


```shell
curl -X GET \
  https://test.chekin.io/api/v1/checkins/bookings/4081 \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
```


> The above command returns JSON structured like this:

```json
{
      "id": 4081,
      "created": "2018-10-03T21:03:32.518587Z",
      "created_by": 431,
      "updated_by": 431,
      "source_name": "",
      "assigned_user": 431,
      "assigned_user_name": "Peter",
      "housing": 267,
      "housing_tradename": "House Huelva 2",
      "guest_name": null,
      "guest_phone": "+4456222526",
      "guest_email": null,
      "checkin_date": "2018-10-03",
      "checkin_date_spa": "03-10-2018",
      "checkin_time": "19:07:00",
      "checkout_date": "2018-10-05",
      "nights": 2,
      "total_guests_qty": 2,
      "adults_qty": 2,
      "price": "110.00",
      "status": "COM",
      "status_display": "Verificación policial completada",
      "status_details": "Todos los check-ins han sido verificados correctamente",
      "is_contract_required": true
  }
```

This endpoint retrieves details on a specific reservation.

### HTTP Request

`GET https://test.chekin.io/api/v1/checkins/bookings/<ID>`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | The ID of the accommodation to retrieve


## Create a new reservation


```shell
curl -X POST \
  https://api.chekin.io/api/v1/checkins/bookings \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data;' \
  -F housing=267 \
  -F 'guest_name=Juan Perez' \
  -F 'guest_phone=+3326551515' \
  -F guest_email=juamperez@domain.com \
  -F checkin_date=2018-04-18 \
  -F checkin_time=14:00 \
  -F checkout_date=2018-04-20 \
  -F total_guests_qty=2 \
  -F adults_qty=1 \
  -F is_contract_required=true \
  -F price=300
```


> The above command returns JSON structured like this:

```json
{
    "id": 4452,
    "created": "2018-10-29T20:18:34.277503Z",
    "created_by": 431,
    "updated_by": null,
    "source_name": "",
    "assigned_user": 431,
    "assigned_user_name": "Mariano",
    "housing": 267,
    "housing_tradename": "Test chk 1",
    "guest_name": "Juan Perez",
    "guest_phone": "+3326551515",
    "guest_email": "juanperez1234@domain.com",
    "checkin_date": "2018-04-18",
    "checkin_date_spa": "18-04-2018",
    "checkin_time": "14:00:00",
    "checkout_date": "2018-04-20",
    "nights": 2,
    "total_guests_qty": 2,
    "adults_qty": 1,
    "price": "300.00",
    "status": "NEW",
    "status_display": "Nuevo",
    "status_details": "",
    "is_contract_required": true
}
```

This endpoint allows the creation of a new Reservations. New reservations are assigned to the user making the request by default, but can be assigned to collaborator users setting the parameter assigned_user.

### HTTP Request

`POST https://api.chekin.io/api/v1/checkins/bookings`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
housing | true | It must be the ID of an accommodation managed by this user.
assigned_user | false | usser ID of a valid collaborator of this user. If set, the reservation will be assigned to the collaborator, else will be assigned to the property manager by default.
guest_name | false | The name of the guest that made the reservation.
guest_phone | false | The phone of the guest that made the reservation.
checkin_date | true | The arrival date in format YYYY-MM-DD, i.e. 2018-12-30
checkin_time | true | The arrival time in format HH:MM, i.e. 14:00
checkout_date | true | The departure date in format YYYY-MM-DD, i.e. 2019-01-10
total_guests_qty | true | The total quantity of persons expected, as an integer number.
adults_qty | true | The number of adults among all the guests, as an integer number. In Spain, only adults need to be registered at the police.
price | false | The price paid by the guests for the accommodation.
is_contract_required | false | If set to false, CheKin won't generate the contract document for the reservation. true is set by default.

<aside class="success">
Remember — you need to send the authentication headers with API Key and User Token!
</aside>


## Delete a Specific Reservations


```shell
curl "https://api.chekin.io/api/v1/checkins/bookings/4452"
  -X DELETE
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data;' \
```

This endpoint deletes a specific reservation and all its related data.

<aside class="warning">
Warning: This action will delete the accomodation and also all the related info like checkins, documentation, police part files and books of parts. This action is unrecoverable and there is no backup.
</aside>

### HTTP Request

`DELETE https://api.chekin.io/api/v1/checkins/bookings/<ID>`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | The ID of the reservation to delete
