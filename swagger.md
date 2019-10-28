---
title: Kudos Client API Reference
language_tabs:
  - shell: curl
  - javascript--nodejs: Node.JS
toc_footers: []
includes: []
search: false
highlight_theme: darkula
headingLevel: 2

---

<h1 id="kudos-client-api-reference">Kudos Client API Reference v1.2.0</h1>

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

This is the Kudos Client API specification.  The Client API is organized around REST. Our API has predictable,
resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like
HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API
responses, including errors.
 
### Timestamps
All timestamps are returned in ISO 8601 format:
```
YYYY-MM-DDTHH:MM:SSZ
```
### Rate limiting
If you're sending too many requests too quickly, we'll send back a 429 error code (Too Many Requests). You are
limited to 1000 requests per hour per token overall.

Base URLs:

* <a href="https://clientapi.kudosnow.com/v1">https://clientapi.kudosnow.com/v1</a>

# Authentication

* API Key (APIKeyHeader)
    - Parameter Name: **apikey**, in: header. Authenticate your account when using the API by including your private API key in the request. You can
manage your API keys from your [Admin Account](/admin/api). Your API keys carry many privileges, so be
sure to keep them secret! Do not share your private API keys in publicly accessible areas such GitHub,
client-side code, etc.

* API Key (APIKeyQueryParam)
    - Parameter Name: **apikey**, in: query. 

<h1 id="kudos-client-api-reference-default">Default</h1>

## giveKudos

<a id="opIdgiveKudos"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://clientapi.kudosnow.com/v1/kudos \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'apikey: API_KEY'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "sender": {
    "kind": "email",
    "value": "string"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "string"
    }
  ],
  "message": {
    "body": "string"
  },
  "level": "thank_you",
  "badge_name": "string",
  "points": 0,
  "qualities": [
    {
      "kind": "name",
      "value": "string"
    }
  ]
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'apikey':'API_KEY'

};

fetch('https://clientapi.kudosnow.com/v1/kudos',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

`POST /kudos`

Create a Kudos message.

> Body parameter

```json
{
  "sender": {
    "kind": "email",
    "value": "string"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "string"
    }
  ],
  "message": {
    "body": "string"
  },
  "level": "thank_you",
  "badge_name": "string",
  "points": 0,
  "qualities": [
    {
      "kind": "name",
      "value": "string"
    }
  ]
}
```

<h3 id="givekudos-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[Kudos](#schemakudos)|true|Kudos message|

> Example responses

> 200 Response

```json
{
  "data": [
    {
      "sender": {
        "kind": "email",
        "value": "string"
      },
      "recipients": [
        {
          "kind": "email",
          "value": "string"
        }
      ],
      "message": {
        "body": "string"
      },
      "level": "thank_you",
      "badge_name": "string",
      "points": 0,
      "qualities": [
        {
          "kind": "name",
          "value": "string"
        }
      ]
    }
  ]
}
```

<h3 id="givekudos-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="givekudos-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» data|[[Kudos](#schemakudos)]|false|none|none|
|»» sender|[UserReference](#schemauserreference)|true|none|none|
|»»» kind|string|true|none|none|
|»»» value|string|true|none|none|
|»» recipients|[[UserReference](#schemauserreference)]|true|none|none|
|»» message|[Message](#schemamessage)|true|none|none|
|»»» body|string|true|none|none|
|»» level|[Level](#schemalevel)|true|none|none|
|»» badge_name|[BadgeName](#schemabadgename)|false|none|none|
|»» points|[Points](#schemapoints)|false|none|none|
|»» qualities|[[QualityReference](#schemaqualityreference)]|true|none|none|
|»»» kind|string|true|none|none|
|»»» value|string|true|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|kind|email|
|kind|group_name|
|level|thank_you|
|level|good_job|
|level|impressive|
|level|exceptional|
|level|award|
|kind|name|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
APIKeyHeader, APIKeyQueryParam
</aside>

## lookUpUser

<a id="opIdlookUpUser"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://clientapi.kudosnow.com/v1/users/lookup \
  -H 'Accept: application/json' \
  -H 'apikey: API_KEY'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'apikey':'API_KEY'

};

fetch('https://clientapi.kudosnow.com/v1/users/lookup',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

`GET /users/lookup`

Get user information.

<h3 id="lookupuser-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|email|query|string|false|Users email|
|employeeNumber|query|string|false|Employee Number|

> Example responses

> 200 Response

```json
{
  "data": {
    "id": 0,
    "email": "string",
    "pointsBalance": 0,
    "employeeNumber": "string"
  }
}
```

<h3 id="lookupuser-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="lookupuser-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» data|[User](#schemauser)|false|none|none|
|»» id|integer|false|none|none|
|»» email|string|false|none|none|
|»» pointsBalance|[Points](#schemapoints)|false|none|none|
|»» employeeNumber|string|false|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
APIKeyHeader, APIKeyQueryParam
</aside>

## redemptionHistory

<a id="opIdredemptionHistory"></a>

> Code samples

```shell
# You can also use wget
curl -X GET https://clientapi.kudosnow.com/v1/redemptions \
  -H 'Accept: application/json' \
  -H 'apikey: API_KEY'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'apikey':'API_KEY'

};

fetch('https://clientapi.kudosnow.com/v1/redemptions',
{
  method: 'GET',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

`GET /redemptions`

Get a users redemptions history

<h3 id="redemptionhistory-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|userId|query|integer|false|User Id|
|page|query|integer|false|Page number|
|perPage|query|integer|false|Count of items per page (15 by default)|

> Example responses

> 200 Response

```json
{
  "data": {
    "page": 0,
    "totalCount": 0,
    "data": [
      {
        "id": 0,
        "cancellationDate": "2019-10-28",
        "createdBy": 0,
        "rewardId": "string",
        "name": "string",
        "description": "string",
        "kudosPoints": 0,
        "currencyCode": "string",
        "amountInCents": 0,
        "transactionId": "string",
        "userId": "string",
        "orderId": "string",
        "notes": "string",
        "createdAt": "2019-10-28",
        "updatedAt": "2019-10-28"
      }
    ]
  }
}
```

<h3 id="redemptionhistory-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="redemptionhistory-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» data|[RedemptionsHistory](#schemaredemptionshistory)|false|none|none|
|»» page|integer|true|none|none|
|»» totalCount|integer|true|none|none|
|»» data|[[Redemption](#schemaredemption)]|true|none|none|
|»»» id|integer|true|none|none|
|»»» cancellationDate|string(date)|false|none|none|
|»»» createdBy|integer|true|none|none|
|»»» rewardId|string|true|none|none|
|»»» name|string|true|none|none|
|»»» description|string|true|none|none|
|»»» kudosPoints|integer|true|none|none|
|»»» currencyCode|string|true|none|none|
|»»» amountInCents|integer|true|none|none|
|»»» transactionId|string|true|none|none|
|»»» userId|string|true|none|none|
|»»» orderId|string|true|none|none|
|»»» notes|string|false|none|none|
|»»» createdAt|string(date)|true|none|none|
|»»» updatedAt|string(date)|true|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
APIKeyHeader, APIKeyQueryParam
</aside>

## redeemReward

<a id="opIdredeemReward"></a>

> Code samples

```shell
# You can also use wget
curl -X POST https://clientapi.kudosnow.com/v1/redemptions \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'apikey: API_KEY'

```

```javascript--nodejs
const fetch = require('node-fetch');
const inputBody = '{
  "userId": 0,
  "senderId": 0,
  "rewardId": "string",
  "name": "string",
  "description": "string",
  "kudosPoints": 0,
  "currencyCode": "USD",
  "amountInCents": 0,
  "transactionId": "string",
  "orderId": "string",
  "notes": "string"
}';
const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'apikey':'API_KEY'

};

fetch('https://clientapi.kudosnow.com/v1/redemptions',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

`POST /redemptions`

Redeem a reward

> Body parameter

```json
{
  "userId": 0,
  "senderId": 0,
  "rewardId": "string",
  "name": "string",
  "description": "string",
  "kudosPoints": 0,
  "currencyCode": "USD",
  "amountInCents": 0,
  "transactionId": "string",
  "orderId": "string",
  "notes": "string"
}
```

<h3 id="redeemreward-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateRedemption](#schemacreateredemption)|true|Redeem a reward body|

> Example responses

> 200 Response

```json
{
  "data": {
    "id": 0,
    "cancellationDate": "2019-10-28",
    "createdBy": 0,
    "rewardId": "string",
    "name": "string",
    "description": "string",
    "kudosPoints": 0,
    "currencyCode": "string",
    "amountInCents": 0,
    "transactionId": "string",
    "userId": "string",
    "orderId": "string",
    "notes": "string",
    "createdAt": "2019-10-28",
    "updatedAt": "2019-10-28"
  }
}
```

<h3 id="redeemreward-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="redeemreward-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» data|[Redemption](#schemaredemption)|false|none|none|
|»» id|integer|true|none|none|
|»» cancellationDate|string(date)|false|none|none|
|»» createdBy|integer|true|none|none|
|»» rewardId|string|true|none|none|
|»» name|string|true|none|none|
|»» description|string|true|none|none|
|»» kudosPoints|integer|true|none|none|
|»» currencyCode|string|true|none|none|
|»» amountInCents|integer|true|none|none|
|»» transactionId|string|true|none|none|
|»» userId|string|true|none|none|
|»» orderId|string|true|none|none|
|»» notes|string|false|none|none|
|»» createdAt|string(date)|true|none|none|
|»» updatedAt|string(date)|true|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
APIKeyHeader, APIKeyQueryParam
</aside>

## cancelRedemption

<a id="opIdcancelRedemption"></a>

> Code samples

```shell
# You can also use wget
curl -X DELETE https://clientapi.kudosnow.com/v1/redemptions/{id}?userId=0&senderId=0 \
  -H 'Accept: application/json' \
  -H 'apikey: API_KEY'

```

```javascript--nodejs
const fetch = require('node-fetch');

const headers = {
  'Accept':'application/json',
  'apikey':'API_KEY'

};

fetch('https://clientapi.kudosnow.com/v1/redemptions/{id}?userId=0&senderId=0',
{
  method: 'DELETE',

  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});

```

`DELETE /redemptions/{id}`

Cancel a redemption

<h3 id="cancelredemption-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|integer|true|Redemption ID|
|userId|query|integer|userId|User ID|
|senderId|query|integer|senderId|Sender ID|

> Example responses

> 200 Response

```json
{
  "data": {
    "id": 0,
    "cancellationDate": "2019-10-28",
    "createdBy": 0,
    "rewardId": "string",
    "name": "string",
    "description": "string",
    "kudosPoints": 0,
    "currencyCode": "string",
    "amountInCents": 0,
    "transactionId": "string",
    "userId": "string",
    "orderId": "string",
    "notes": "string",
    "createdAt": "2019-10-28",
    "updatedAt": "2019-10-28"
  }
}
```

<h3 id="cancelredemption-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="cancelredemption-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» data|[Redemption](#schemaredemption)|false|none|none|
|»» id|integer|true|none|none|
|»» cancellationDate|string(date)|false|none|none|
|»» createdBy|integer|true|none|none|
|»» rewardId|string|true|none|none|
|»» name|string|true|none|none|
|»» description|string|true|none|none|
|»» kudosPoints|integer|true|none|none|
|»» currencyCode|string|true|none|none|
|»» amountInCents|integer|true|none|none|
|»» transactionId|string|true|none|none|
|»» userId|string|true|none|none|
|»» orderId|string|true|none|none|
|»» notes|string|false|none|none|
|»» createdAt|string(date)|true|none|none|
|»» updatedAt|string(date)|true|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
APIKeyHeader, APIKeyQueryParam
</aside>

# Schemas

<h2 id="tocSkudos">Kudos</h2>

<a id="schemakudos"></a>

```json
{
  "sender": {
    "kind": "email",
    "value": "string"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "string"
    }
  ],
  "message": {
    "body": "string"
  },
  "level": "thank_you",
  "badge_name": "string",
  "points": 0,
  "qualities": [
    {
      "kind": "name",
      "value": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|sender|[UserReference](#schemauserreference)|true|none|none|
|recipients|[[UserReference](#schemauserreference)]|true|none|none|
|message|[Message](#schemamessage)|true|none|none|
|level|[Level](#schemalevel)|true|none|none|
|badge_name|[BadgeName](#schemabadgename)|false|none|none|
|points|[Points](#schemapoints)|false|none|none|
|qualities|[[QualityReference](#schemaqualityreference)]|true|none|none|

<h2 id="tocSlevel">Level</h2>

<a id="schemalevel"></a>

```json
"thank_you"

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|*anonymous*|thank_you|
|*anonymous*|good_job|
|*anonymous*|impressive|
|*anonymous*|exceptional|
|*anonymous*|award|

<h2 id="tocSmessage">Message</h2>

<a id="schemamessage"></a>

```json
{
  "body": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|body|string|true|none|none|

<h2 id="tocSqualityreference">QualityReference</h2>

<a id="schemaqualityreference"></a>

```json
{
  "kind": "name",
  "value": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|kind|string|true|none|none|
|value|string|true|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|kind|name|

<h2 id="tocSuserreference">UserReference</h2>

<a id="schemauserreference"></a>

```json
{
  "kind": "email",
  "value": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|kind|string|true|none|none|
|value|string|true|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|kind|email|
|kind|group_name|

<h2 id="tocSbadgename">BadgeName</h2>

<a id="schemabadgename"></a>

```json
"string"

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|string|false|none|none|

<h2 id="tocSpoints">Points</h2>

<a id="schemapoints"></a>

```json
0

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|integer|false|none|none|

<h2 id="tocSuser">User</h2>

<a id="schemauser"></a>

```json
{
  "id": 0,
  "email": "string",
  "pointsBalance": 0,
  "employeeNumber": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|email|string|false|none|none|
|pointsBalance|[Points](#schemapoints)|false|none|none|
|employeeNumber|string|false|none|none|

<h2 id="tocScreateredemption">CreateRedemption</h2>

<a id="schemacreateredemption"></a>

```json
{
  "userId": 0,
  "senderId": 0,
  "rewardId": "string",
  "name": "string",
  "description": "string",
  "kudosPoints": 0,
  "currencyCode": "USD",
  "amountInCents": 0,
  "transactionId": "string",
  "orderId": "string",
  "notes": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|userId|integer|true|none|none|
|senderId|integer|true|none|none|
|rewardId|string|true|none|none|
|name|string|true|none|none|
|description|string|false|none|none|
|kudosPoints|integer|true|none|none|
|currencyCode|string|false|none|none|
|amountInCents|integer|true|none|none|
|transactionId|string|true|none|none|
|orderId|string|true|none|none|
|notes|string|false|none|none|

<h2 id="tocSredemptionshistory">RedemptionsHistory</h2>

<a id="schemaredemptionshistory"></a>

```json
{
  "page": 0,
  "totalCount": 0,
  "data": [
    {
      "id": 0,
      "cancellationDate": "2019-10-28",
      "createdBy": 0,
      "rewardId": "string",
      "name": "string",
      "description": "string",
      "kudosPoints": 0,
      "currencyCode": "string",
      "amountInCents": 0,
      "transactionId": "string",
      "userId": "string",
      "orderId": "string",
      "notes": "string",
      "createdAt": "2019-10-28",
      "updatedAt": "2019-10-28"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|page|integer|true|none|none|
|totalCount|integer|true|none|none|
|data|[Redemptions](#schemaredemptions)|true|none|none|

<h2 id="tocSredemptions">Redemptions</h2>

<a id="schemaredemptions"></a>

```json
[
  {
    "id": 0,
    "cancellationDate": "2019-10-28",
    "createdBy": 0,
    "rewardId": "string",
    "name": "string",
    "description": "string",
    "kudosPoints": 0,
    "currencyCode": "string",
    "amountInCents": 0,
    "transactionId": "string",
    "userId": "string",
    "orderId": "string",
    "notes": "string",
    "createdAt": "2019-10-28",
    "updatedAt": "2019-10-28"
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Redemption](#schemaredemption)]|false|none|none|

<h2 id="tocSredemption">Redemption</h2>

<a id="schemaredemption"></a>

```json
{
  "id": 0,
  "cancellationDate": "2019-10-28",
  "createdBy": 0,
  "rewardId": "string",
  "name": "string",
  "description": "string",
  "kudosPoints": 0,
  "currencyCode": "string",
  "amountInCents": 0,
  "transactionId": "string",
  "userId": "string",
  "orderId": "string",
  "notes": "string",
  "createdAt": "2019-10-28",
  "updatedAt": "2019-10-28"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|true|none|none|
|cancellationDate|string(date)|false|none|none|
|createdBy|integer|true|none|none|
|rewardId|string|true|none|none|
|name|string|true|none|none|
|description|string|true|none|none|
|kudosPoints|integer|true|none|none|
|currencyCode|string|true|none|none|
|amountInCents|integer|true|none|none|
|transactionId|string|true|none|none|
|userId|string|true|none|none|
|orderId|string|true|none|none|
|notes|string|false|none|none|
|createdAt|string(date)|true|none|none|
|updatedAt|string(date)|true|none|none|

