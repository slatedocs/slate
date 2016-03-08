# Authentication and Sessions

If you perform an HTTP operation on any other resource other than the root `/redfish/v1/` resource, you will receive an `HTTP 401 (Forbidden)` error indicating that you don’t have the authentication needed to access the resource.


> The following shows the error displayed on `GET /redfish/v1/systems/` when no authentication is attempted:

```
401 Forbidden
```

```json
    {
        "@odata.type": "#ExtendedInfo.ExtendedInfo",
	    "Messages": [
		    {
		    	"MessageID": "Base.0.10.NoValidSession"
		    }
	    ],
	    "Type": "ExtendedError.1.0.0",
	    "error": {
	    "@Message.ExtendedInfo": [
		    {
		    	"MessageId": "Base.0.10.NoValidSession"
		    }
	    ],
	    "code": "iLO.0.10.GeneralError",
	    "message": "A general error has occurred. See ExtendedInfo for more information."
	    }
    }
```

## Basic Authentication

The RESTful API allows you to use HTTP Basic Authentication using a valid iLO user name and password.

```shell
> curl https://{iLO}/redfish/v1/systems/ -i --insecure -u username:password -L
```
```
HTTP/1.1 200 OK Allow: GET, HEAD
Cache-Control: no-cache Content-length: 437
Content-type: application/json Date: Tue, 05 Aug 2014 14:39:56 GMT ETag: W/"9349EA93"
Link: </rest/v1/SchemaStore/en/ComputerSystemCollection.json>; rel=describedby Server: HP->
```
```json    
    {
    	"@odata.context": "/redfish/v1/$metadata#Systems",
    	"@odata.id": "/redfish/v1/Systems/",
    	"@odata.type": "#ComputerSystemCollection.ComputerSystemCollection",
    	"Description": "Computer Systems view",
    	"MemberType": "ComputerSystem.1",
    	"Members": [{
    		"@odata.id": "/redfish/v1/Systems/1/"
    	}],
    	"Members@odata.count": 1,
    	"Name": "Computer Systems",
    	"Total": 1,
    	"Type": "Collection.1.0.0",
    	"links": {
    		"Member": [{
    			"href": "/rest/v1/systems/1"
    		}],
    		"self": "/rest/v1/systems"
    	}
    }

```

## Creating and Using Sessions

For more complex multi-resource operations, you should log in and establish a session. To log in, iLO has a session manager object at the documented URI `/redfish/v1/sessions/`. To create a session POST a JSON object to the Session manager:

> To create a session perform an HTTP POST /redfish/v1/sessions/ with the required HTTP headers and a JSON body containing:

```json
    {
    	"UserName": "<your username>", 
    	"Password": "<your password>"
    }
```
<aside class="notice">
You must include the HTTP header `Content-Type: application/json`
for all RESTful API operations that include a request body in JSON format.
</aside>

If the session is created successfully, you receive an HTTP 201 (Created) response from iLO. There will also be two important HTTP response headers.

* **X-Auth-Token**	Your session token (string).	This is a unique string for your login session. It must be included as a header in all subsequent HTTP operations in the session.

* **Location**	The URI of the newly created session resource.	iLO allocates a new session resource describing your session. This is the URI that you must DELETE against in order to log out. If you lose this location URI, you can find it by crawling the HREF links in the Sessions collection. Store this URI to facilitate logging out.

> Successful login response from iLO:

```
Content-type → application/json; charset=utf-8
Link → </redfish/v1/SessionService/Sessions/{item}/>; rel=self
Location → https://{iLO}/redfish/v1/SessionService/Sessions/{item}/
X-Auth-Token → c9b3b084490d5b690a7091da2bf4a906
``` 

```json
{
  "Messages": [
    {
      "MessageID": "Base.0.10.Created"
    }
  ],
  "Type": "ExtendedError.1.0.0",
  "error": {
    "@Message.ExtendedInfo": [
      {
        "MessageID": "Base.0.10.Created"
      }
    ],
    "code": "iLO.0.10.ExtendedInfo",
    "message": "See @Message.ExtendedInfo for more information."
  }
}
```

<aside class="warning">
It is good practice to save the Location URI of the newly created session.  This is your unique session information and is needed to log out later.
</aside>

## Using a Session

To use a session, simply include the `X-Auth-Token` header supplied by the login response in all REST requests.

## Log Out of a Session

iLO supports a limited number of simultaneous sessions.  If you do not log out of a session it will expire automatically after a time of inactivity.  However, it is good practice to log out when finished with a session.

To log out perform an `HTTP DELETE` to the URI that was returned in the "Location" header when you created the session.

> DELETE https://{host}/redfish/v1/sessions/{item}

<aside class="notice">
If you cannot preserve the session URI on login, you may iterate the Sessions collection at /redfish/v1/sessions/.  Be sure to include the X-Auth-Token header.  For each session look for a JSON property called "MySession" that is true. You may then DELETE that URI.
</aside>

