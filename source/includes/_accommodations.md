
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
        "legal_holder_name": "Jose Antoño Perez Gonzales",
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
        "legal_holder_name": "Juan Pablo Martínez García",
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
  -H 'content-type: multipart/form-data;' \
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

## Update an accommodation

This endpoint updates details on a specific accommodation.

```shell
curl -X PUT \
  https://api.chekin.io/api/v1/housings/1073 \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data;' \
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


curl -X PATCH \
  https://api.chekin.io/api/v1/housings/1073 \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data;' \
  -F 'address=New address 123'
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

### Full update vs Partial update
You can use PUT verb to update all the fields of an accommodation, or PATCH verb to update a subset of fields.

### HTTP Request - Full update

`PUT https://api.chekin.io/api/v1/housings/`


### HTTP Request - Partial update

`PATCH https://api.chekin.io/api/v1/housings/`



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


## Accomodation Picture

This endpoint uploads a picture or image of the accommodation, that is shown in CheKin App.


```shell
curl -X POST \
  https://api.chekin.io/api/v1/housings/image \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data;' \
  -F housing=352 \
  -F 'image_file=@/your/local/path/my_house.png'
```

> The above command returns JSON structured like this:

```json
{
    "housing": 1073,
    "image_file_permalink": "https://public_url_for_the_picture"
}
```

### HTTP Request

`POST https://api.chekin.io/api/v1/housings/image`

<aside class="warning">
Warning: The content type for this request must be multipart/form-data. JSON isn't accepted in file uploads.
</aside>


### Body Parameters

Parameter | Required | Description
--------- | -------- | -----------
id | true | The ID of the accommodation.
image_file | true | A .png or .jpg file with a picture or image that represents the accomodation.


### Changing the picture

Call this endpoint again with a new file, and the pre-existing picture will be replaced.


## Accomodation Signature

This endpoint uploads a picture with a handwritten signature for a specific accommodation, to be used in contracts and documentation generated by CheKin.
The signature files are stored securely and encrypted.


```shell
curl -X POST \
  https://api.chekin.io/api/v1/housings/signature \
  -H 'Api-Key: yourApiKeyhere' \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'content-type: multipart/form-data;' \
  -F housing=352 \
  -F 'signature_file=@/your/local/path/signature_file.png'
```

> The above command returns JSON structured like this:

```json
{
    "housing": 1073,
    "signature_file": "https://a_secure_url_to_access_the_file"
}
```

### HTTP Request

`POST https://api.chekin.io/api/v1/housings/signature`

<aside class="warning">
Warning: The content type for this request must be multipart/form-data. JSON isn't accepted in file uploads.
</aside>


### Body Parameters

Parameter | Required | Description
--------- | -------- | -----------
id | true | The ID of the accommodation for which the signature will be used.
signature_file | true | A .png file with the handwritten signature and transparent background.


### Changing the signature

Call this endpoint again with a new file, and the pre-existing signature will be replaced.
