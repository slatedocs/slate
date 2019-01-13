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

We currently support Spain and Portugal polices. More countries coming soon!

Optionally, the registration receipt can be generated.
The police registration runs asynchronously, then on this first call the registration will be triggered and you will get a status "NEW".
You will need to do a second call later to check the status until it is "COM" (completion time can be 5-10 seconds).

The police don't allow modifying the guests data once they have been registered successfully. 
It also has no problem with changes related to the stay, for example if the number of nights of stay is extended later. 
It is not necessary to inform about that type of changes.


### HTTP Request

`POST https://api.chekin.io/api/v1/tools/police/register/`

### Query Parameters

Parameter | Required | Description
--------- | -------- | -----------
test_mode | false | false by default. If it's set to true, then the data isn't sent to the police, but you will get the same answer as in a successful registration.
police_type | false | Police type and police credentials are required to send the guests data to the police. Police type depends of the country. See police types by country below.
police_user | false | The username used to do login in the police website.
police_password | false | The password used to do login in the police website.
police_cert_password | false | Used for Italy Only. The password of the certificate which is usually the same as the user password.
establishment_num | false | Used for Portugal Only. It's an extra numer provided by the police to do login.
is_housing_group | false | Used only if police type is POL. Set it to true only if the accommodation is registered at the police as part of a Group.
police_hostelry_code | false | Used only if is_housing_group is true. Hostelry code given by the police to this accommodation.
check_in_date | true | The arrival date in format YYYY-MM-DD, i.e. 2018-12-30
nights_of_stay | true | The number of nights of the stay as an integer, i.e. 3
doc_type | true | Doc types depends on the country. See Doc Types Table below.  
doc_number | true | An alpha-numeric string shown in the identification document.
sex | true | "F" (Female) / "M" (Male) 
name | true | The guest's name/s.
first_surname | true | The guest's first surname
second_surname | false | The guest's seconds surname. Only required for spanish people.
doc_issue_date | true | The issue date of the identification document in format YYYY-MM-DD, i.e. 2010-11-23
doc_isue_place | false | Used for Italians in Italy Only. It must be the CODE of one of the Italian cities (see below).
birth_date | true | The guest's birth date in format YYYY-MM-DD, i.e. 1982-10-15
birth_place | false | Used for Italians in Italy Only. It must be the CODE of one of the Italian cities (see below).
nationality | true | Country code in ISO 3-letters format, i.e. ESP (Spain) / DEU (Germany) / ITA (Italy)
generate_receipt | false | true by default. If set to false, the registration receipt won't be generated.
accommodation_nif | false | NIF number of the legal holder of the accommodation, to be used in the receipt if generate_receipt is true.
accommodation_name | false | The property name, to be used in the receipt if generate_receipt is true.
accommodation_province | false | The name of teh province where the accommodation is placed, to be used in the receipt if generate_receipt is true.
accommodation_city | false | The name of the city where the accommodation is placed, to be used in the receipt if generate_receipt is true.
receipt_signature | false | The guest signature, base64 encoded, to be used in the receipt if generate_receipt is true.

### Test Mode
There is a test mode that can be activated setting the attribute test_mode in true. In this mode you can send any police username and any police password, no real login will be attempted and data won't be sen't to the police. You can use it to test the api or to test your integrations.

To make a real registration you will need to get the property owner user and password that they use to login into the police website.  

### Police types in Spain
Police type will set which is the final police organization to which you want to send the data. Remember that there are 4 police forces in Spain:

Value | Description
----- | -----------
"POL" | Data is sent to "Policía Nacional".
"NAT" | Data is sent to "Guardia Civil".
"ERT" | Data is sent to "Ertzaintza".
"MOS" | Data is sent to "Mossos d'Esquadra".


### Police types in Portugal
Police type will set which is the final police organization to which you want to send the data. There is a single police organization in Portugal for this matters:

Value | Description
----- | -----------
"SEF" | Data is sent to "Serviço de Estrangeiros e Fronteiras".


### Police types in Italy
Police type will set which is the final police organization to which you want to send the data. There is a single police organization in Italy:

Value | Description
----- | -----------
"ISP" | Data is sent to "Polizia di Stato".

### Accommodation Group Police Users
The parameter is housing group is optional and it's only used for the police type POL, "Policía Nacional". 
In some cases, when the user has a lot of properties, this police gives to the property owners a user of type "Group User". 
That means that the user has several accommodations inside the same police account. In that case, you will need to send this parameter "is housing group" in true and you will need to provide also an extra "property subcode" in the parameter police_hostelry_code. That subcode, that identifies the property inside the police account, should be asked to the property owner, and it's shown on the police website.

### Doc types in Spain
Value | Description
----- | -----------
"D" | Spanish ID card, called DNI.
"C" | Spanish Driving Licence.
"N" | Spanish residence permission.
"I" | European ID card.
"X" | Foreign residence permission.
"P" | Passport.
 

### Doc types in Portugal
Value | Description
--------- | -----------
"B" | Portugal ID, called "BILHETE DE IDENTIDADE".
"P" | Passport.
"O" | For any other documents, like Foreign IDs.


### Doc types in Italy
There are a lot of document types in Italy. The most common ones are "PASSAPORTO ORDINARIO" (Passports), "CARTA DI IDENTITA'" (ID cards without MRZ code), and "CARTA IDENTITA' ELETTRONICA" (ID cards with MRZ code).

Value | Description
------| -----------
"ACMIL" |	"TESS. APP.TO AG.CUSTODIA"
"ACSOT" |	"TESS. SOTT.LI AG.CUSTODIA"
"ACUFF" |	"TESS. UFF.LI AG.CUSTODIA"
"AMMIL" |	"TESS. MILITARE TRUPPA A.M"
"AMSOT"	| "TESS. SOTTUFFICIALI A.M."
"AMUFF" |	"TESS. UFFICIALI A.M."
"CCMIL" |	"TESS. APP.TO CARABINIERI"
"CCSOT" |	"TESS. SOTTUFFICIALI CC"
"CCUFF" |	"TESS. UFFICIALE"
"CERID" |	"CERTIFICATO D'IDENTITA'"
"CFMIL" |	"TESS. AG. E AG.SC. C.F.S."
"CFSOT" |	"TESS. SOTTUFICIALI C.F.S."
"CFUFF" |	"TESS. UFFICIALI C.F.S."
"CIDIP" |	"CARTA ID. DIPLOMATICA"
"DESIS" |	"TESS. S.I.S.D.E."
"EIMIL" |	"TESS. MILITARE E.I."
"EISOT" |	"TESS. SOTTUFFICIALI E.I."
"EIUFF" |	"TESS. UFFICIALI E.I."
"GFMIL" |	"TESS. APP.TO FINANZIERE"
"GFSOT" |	"TESS. SOTT.LI G.D.F."
"GFTRI" |	"TESS. POL. TRIB. G.D.F."
"GFUFF" |	"TESS. UFFICIALI G.D.F."
"IDELE" |	"CARTA IDENTITA' ELETTRONICA"
"IDENT" |	"CARTA DI IDENTITA'"
"MAGIS" |	"TESS. PERS. MAGISTRATI"
"MMMIL" |	"TESS. MILIT. M.M."
"MMSOT" |	"TESS. SOTTUFICIALI M.M."
"MMUFF" |	"TESS. UFFICIALI M.M."
"PARLA" |	"TESS. PARLAMENTARI"
"PASDI" |	"PASSAPORTO DIPLOMATICO"
"PASOR" |	"PASSAPORTO ORDINARIO"
"PASSE" |	"PASSAPORTO DI SERVIZIO"
"PATEN" |	"PATENTE DI GUIDA"
"PATNA" |	"PATENTE NAUTICA"
"PORM1" |	"PORTO FUCILE USO CACCIA"
"PORM2" |	"PORTO FUCILE DIF. PERSON."
"PORM3" |	"PORTO D'ARMI USO SPORTIVO"
"PORM4" |	"PORTO PISTOLA DIF. PERSON"
"PORM5" |	"PORTO D'ARMI GUARDIE GIUR"
"PPAGE" |	"TESS. AGENTI/ASS.TI P.P."
"PPISP" |	"TESS. ISPETTORI P.P."
"PPSOV" |	"TESS. SOVRINTENDENTI P.P."
"PPUFF" |	"TESS. UFFICIALI P.P."
"PSAPP" |	"TESS. AGENTI/ASS.TI P.S."
"PSFEM" |	"TESS. POLIZIA FEMMINILE"
"PSFUN" |	"TESS. FUNZIONARI P.S."
"PSISP" |	"TESS. ISPETTORI P.S."
"PSSOT" |	"TESS. SOVRINTENDENTI P.S."
"PSUFF" |	"TESS. UFFICIALI P.S."
"RIFUG" |	"TITOLO VIAGGIO RIF.POLIT."
"SDMIL" |	"TESS. MILIT. TRUPPA SISMI"
"SDSOT" |	"TESS. SOTTUFFICIALI SISMI"
"SDUFF" |	"TESS. UFFICIALI SISMI"
"TEAMC" | "TESS. ISCR. ALBO MED/CHI."
"TEAOD" |	"TESS. ISCRIZ. ALBO ODONT."
"TECAM" | "TES. UNICO PER LA CAMERA"
"TECOC" |	"TESS. CORTE DEI CONTI"
"TEDOG" |	"TES.DOGANALE RIL.MIN.FIN."
"TEFSE" | "TESS. FERROV. SENATO"
"TEMPI" |	"TESS. MIN.PUBB.ISTRUZIONE"
"TENAT" |	"TESS. MILITARE NATO"
"TENAV" |	"TES. ENTE NAZ. ASSIS.VOLO"
"TEPOL" |	"TESS.MIN.POLIT.AGRIC.FOR."
"TESAE" |	"TESS. MIN. AFFARI ESTERI"
"TESAR" |	"TESS.ISCR.ALBO ARCHITETTI"
"TESAV" |	"TESSERA ISCR. ALBO AVVOC."
"TESCA" |	"TESS. CORTE D'APPELLO"
"TESCS" |	"TESS. CONSIGLIO DI STATO"
"TESDI" |	"TESSERA RICONOSC. D.I.A."
"TESEA" |	"TESS. MEMBRO EQUIP. AEREO"
"TESIN" | "TESS.ISCR. ALBO INGEGNERI"
"TESLP" |	"TESS. MINISTERO LAVORI PU"
"TESMB" |	"TESS. MIN.BEN.E ATT.CULT."
"TESMD" |	"TESS. MINISTERO DIFESA"
"TESMF" |	"TESS. MINISTERO FINANZE"
"TESMG" |	"TESS. MINISTERO GIUSTIZIA"
"TESMI" |	"TESS. MINISTERO INTERNO"
"TESMN" |	"TESS. MINIST. TRASP/NAVIG"
"TESMS" |	"TESS. MINISTERO SANITA'"
"TESMT" |	"TESS. MINISTERO TESORO"
"TESNO" |	"TESSERA DELL'ORDINE NOTAI"
"TESOG" |	"TESS. ORDINE GIORNALISTI"
"TESPC" |	"TESS. PRES.ZA CONS. MIN."
"TESPI" |	"TESS. PUBBLICA ISTRUZIONE"
"TESPT" |	"TES. POSTE E TELECOMUNIC."
"TESUN" |	"TESSERA U.N.U.C.I."
"TETEL" |	"TESS. IDENTIF.TELECOM IT."
"TFERD" | "TES. FERROVIARIA DEPUTATI"
"TFEXD" |	"TES. FERROV. EX DEPUTATI"
"VIMIL" |	"TESS. APP.TO/VIG. URBANO"
"VISOT" |	"TESS. SOTT.LI VIG. URBANI"
"VIUFF" |	"TESS. UFF.LI VIG.URBANI"
"VVMIL" |	"TESS. APP.TO/VIG. VV.FF."
"VVSOT" |	"TESS. SOTTUFF.LI VV.FF."
"VVUFF" |	"TESS. UFFICIALI VV.FF."

### Italian cities
This field is only required for italians being registered in Italian State Police.
 
You can get the full list of cities and IDs doing the following request:

`GET https://api.chekin.io/api/v1/tools/police/italy/cities/`

The response will be a JSON list of cities with a name and a code. The code must be used in the api.

<aside class="success">
Remember — you need to send the authentication headers with User Token!
</aside>

```shell
curl -X GET \
  https://api.chekin.io/api/v1/tools/police/italy/cities/ \
  -H 'Authorization: Token yourUserTokenHere' \
  -H 'Content-Type: application/json'
```


> The above command returns JSON structured like this:

```json
    [
        {
            "text": "AGLIE'",
            "code": "401001001"
        },
        {
            "text": "AIRASCA",
            "code": "401001002"
        },
        {
            "text": "ALA DI STURA",
            "code": "401001003"
        },
        {
            "text": "ALBIANO D'IVREA",
            "code": "401001004"
        },
        ...
    ]
```



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


### Web Dashboard
You can also manage registers from the dashboard.
You will be able to see a full list of registers, check their status, download receipts, and re-trigger any registration if necessary.

You can access with the user and password used in Sign Up.

[https://tools.chekin.io/login](https://tools.chekin.io/login)


