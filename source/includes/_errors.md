# Errors

> Example responses:

```
422 Unprocessable Entity
```
```json
{
  "errors":{
    "name":[
      "can't be blank"
    ],
    "project_users":[
      "is invalid"
    ]
  }
}
```
```
422 Unprocessable Entity
```
```
403 Forbidden
```
```json
{
  "errors":{
    "message":"error message"
  }
}
```
```
404 Not Found
```
```json
{
  "errors":{
    "message":"Not Found"
  }
}
```
```
401 Unauthorized
```
```json
{
  "errors":{
    "message":"Unauthorized"
  }
}
```

Timely uses conventional HTTP response codes to indicate the success or failure of an API request. Codes in the 2xx range indicate success. Codes in the 4xx range indicate an error that failed due to the information provided.
Codes in the 5xx range indicate an error with Timely's servers.

Unauthorized access to projects and accounts, or trying to create or delete objects that are not under our control, will result in errors.

The Timely API uses the following error codes:


| Error Code                  	| Meaning                                                                       	|
|-----------------------------	|-------------------------------------------------------------------------------	|
| 400 - Bad Request           	| Your request is invalid                                                       	|
| 401 - Unauthorized          	| Wrong authentication token was used                                        	    |
| 403 - Forbidden             	| The entity requested is hidden from unauthorized access                        	|
| 404 - Not Found             	| The specified entity could not be found                                       	|
| 422 - Unprocessable Entity  	| The server understands the content type, but was unable to process the request 	|
| 500 - Internal Server Error 	| We’re experiencing a problem with our server. Try again later.                  |

