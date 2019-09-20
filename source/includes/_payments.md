# Payments
Resources for interacting with payment wallets, bank accounts used for settlement and investors cash balances/tranactions.

<a name="addbankaccountdetails"></a>
## Create a set of bank details.
```http
POST /bankAccountDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
      "accountName": "string",
      "accountNumber": "string",
      "sortCode": "string"
  }

HTTP/1.1 200 OK
Content-Type: application/json

  {
      "id": "string"
  }
```
#### Description
Create a set of bank details.

#### Request
|Type|Name|Description|Schema|
|---|---|---|---|---|
|**Body**|**accountName**  <br>*required*|The name of the account|string|
|**Body**|**accountNumber**  <br>*required*|The account number|string|
|**Body**|**sortCode**  <br>*required*|The sortcode for the account|string|

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|---|
|**Body**|**id**|The id of the newly created account|string|

<a name="updatebankaccountdetails"></a>
## Update a set of bank details.
```http
PUT /bankAccountDetails/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

  {
      "accountName": "string",
      "accountNumber": "string",
      "sortCode": "string"
  }

HTTP/1.1 200 OK
Content-Type: application/json
```
#### Description
Update a set of bank details.

#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|---|
|**Body**|**accountName**  <br>*required*|The name of the account|string|
|**Body**|**accountNumber**  <br>*required*|The account number|string|
|**Body**|**sortCode**  <br>*required*|The sortcode for the account|string|

<a name="getallbankaccountdetails"></a>
## Fetch all bank details.
```http
GET /bankAccountDetails HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

HTTP/1.1 200 OK
Content-Type: application/json

  [
    {
        "accountName": "string",
        "accountNumber": "string",
        "id": "string",
        "sortCode": "string",
        "status": "string"
    },
    {
        "accountName": "string",
        "accountNumber": "string",
        "id": "string",
        "sortCode": "string",
        "status": "string"
     }
  ]

```
#### Description
Fetch a list of bank details.

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|---|
|**Body**|**accountName**|The name of the account|string|
|**Body**|**accountNumber**|The account number|string|
|**Body**|**sortCode**|The sortcode for the account|string|
|**Body**|**id**|The id for the account|string|
|**Body**|**status**|The status for the account (ENABLED, DISABLED).|string|

<a name="getbankaccountdetails"></a>
## Fetch a set of bank details.
```http
GET /bankAccountDetails/{id} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

HTTP/1.1 200 OK
Content-Type: application/json

  {
      "accountName": "string",
      "accountNumber": "string",
      "id": "string",
      "sortCode": "string",
      "status": "string"
  }
```
#### Description
Fetch a set of bank details.

#### Response
|Type|Name|Description|Schema|
|---|---|---|---|---|
|**Body**|**accountName**|The name of the account|string|
|**Body**|**accountNumber**|The account number|string|
|**Body**|**sortCode**|The sortcode for the account|string|
|**Body**|**id**|The id for the account|string|
|**Body**|**status**|The status for the account (ENABLED, DISABLED).|string|