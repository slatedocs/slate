---
title: Ride My Way

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:

includes:
  - errors

search: true
---

# Introduction
Welcome to the Ride-my-way API. This api is used by Ride-my-way App, so a clone of the app can be easily accomplished by consuming the endoints of this API  

This document is meant to aid you through using the API ranging from resource, updating and carrying out other actions.

BASE URL: `https://ride-my-way-andela.herokuapp.com/api/v1`  

# Making a Request
Making request to all endpoints aside the register and login function requires a token, and to get an token, you have to consume both the register and login endpoints. The register endpoint to create a user and the login endpoint to login a user, which returns an object containing the token.  
The token is set to expire after 24hours of its generation.  
  
To make requests, the authorization token is to be placed in the req.headers with a `Bearer ` and a whitespace prefix as it is shown below  
  
`Authorization: Bearer jsonwebtoken.requiredfor.auth2018`  

# Authentication

## User Register

Create a user  

### HTTP Request
`POST /auth/signup`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 201`  
`Content-type application/json`  

> Request

```javascript
  {
    "name": "John Doe",
    "email": "j.doe@gmail.com",
    "password": "password"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Registration successful!",
    "user": {
      "id": "wTJb452Lcd",
      "name": "Joe Doe",
      "email": "j.doe@gmail.com",
      "phone_number": null,
      "photo": "avatar.png",
      "updated_at": "2018-07-29T13:10:05.003Z",
      "created_at": "2018-07-29T13:10:05.003Z"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoid1RKYjQ1MkxjZCJ9LCJpYXQiOjE1MzI4Njk4MDUsImV4cCI6MTUzMzA0MjYwNX0.dhDA3_39EB6V7l8BM2CYLfVOYFz2L0WzNXlgCLs-j_U"
  }
```

## User Login

Login a user in

### HTTP Request
`POST /auth/login`  
`Content-type application/json`  

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Request

```javascript
  {
    "email": "j.does@gmail.com",
    "password": "password"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Login successful!",
    "user": {
      "id": "wTJb452Lcd"
    },
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoid1RKYjQ1MkxjZCJ9LCJpYXQiOjE1MzI4NzAyNTksImV4cCI6MTUzMzA0MzA1OX0.8BMj5tz-dMIg0_FLlUhRmnajuOBHDoewje0CwT_TWMY"
  }
```

# Users

## Get all users

Get all users 

### HTTP Request
`GET /users`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 200`  
`Content-type application/json`  

> Response

```javascript
  {
    "status": "success",
    "message": "2 user(s) found",
    "users": [
        {
          "id": "LM0pLGcSam",
          "name": "Uche Jude",
          "email": "iamuchejude@gmail.com",
          "phone_number": "08135642400",
          "photo": "photo.png",
          "updated_at": "2018-07-28T08:50:09.150Z",
          "created_at": "2018-07-25T11:40:20.523Z"
        },
        {
          "id": "wTJb452Lcd",
          "name": "Joe Doe",
          "email": "j.doe@gmail.com",
          "phone_number": null,
          "photo": "avatar.png",
          "updated_at": "2018-07-29T13:10:05.003Z",
          "created_at": "2018-07-29T13:10:05.003Z"
        }
    ]
  }
```

## Get a user

Get one user  

### HTTP Request
`GET /users/:id`  
`Content-type application/json`  

### URL Parameters
| Parameters | Description                             |
|------------|-----------------------------------------|
| User id    | `:id` should be provided as the user ID  |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json` 

> Response

```javascript
{
    "status": "success",
    "message": "User found",
    "user": {
      "id": "wTJb452Lcd",
      "name": "Joe Doe",
      "email": "j.doe@gmail.com",
      "phone_number": null,
      "photo": "avatar.png",
      "updated_at": "2018-07-29T13:10:05.003Z",
      "created_at": "2018-07-29T13:10:05.003Z"
    }
  }
```

## Update User Profile

Update a user Profile details  

### HTTP Request
`PUT /users/:id/profile`  
`Content-type application/json`  

### URL Parameters
| Parameters | Description                             |
|------------|-----------------------------------------|
| User id    | `:id` should be provided as the user ID  |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json` 

> Request

```javascript
  {
    "name": "John Rowland",
    "phoneNumber": "08123456789",
  }
```

> Response

```javascript
  {
    "status": "succes",
    "message": "Profile updated successfully",
    "user": {
        "updated_at": "2018-07-29T13:57:11.677Z",
        "name": "John Rowland",
        "phone_number": "08123456789"
    }
  }
```

## Update a User Password

Update a Password 

### HTTP Request
`PUT /users/:id/password`  
`Content-type application/json`  

### URL Parameters
| Parameters | Description                             |
|------------|-----------------------------------------|
| User id    | `:id` should be provided as the user ID  |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Request

```javascript
  {
    "password": "rowPassword"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Password updated successfully"
  }
```

## Update a User Photo

Update a user profile photo  

### HTTP Request
`PUT /users/:id/photo`  
`Content-type application/json`  

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Request

```javascript
  {
    "photo": "https://images.vexels.com/media/users/3/129733/isolated/preview/a558682b158debb6d6f49d07d854f99f-casual-male-avatar-silhouette-by-vexels.png"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Profile photo updated successfully!",
    "user": {
      "photo": "https://images.vexels.com/media/users/3/129733/isolated/preview/a558682b158debb6d6f49d07d854f99f-casual-male-avatar-silhouette-by-vexels.png"
    }
  }
```


# Rides

## Get all ride offers

Get all availble ride offers

### HTTP Request
`GET /rides`  
`Content-type application/json`  

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Response

```javascript
  {
    "status": "success",
    "message": "2 ride offer(s) found",
    "rides": [
        {
            "id": "YdvzOXsVV9",
            "user_id": "LM0pLGcSam",
            "start_from": "Egbeda",
            "destination": "Ayobo",
            "seat": "4",
            "departure_date": "10-10-2018",
            "departure_time": "02:00:00PM",
            "created_at": "2018-07-25T12:42:46.014Z",
            "updated_at": "2018-07-25T12:42:46.014Z"
        },
        {
            "id": "iOo0t0Fber",
            "user_id": "LM0pLGcSam",
            "start_from": "Ilupeju",
            "destination": "Oshodi",
            "seat": "4",
            "departure_date": "10-12-2018",
            "departure_time": "05:30:00PM",
            "created_at": "2018-07-25T12:53:37.857Z",
            "updated_at": "2018-07-25T12:53:37.857Z"
        }
      ]
  }
```


## Get one ride offer

Get a single ride offers

### HTTP Request
`GET /rides/:id`  
`Content-type application/json`  

### URL Parameters
| Parameters       | Description                                   |
|------------------|-----------------------------------------------|
| Ride Offer id    | `:id` should be provided as the Ride Offer ID  |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Response

```javascript
  {
    "status": "success",
    "message": "Ride offer was successfully created",
    "ride": {
        "id": "QVDFP5ifFN",
        "user_id": "wTJb452Lcd",
        "start_from": "Agege",
        "destination": "Gbagada",
        "seat": "4",
        "departure_date": "30-10-2018",
        "departure_time": "03:20:00PM",
        "created_at": "2018-07-29T15:47:16.554Z",
        "updated_at": "2018-07-29T15:47:16.554Z"
    }
  }
```

## Create a ride offer

Create a ride offer

### HTTP Request
`POST /users/rides/`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 201`  
`Content-type application/json`  

> Request

```javascript
  {
    "startLocation": "Agege",
    "destination": "Gbagada",
    "seats": "4",
    "departureDate": "30-10-2018",
    "departureTime": "03:20:00PM",
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Ride offer was successfully created",
    "ride": {
        "id": "QVDFP5ifFN",
        "user_id": "wTJb452Lcd",
        "start_from": "Agege",
        "destination": "Gbagada",
        "seat": "4",
        "departure_date": "30-10-2018",
        "departure_time": "03:20:00PM",
        "created_at": "2018-07-29T15:47:16.554Z",
        "updated_at": "2018-07-29T15:47:16.554Z"
    }
  }
```

## Delete a ride offer

Delete an existing ride offer

### HTTP Request
`DELETE /rides/:id`  
`Content-type application/json`  

### URL Parameters
| Parameters       | Description                                   |
|------------------|-----------------------------------------------|
| Ride Offer id    | `:id` should be provided as the Ride Offer ID  |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Response

```javascript
  {
    "status": "success",
    "message": "Ride Offer was deleted successfully"
  }
```

## Request for a ride offer

Make request for a ride offer

### HTTP Request
`POST /rides/:id/requests`  
`Content-type application/json`  

### URL Parameters
| Parameters       | Description                                   |
|------------------|-----------------------------------------------|
| Ride Offer id    | `:id` should be provided as the Ride Offer ID  |

### HTTP Response
`STATUS CODE 201`  
`Content-type application/json`  

> Response

```javascript
{
    "status": "success",
    "message": "Request was successfully made",
    "request": {
        "id": "wkVmJh4dML",
        "ride_id": "xN7Kvv2SAb",
        "user_id": "wTJb452Lcd",
        "created_at": "2018-07-29T17:30:17.126Z",
        "status": "pending",
        "updated_at": "2018-07-29T17:30:17.126Z",
        "name": "John Doe"
    }
  }
```

## Get requests for a ride offer

Get all requests for a ride offer

### HTTP Request
`GET /users/rides/:id/requests`  
`Content-type application/json`  

### URL Parameters
| Parameters       | Description                                   |
|------------------|-----------------------------------------------|
| Ride Offer id    | `:id` should be provided as the Ride Offer ID |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Response

```javascript
  {
    "status": "success",
    "message": "Showing 1 Request(s) for this Ride Offer",
    "requests": [
        {
            "id": "gLLMdS6Nuw",
            "ride_id": "fWNyX3O5eo",
            "user_id": "FZ48hpkHyV",
            "created_at": "2018-07-29T19:47:10.830Z",
            "status": "pending",
            "updated_at": "2018-07-29T19:47:10.830Z",
            "user_name": "John Doe"
        }
    ]
  }
```

## Respond to a request for a ride offer

Accept or Reject a pending request for a ride offer.  
`status` should either be accepted or rejected

### HTTP Request
`PUT /rides/:ride_id/requests/:request_id`  
`Content-type application/json`  

### URL Parameters
| Parameters            | Description                                         |
|-----------------------|-----------------------------------------------------|
| Ride Offer id         | `:ride_id` should be provided as the Ride Offer ID  |
| Request id            | `:request_id` should be provided as the Request ID  |

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Request

```javascript
  {
    "status": "accepted"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Request accepted",
  }
```