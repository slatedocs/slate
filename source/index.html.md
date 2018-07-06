---
title: Ride-my-way API

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
  
To make requests, the token is to be placed in the req.headers with a `Bearer ` and a whitespace prefix as it is shown below  
  
`token: Bearer jsonwebtoke.requiredfor.auth`  

# Authentication

## User Register

Create new user  

### HTTP Request
`POST /auth/login`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 201`  
`Content-type application/json`  

> Request

```javascript
  {
    "name": "Uche Jude",
    "email": "nuchejude@gmail.com",
    "password": "myPassword"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Auth Successfull"
    "data": {
      "userId": "7834-78fa-414f-414141",
      "name": "Uche Jude",
      "email": "nuchejude@gmail.com"
    }
  }
```

## User Login

Login user  

### HTTP Request
`POST /auth/login`  
`Content-type application/json`  

### HTTP Response
`STATUS CODE 200`  
`Content-type application/json`  

> Request

```javascript
  {
    "name": "Uche Jude",
    "email": "nuchejude@gmail.com",
    "password": "myPassword"
  }
```

> Response

```javascript
  {
    "status": "success",
    "message": "Auth Successfull"
    "data": {
      "userId": "7834-78fa-414f-414141",
      "name": "Uche Jude",
      "email": "nuchejude@gmail.com"
    }
  }
```

# Users

## All Users

Get all users 

### HTTP Request
`GET /users`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 200`  
`Content-type application/json`  

## User profile

Get a user  

### HTTP Request
`GET /users/:uid`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 200`  
`Content-type application/json`  

## User profile update 

Update a user  

### HTTP Request
`PUT /users/:uid`  
`Content-type application/json`  

### HTTP Response

`STATUS CODE 200`  
`Content-type application/json`  
