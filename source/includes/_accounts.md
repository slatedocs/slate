# Accounts

Accounts represent users that can login and access different organizations based on access right.

## Authenticate

```shell
curl "https://api.spaceinvoices.com/v1/accounts/login" \
  -H "Authorization: TOKEN" \
  -d email="rocketman@example.com" \
  -d password="supersecret"
```

```javascript
spaceInvoices.accounts.create({
  email: 'rocketman@example.com',
  password: 'supersecret'
})
.then(function(account) {
  console.log(account);
})
.catch(function(err) {
  console.error(err);
});
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c5a3683ea12d5a67dd0ef2f4c",
  "userId": "5a3683ea12d5a67dd0ef2f4c"
}
```

This endpoint authenticates an account and returns an access token that can be used in consecutive calls to the API.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/accounts/login`

#### Attributes

|      |     |
| ---: | --- |
| email **required** | Chosen email. |
| password **required** | Chosen password. |

### HTTP Response

#### Attributes

|      |     |
| ---: | --- |
| id | Generated access token. |
| userId | ID of authenticated user account. |


## Create New Account

```shell
curl "https://api.spaceinvoices.com/v1/accounts" \
  -H "Authorization: TOKEN" \
  -d email="rocketman@example.com" \
  -d password="supersecret"
```
```javascript
spaceInvoices.accounts.create({
  email: 'rocketman@example.com',
  password: 'supersecret'
})
.then(function(account) {
  console.log(account);
})
.catch(function(error) {
  console.error(error);
});
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "email": "rocketman@example.com"
}
```

This endpoint creates a new account.

### HTTP Request

`POST https://api.spaceinvoices.com/v1/accounts`

#### Attributes

|      |     |
| ---: | --- |
| email **required** | Unique email address. |
| password **required** | Password, 8 character minimum, at least one capital letter and one symbol. |

### HTTP Response

#### Attributes

|      |     |
| ---: | --- |
| id | Unique ID of model instance. |
| email | Provided username. |


## Check if an email is unique

```shell
curl "https://api.spaceinvoices.com/v1/accounts/is-unique?email=rocketman@example.com"
```
```javascript
```

> Returns:

```json
{
  "isUnique": true
}
```

This endpoint returns a boolean value if email is unique / does not exist in the system yet.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/accounts/is-unique?email=:email`

#### Query parameters

|      |     |
| ---: | --- |
| email **required** | Email to check. |

### HTTP Response

#### Attributes

|      |     |
| ---: | --- |
| isUnique | Boolean if email is unique. |


## Read account details

```shell
curl "https://api.spaceinvoices.com/v1/accounts/5a3683ea12d5a67dd0ef2f4c" \
  -H "Authorization: TOKEN"
```
```javascript
```

> Returns:

```json
{
  "id": "5a3683ea12d5a67dd0ef2f4c",
  "email": "rocketman@example.com"
}
```

This endpoint returns an Account's details.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/accounts/:id`

#### Query parameters

|      |     |
| ---: | --- |
| id **required** | ID of Account to return. |

### HTTP Response

#### Attributes

|      |     |
| ---: | --- |
| id | ID of account. |
| email | Email address of account. |
