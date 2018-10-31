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
