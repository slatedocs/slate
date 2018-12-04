# Police Registration Service


## Register a Guest


```shell
curl -X POST \
  https://api.chekin.io/api/v1/tools/police/register/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json' \
  -d '{
        "police_type": "POL",
        "police_user": "H41811AAXQU",
        "police_password": "APARTAMENTOA2017",
        "test_mode": true,
        "check_in_date": "2019-02-22",
        "nights_of_stay": 2,
        "name": "Mariano",
        "first_surname": "Martinez",
        "second_surname": "Grasso",
        "doc_type": "D",
        "doc_number": "25698412S",
        "doc_issue_date": "2012-12-14",
        "sex": "M",
        "nationality": "ESP",
        "birth_date": "1987-07-20",
        "generate_receipt": true,
        "accommodation_nif": "77552368S",
        "accommodation_name": "Carlos Homes",
        "accommodation_province": "Sevilla",
        "accommodation_city": "Huelva",
        "receipt_signature": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAABHNCSVQICAgIfAhkiAAABERJREFUeAHtmk1S2zAYhj85XXVDMrAnPQHpCTDLhgXuCZqeAHoChhOQG+DewF1Al7g34Aake5jAqmyQ+kqJSWASkD35EeNXMxr/RD+fnlc/n+SIMJAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACZAACYRAQPkYkZzfZCJqVz5Gn7K91p1PHqapRiDyyqakKTY+SMcrPRNVJuAniKiBq8FoClIZtV9GP0GMjAXBKGFYKgE/QaIod1YoEy/VGhYufoJIMULUDpktl4CXl2VNSC5urXe1IQqe1pfWwL5bR0h+D9vKyPa8uo2R+2y/dTXv99Dff/A20JhclDoQ/RgjT+qdr2JCB17LjongSBhMlUZZTw/3WsxrZaKLofPYFAMkzCWKTtbZgV4zddZv/oIolaOAA4gS45oiLjRYAURrlO/gQwDdNHb8Ovq4mYzle7ycPwJGwtmptY08PZTTwz7qe7a/lS7U4CUVNmnmGxU4YEZfA9Bdtr/ZeiO518/J+bAjSn9D4gSx/SLTPUZGDiWuIBJi4w49Hc9+YVz2EVLb8qFh9Pk9TGXegtg2Jee3A/S6bbTua9bdyuy7siG5HDbVw+OB0eoIZXWm8qPnS+ZEiBr5oqYZTF99lHuIcn9hlCRT9QV5W06Qi9sjtOIUguQQZK9Mi8ZT0jHyJBCiOc5rRUjhKGRlen+petEB5J8eujxrdkh87C4nyKhxAxS8gfgj627a3vdqeBLCzudPwfzB1Jeual7HKElRtZ26vGx+MnMNN777EGfa6GDR9MZ2nmIKO5xnM4SIk4ubSyyq1xgRRZ6fzm3ubsWrEsPZ59Yi3FlvLfBQaoQUbYHX0oO3dTZ+tutKqgx280bgGekY13hqfSimpf6i1oXCDt/rMhwS37rLpqskiK0EvT/B3qAP8FjkZwQjf/E2xZF9P4Qj+1A2tjNIPXvlvw95lg3u0MjLypwwYvcmpuOSGOxXcPaVdf1d1BdFL+nR7l3wTUekjThADDJUFqRoTSFM8RzuFfsZkV1sPmNcc8QgQ6lFPcgW+BqFDa1v0nWmq48g7+QTQn0EWWe3L1E3BSkBaxVJayPI5GjGeVqrYFupjtoIUonOGjLVS5DRZhWn1jj2DzTUSxBV7D90Eqge3n9yCNX+cnapKHUZlBzjYPQsxJFS+SyrHIlwUr84GMWJDzaM9oukwZ8Bo6kjFY0jFmWaYhonq/zSWDtBbNcYn/4eQQz7sWz24eikD630G0otBZmwhjj2o5v9z7J+bOPwEbEIBiOmMZi4y8V7XkmABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABEiABN4Hgf9R1jRAiigWLAAAAABJRU5ErkJggg=="
    }
    '
```


> The above command returns JSON structured like this:

```json
  {
      "id": 1524,
      "created": "2018-12-01T03:42:21.659258Z",
      "status": "NEW",
      "status_display": "Nuevo",
      "status_details": "",
      "police_type": "POL",
      "police_user": "H41811AAXQU",
      "guest_type": null,
      "name": "MARIANO",
      "first_surname": "MARTINEZ",
      "second_surname": "GRASSO",
      "sex": "M",
      "nationality": "ESP",
      "birth_date": "1987-07-20",
      "birth_place": null,
      "doc_type": "D",
      "doc_number": "25698412S",
      "doc_issue_date": "2012-12-14",
      "doc_isue_place": null,
      "check_in_date": "2019-02-22",
      "nights_of_stay": 2,
      "generate_receipt": true,
      "accommodation_nif": "77552368S",
      "accommodation_name": "Carlos Homes",
      "accommodation_province": "Sevilla",
      "accommodation_city": "Huelva",
      "receipt_url": ""
  }
```

This endpoint sends the guests data to the police.
Optionally, the registration receipt can be generated.
The police registration runs asynchronously, then on this first call the registration will be triggered and you will get a status "NEW".
You will need to do a second call later to check the status until it is "COM" (completion time can be 5-10 seconds).


### HTTP Request

`POST https://api.chekin.io/api/v1/tools/police/register/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
test_mode | false | false by default. If it's set to true, then the data isn't sent to the police, but you will get the same answer as in a successful registration.
police_type | false | Police type and police credentials are required to send the guests data to the police. Police type must take one of the following values: POL (Policía Nacional), NAT (Guardia Civil), ERT (Ertzaintza), MOS (Mossos d'Esquadra), ISP (Italian State Police).
police_user | false | The username used to do login in the police website.
police_password | false | The password used to do login in the police website.
is_housing_group | false | Used only if police type is POL. Set it to true only if the accommodation is registered at the police as part of a Group.
police_hostelry_code | false | Used only if is_housing_group is true. Hostelry code given by the police to this accommodation. A list of available codes for this police user can be retrieved doing a GET to https://api.chekin.io/api/v1/housings/police_hostelry_codes
check_in_date | true | The arrival date in format YYYY-MM-DD, i.e. 2018-12-30
nights_of_stay | true | The number of nights of the stay as an integer, i.e. 3
doc_type | true | Doc types depends on the country. See Doc Types Table below.  
doc_number | true | An alpha-numeric string shown in the identification document.
sex | true | "F" (Female) / "M" (Male) 
name | true | The guest's name/s.
first_surname | true | The guest's first surname
second_surname | false | The guest's seconds surname. Only required for spanish people.
doc_issue_date | true | The issue date of the identification document in format YYYY-MM-DD, i.e. 2010-11-23
birth_date | true | The guest's birth date in format YYYY-MM-DD, i.e. 1982-10-15
nationality | true | Country code in ISO 3-letters format, i.e. ESP (Spain) / DEU (Germany) / ITA (Italy)
generate_receipt | false | true by default. If set to false, the registration receipt won't be generated.
accommodation_nif | false | NIF number of the legal holder of the accommodation, to be used in the receipt if generate_receipt is true.
accommodation_name | false | The property name, to be used in the receipt if generate_receipt is true.
accommodation_province | false | The name of teh province where the accommodation is placed, to be used in the receipt if generate_receipt is true.
accommodation_city | false | The name of the city where the accommodation is placed, to be used in the receipt if generate_receipt is true.
receipt_signature | false | The guest signature, base64 encoded, to be used in the receipt if generate_receipt is true.




### Doc types in Spain
value | Description
----- | -----------
"P" | Passport.
"D"| Spanish ID, called DNI.
"X"| Spanish Residence permission.
"I"| European ID.


### Doc types in Italy
Parameter | Required | Description
--------- | -------- | -----------
Comming soon. | 

### Doc types in Portugal
Parameter | Required | Description
--------- | -------- | -----------
Comming soon. | 

<aside class="success">
Remember — you need to send the authentication headers with User Token!
</aside>


## Get Registration status & Receipt

```shell
curl -X GET \
  https://api.chekin.io/api/v1/tools/police/register/1524/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
    {
        "id": 1524,
        "created": "2018-11-30T14:51:36.026016Z",
        "status": "COM",
        "status_display": "Verificación policial completada con éxito.",
        "status_details": "",
        "police_type": "POL",
        "police_user": "H41811AAXQU",
        "guest_type": null,
        "name": "MARIANO",
        "first_surname": "MARTINEZ",
        "second_surname": "GRASSO",
        "sex": "M",
        "nationality": "ESP",
        "birth_date": "1987-07-20",
        "birth_place": null,
        "doc_type": "D",
        "doc_number": "25698412S",
        "doc_issue_date": "2012-12-14",
        "doc_isue_place": null,
        "check_in_date": "2019-02-22",
        "nights_of_stay": 2,
        "generate_receipt": true,
        "accommodation_nif": "77552368S",
        "accommodation_name": "Carlos Homes",
        "accommodation_province": "Sevilla",
        "accommodation_city": "Huelva",
        "receipt_url": "https://api.chekin.io/lnk/zad3y"
    }
```

This endpoint returns the registration details, including the status and a link to download the receipt (if the registration was triggered with parameter generate_receipt = true).

The receipts will be deleted in 3 days, unless you have hired the documentation management service.

### HTTP Request

`GET https://api.chekin.io/api/v1/tools/police/register/<ID>/`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
ID | true | The ID of the registration, obtained previously when registration was triggered.

