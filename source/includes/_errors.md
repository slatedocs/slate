# Errors

> Example responses:

```json
{
  "errors":{
    "name":[
      "can't be blank"
    ],
    "project_users":[

    ]
  }
}
```
```
422 Unprocessable Entity
```
```json
{
  "data":{
    "reference":"a833626d3b763fbf738267ef792fba4d"
  }
}
```
```
403 Forbidden
```
```json
{
  "data":{
    "reference":"dca8215e324a30c08f61bdd5d348af9c"
  }
}
```
```
404 Not Found 
```


Timely uses conventional HTTP response codes to indicate the success or failure of an API request. Codes in the 2xx range indicate success. Codes in the 4xx range indicate an error that failed given the information provided.
Codes in the 5xx range indicate an error with Timely's servers.

Accessing unauthorized to another project, account, or trying to create or delete objects that are not under our control will result in errors. 


The Timely API uses the following error codes:


| Error Code                  	| Meaning                                                                       	|
|-----------------------------	|-------------------------------------------------------------------------------	|
| 400 - Bad Request           	| Your request is invalid                                                       	|
| 401 - Unauthorized          	| Access with wrong authentication token                                        	|
| 403 - Forbidden             	| The entity requested is hidden for unauthorized access                        	|
| 404 - Not Found             	| The specified entity could not be found                                       	|
| 422 - Unprocessable Entity  	| Server understands the content type, but it was unable to process the request 	|
| 500 - Internal Server Error 	| We had a problem with our server. Try again later.                            	|

