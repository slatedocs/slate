## Authentication and Permissions

Authentication for any request is made by added a valid token to the headers as follows:

`{'Content-Type': 'application/json', 'Authorization': 'Token token=' + <TOKEN-GOES-HERE>}`

The token is a random 64-char string.

## Generating a Valid Token (Logging in)
```python
    url = 'http://smartapi.bboxx.co.uk/auth/login'
    fields = {
        "username": <username>,
        "password": <password>
    }

    r = requests.post(url, data=fields)

    token = r.json()["message"]["login_successful"]["API_token"]

    print token
    >>> "sRtBFThPFIpgKY2sYkaSHFbo1hosg2NvCP4PmBIxfGQ62VS6zrjFT6dr1qDLQGz"
```
To generate a valid token a user should send a `POST` reqest to `/auth/login` with their username and password.

A valid token will be sent in response if the username and passworod are correct.

## The Full `/auth/login` Response
```python

    url = 'http://smartapi.bboxx.co.uk/auth/login'
    fields = {
        "username": <username>,
        "password": <password>
    }

    r = requests.post(url, data=fields)
    r.json()
    >>> {
        "status": "success",
        "message": {
            "login_successful": {
                "username": "test.user@bboxx.co.uk",
                "entity_id": 1,
                "display_name": "T User",
                "name": "",
                "user_product_visibility": "GLOBAL",
                "hub_id": None,
                "shop_id": None,
                "API_token": "sRtBFThPFIpgKY2sYkaSHFbo1hosg2NvCP4PmBIxfGQ62VS6zrjFT6dr1qDLQGz",
                "token_expiry": "Mon, 01 Aug 2016 17:05:11 GMT",
                "permissions": "SYSTEM"
            }
        }
    }
```
A succcesful call to `/auth/login` will return general information about the user as well as the token including amongst
other things expiry of the token and the permissions and scope that the user has.

You can view `r.json()` to see the full response object.

## Expiry

The token will expire after 3 hours.

After each successful request made using the token, the expiry time will be extended, thus a token will only expire
after 3 hours without use.

If the token expires the user should simply login again as above to generate a new valid token.

## A basic authentication routine
```python
    def login():
        url = 'http://smartapi.bboxx.co.uk/v1/auth/login'
        fields = {
            "username": <username>,
            "password": <password>
        }

        r = requests.post(url, data=fields)

        token = r.json()["message"]["login_successful"]["API_token"]
        headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + token}

        return headers
```
A basic authentication routine would therefore do the following:

* `POST` request to `/auth/login`
* extract the  token from the response
* insert the token into a `headers` variable
* include the headers in the request

This strategy is effective but inefficient as a new token would be generated for each and every request and the login
process can be slow.

This is particularly bad if multiple requests are being made such as enabling/disabling a full portfolio products or
applying a mass-update.

## An Efficient authentication routine

> The following three functions could be used to generate a valid token without repeatedly called `/auth/login`

```python
def login():
    url = 'http://smartapi.bboxx.co.uk/v1/auth/login'
    fields = {
        "username": <username>,
        "password": <password>
    }
    r = requests.post(url, data=fields)

    token = r.json()["message"]["login_successful"]["API_token"]
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + token}

    write_token_to_file(r.json(), headers)

    return headers


def write_token_to_file(data, headers):
    expiry = data["message"]["login_successful"]["token_expiry"]

    with open('token.json', 'w') as token_file:
        json.dump({'headers': headers, 'expiry': expiry}, token_file)


def get_headers():

    if os.path.exists('token.json'):

        with open('token.json') as token_file:
            data = json.load(token_file)

            expiry = dateutil.parser.parse(data['expiry']).replace(tzinfo=None)

            # If it's expired, make a new one.
            if expiry < (dt.datetime.utcnow() - dt.timedelta(minutes=10)):
                return login()
            else:  # Else return the one in the file.
                return data['headers']

    else:
        return login()

```

> Usage would then be as follows:

```python
url = "http://smartapi.bboxx.co.uk/v1/endpoint"
data = json.dumps(data)
headers = get_headers()

r = requests.get(url=url, data=data, headers=headers)
```

To avoid the inefficiencies described above a more complex routine should be developed:

* For each request look-up the token/expiry from a local file
* If the token is expired (or non-existant) then...
    * Login to the database
    * Extract the token and token_expiry
    * Store these in a local file
* Otherwise...
    * Extract the token from the local file
* Insert the token into the headers
* Include the headers in the request

This strategy is much preferable.

Code snippets demonstrating this routine are shown to the right.

There are of course a number of other possible strategies for avoiding repeated calls to `/auth/login` this is simply
a suggestion.

## Permissions and Scope

The SMARTSolarAPI restricts access to data and products in two orthogonal "layers".
These layers define:

* __WHAT__ information a user can see and what actions they can take (`PERMISSIONS`)
* __WHICH__ units the user is allowed to interact with  (`SCOPE`)

Thus a user may be given `read-only` access to every product in a portfolio or full permissions but only on a subset of units.

We name these two layers `PERMISSIONS` and `SCOPE`.

### Permissions

There are 5 levels of permission that a user can have. These permissions are "heirachical" - each successive permissions
level can do everything the lower level can do plus some extra functionality.

These permissions in ascending order are:

* __`OVERVIEW`__ - read-only. The user can see data but not alter it.
* __`TECHNICAL`__ - can enable/disable a unit, create notes on a product and create and edit repairs
* __`ADMIN`__ - can send sms to units and alter data in some tables
* __`FACTORY`__ - can create new units
* __`SYSTEM`__ - full access, can read, edit and delete data, can create new entries in otherwise restricted tables (eg: Product Type, SoftwareVersionType etc.)


### Scope

Users can have either `GLOBAL` or `ENTITY` scope, that is, they can either see __ALL__ units or see only units assigned to the entity that they belong.
What each user can _do_ to the units visible to them is defined by `PERMISSIONS` above.

