# Definitions

## Kudos

This is an object representing a Kudos message. 
You can send kudos messages with your API Key.
A Kudos message is sent from a user, to one or more users

```javascript
{
  "sender": {
    "kind": "email",
    "value": "sender@example.com"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "receiver@example.com"
    }
  ],
  "message": {
    "body": "You did a good job"
  },
  "level": "good_job",
  "qualities": [
    {
      "kind": "name",
      "value": "Skillful"
    }
  ]
}
```
```shell
{
  "sender": {
    "kind": "email",
    "value": "sender@example.com"
  },
  "recipients": [
    {
      "kind": "email",
      "value": "receiver@example.com"
    }
  ],
  "message": {
    "body": "You did a good job"
  },
  "level": "good_job",
  "qualities": [
    {
      "kind": "name",
      "value": "Skillful"
    }
  ]
}
```

| Attribute | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|sender| The person sending the Kudos message  |Yes|[user](#user)|
|recipients| One or more persons or groups receiving the Kudos message |Yes|\[[user](#user)\]|
|message| The contents of the Kudos message|Yes|[message](#message)|
|level|The level of Kudos given by the message. This enumeration should be one of thank_you, good_job, impressive, exceptional or award|Yes|enum|
|qualities|One or more values or characteristics|Yes|\[[quality](#quality)\]|
|badge_name|If the level of Kudos is award, specify the name of the badge to be attached|No|string|
|points|If the level of Kudos is award, specify a custom point value.  Leave points blank to use the points defined by the badge|No|integer|

## Message

Your message can be either simple, or more descriptive of the specific effort and subsequent outcomes.
At the moment, the message is a simple object with one attribute. In the future, 
this object will have additional attributes, like tags, links, cc's, badges, etc. 

```javascript
{
  "body": "You did a good job"
}
```
```shell
{
  "body": "You did a good job"
}
```

| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|body| The text of the Kudos message  |Yes|string|

## Quality
Qualities represent the values your organization is recognizing. These are the characteristics or 
skills for which your recipient(s) have demonstrated. 

```javascript
{
  "kind": "name",
  "value": "Skillful"
}
```
```shell
{
  "kind": "name",
  "value": "Skillful"
}
```

| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|kind| At the moment, this enumeration consists of one choice - name |Yes|enum|
|value| The name of the quality to be applied |Yes|string|

## User

```javascript
{
  "kind": "email",
  "value": "receiver@example.com"
}
 or 
{
  "kind": "group_name",
  "value": "Head Office"
}
```
```shell
{
  "kind": "email",
  "value": "receiver@example.com"
}
 or 
{
  "kind": "group_name",
  "value": "Head Office"
}
```
| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|kind| An enumeration of the type of user named. Your choices include: email, group_name |Yes|enum|
|value| This could be an email, or the name of a group, department or location |Yes|string|

## Points

<a id="schemapoints"></a>

```json
100

```

### Properties

| Attributes | Description | Required | Type |
| ---------- | ----------- | -------- | ---- |
|points| User points balance  |Yes|integer|


## Lookup User Object
<a id="lookup_user_object"></a>

```json
{
  "id": 1,
  "email": "user@example.com",
  "pointsBalance": 200,
  "employeeNumber": "123"
}

```

### Properties

|Attribute|Description|Type|
|---|---|---|---|---|
|id|User ID|integer|
|email|Email Address|string|
|pointsBalance|Points Balance|[Points](#schemapoints)|
|employeeNumber|Employee Number|string|




<h2 id="tocScreateredemption">Create Redemption</h2>

<a id="schemacreateredemption"></a>

```json
{
  "userId": 0,
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

| Attribute | Description | Required | Type |
|---|---|---|---|
|userId|Redeeming user ID, can be fetched from [user lookup](#opIdlookUpUser)|true|integer|
|rewardId|Reward ID|true|string|
|name|Reward name|true|string|
|description|Reward Description|false|string|
|kudosPoints|Number of points to deduct from the redeeming user|true|integer|
|currencyCode|The currency code. Defaults to "USD"|false|string|
|amountInCents|The reward&#39;s monetary value in cents|true|integer|
|transactionId|The unique transaction ID|true|string|
|orderId|The Unique Order ID|true|string|
|notes|Additional redemption notes|false|string|

<h2 id="tocSredemptionshistory">Redemptions History</h2>

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

| Attribute | Description | Required | Type |
|---|---|---|---|
|page|The current page number|true|integer|none|
|totalCount|The total number of redemptions|true|integer|none|
|data|List of redemptions|true|[Redemptions](#schemaredemptions)|none|

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

| Attribute | Description | Required | Type |
|---|---|---|---|
|*anonymous*|Redemption|false|[[Redemption](#schemaredemption)]|

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

| Attribute | Description | Required | Type |
|---|---|---|---|---|
|id||true|integer|
|cancellationDate|Redemption cancellation date|false|string(date)|
|createdBy|Redemption creator user ID|true|integer|
|rewardId|Reward ID|true|string|
|name|Reward Name|true|string|
|description|Reward Description|true|string|
|kudosPoints|Number of points deducted from redeeming user|true|integer|
|currencyCode|The currency code. Defaults to "USD"|true|string|
|amountInCents|The reward's monetary value in cents|true|integer|
|transactionId|The unique transaction ID|true|string|
|userId|User ID|true|integer|
|orderId|Order ID|true|string|
|notes|Notes|false|string|
|createdAt|Creation date|true|string(date)|
|updatedAt|Last updated date|true|string(date)|

