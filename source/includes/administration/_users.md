## Users

A user account allows users to authenticate to an [organization](#organizations) and to have access to the resources in it. You can restrict user access to the system and environments by assigning them specific [roles](#roles). Additionally, every user is given an API key which is needed to use our APIs. All operations done by users are persisted and can be accessed through the activity log.

<!-------------------- LIST USERS -------------------->

### List users

`GET /users`

```shell
# Retrieve visible users

curl "https://cloudmc_endpoint/v1/users" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
  "data":[{
    "id": "e83540c7-75a0-4715-96dc-c10a364e0390",
    "userName": "habsgoalie123",
    "firstName": "Carey",
    "lastName": "Price",
    "email": "gohabsgo@cloud.mc",
    "creationDate": 1476796926000,
    "status": "ACTIVE",
    "organization": {
      "id": "8e3393ce-ee63-4f32-9e0f-7b0200fa655a",
      "name": "Canadiens"
    },
    "roles": [
      {
        "id": "cdaaa9d0-304e-4063-b1ab-de31905bdab8",
        "name": "End-User"
      },
      {
        "id": "fe6d2614-3c33-447c-96f2-c79f67f5fd19",
        "name": "Environment Admin",
        "environment": {
          "id": "afcafd98-0287-4139-bb77-f29ab0549eaa"
        }
      }
    ]
  }]
}
```
```go
ccaClient := cca.NewCcaClient("your_api_key")
users, err := ccaClient.Users.List()
```

Retrieve information about users you have access to. If you want access to other users in your [organization or sub-organizations](#organizations), you will need to be assigned the `Users read` permission. Without this permission, you will only see your own user in the list.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the user
`userName`<br/>*string* | The username of the user
`firstName`<br/>*string* | The first name of the user
`lastName`<br/>*string* | The last name of the user
`email`<br/>*string* | The email of the user
`creationDate`<br/>*long* | The date in [unix time](https://en.wikipedia.org/wiki/Unix_time) that the user was created
`status`<br/>*string* | The current status of the user.
`organization`<br/>*[Organization](#organization)* | The organization to which the user belongs
`roles`<br/>*Array[[Role](#roles)]* | The system and environments roles that are assigned to the user<br/>*includes*: `id`, `name` and `environment.id`


<!-------------------- GET USER -------------------->

### Retrieve a user

`GET /users/:id`

```shell
# Retrieve visible user

curl "https://cloudmc_endpoint/v1/users/[user-id]" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
  "data":{
    "id": "fdf60a19-980d-4380-acab-914485111305",
    "userName": "frodo",
    "firstName": "Frodo",
    "lastName": "Baggins",
    "email": "frodo@cloud.mc",
    "creationDate": 1476796926000,
    "status": "ACTIVE",
    "organization": {
      "id": "c64dcd1d-9123-45e5-ad00-5d635c49176b",
      "name": "The Shire"
    },
    "environments": [{
      "id": "55724a36-4817-4cd3-927e-57d8a8b41eb8",
      "name": "hobbiton"
    }],
    "roles": [
      {
        "id": "5f0a4f20-3537-4bcd-81fe-2b74fd4c07e0",
        "name": "End-User"
      },
      {
        "id": "0b9159cd-81ac-48d1-be8a-7595a1617c94",
        "name": "Read-Only",
        "environment": {
          "id": "55724a36-4817-4cd3-927e-57d8a8b41eb8"
        }
      }
    ]
  }
}
```
```go
ccaClient := cca.NewCcaClient("your_api_key")
user, err := ccaClient.Users.Get("[user-id]")
```

Retrieve information about a specific user. If you want access to other users in your [organization or sub-organizations](#organizations), you will need to be assigned the `Users Read` permission.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the user
`userName`<br/>*string* | The username of the user
`firstName`<br/>*string* | The first name of the user
`lastName`<br/>*string* | The last name of the user
`email`<br/>*string* | The email of the user
`creationDate`<br/>*long* | The date in [unix time](https://en.wikipedia.org/wiki/Unix_time) that the user was created
`status`<br/>*string* | The current status of the user.
`organization`<br/>*[Organization](#organization)* | The organization to which the user belongs
`environments`<br/>*Array[[Environment](#environments)]* | The environments the user is member of<br/>*includes*: `id`, `name`
`roles`<br/>*Array[[Role](#roles)]* | The system and environments roles that are assigned to the user<br/>*includes*: `id`, `name` and `environment.id`


<!-------------------- CREATE USER -------------------->


### Create user

`POST /users`

```shell
# Create a user

curl -X POST "https://cloudmc_endpoint/v1/users" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request-body]"

# Request body example
```
```json
{
  "userName": "vader42",
  "firstName": "Anakin",
  "lastName": "Skywalker",
  "email": "vader42@cloud.mc",
  "organization": {
    "id": "645cf4ce-3699-40c5-a1a8-0b3e945f49ee"
  },
  "roles": [
    {
      "id": "dd01c908-371c-4ec5-9fd7-80b1bfac8975"
    }
  ]
}
```

Create a user in a specific organization. There's two different types of [role](#roles) you can assign to the user. A system role will determine the set of system permissions the user will have. An environment role will give the user access to an environment and will determine what he can see and do in that environment. You will need the `Create a new user` permission to execute this operation.

Required | &nbsp;
-------- | -----------
`userName`<br/>*string* | Username of the new user. Should be unique across the organization.
`firstName`<br/>*string* | First name of the user
`lastName`<br/>*string* | Last name of the user
`email`<br/>*string* | Email of the user. Should be unique across the organization.

Optional | &nbsp;
-------- | -----------
`organization`</br>*[Organization](#organization)* | Organization in which the user will be created. *Defaults to your organization*<br/>*required:* `id`
`roles`<br/>*Array[[Role](#roles)]* | The system and environment roles to give to the user<br/>*required*: `id`

##### Returns

The responses' `data` field contains the created [user](#users) with it's `id`.


<!-------------------- UPDATE USER -------------------->


### Update user

`PUT /users/:id`

```shell
# Create a user

curl -X PUT "https://cloudmc_endpoint/v1/users/[user-id]" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request-body]"

# Request body example
```
```json
{
  "userName": "spidey1",
  "firstName": "Peter",
  "lastName": "Parker",
  "email": "spidey1@cloud.mc",
  "roles": [
    {
      "id": "dd01c908-371c-4ec5-9fd7-80b1bfac8975"
    }
  ]
}
```

Update a specific user. It is important to note that updating the list of roles will override the previous one. You will the `Users update` permission to execute this operation.

Optional | &nbsp;
-------- | -----------
`userName`<br/>*string* | The new username of the user. Should be unique across the organization.
`firstName`<br/>*string* | The new first name of the user
`lastName`<br/>*string* | The new last name of the user
`email`<br/>*string* | The new email of the user. Should be unique across the organization.
`roles`<br/>*Array[[Role](#roles)]* | The new list of system or environment roles to give to the user. This will override the previous list of roles.<br/>*required*: `id`

##### Returns

The responses' `data` field contains the updated [user](#users).


<!-------------------- DELETE USER -------------------->


### Delete user

`DELETE /users/:id`

```shell
# Delete a user

curl "https://cloudmc_endpoint/v1/users/[user-id]" \
   -X DELETE -H "MC-Api-Key: your_api_key"

```

Delete a specific user. You will need the `Delete an existing user` permission to execute this operation.


<!-------------------- UNLOCK USER -------------------->


### Unlock user

`POST /users/:id/unlock`


```shell
# Unlock a user that was locked from the system

curl "https://cloudmc_endpoint/v1/users/[user-id]/unlock" \
   -X POST -H "MC-Api-Key: your_api_key"

```

A user with 10 consecutive unsuccessful logins will be automatically locked by our system. This API can be used to unlock a user in this situation. You will need the `Unlock user` permission to execute this operation.
