## `/auth/validate_user`

> A simple `GET` request with a valid username yields the following response:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/auth/validate_user?username=a-valid-user@bboxx.co.uk'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    r.json()
    >>> {
        "status": "success",
        "message": "Successfully checked the username a-valid-user@bboxx.co.uk",
        "data": "True" 
        }
    }
```
> A `GET` request with an invalid username yields the following response

```python
    url = 'https://smartapi.bboxx.co.uk/v1/auth/validate_user?username=not_a_real_user@bboxx.co.uk'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    r.json()
    >>> {
        "status": "success",
        "message": "Successfully checked the username not_a_real_user@bboxx.co.uk",
        "data": "False" 
        }
    }
```

> `params` may also be used:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/auth/validate_user'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}
    
    params = {
        "username": "not_a_real_user@bboxx.co.uk"
    }
    
    r = requests.get(url=url, params=params, headers=headers)

    r.json()
    >>> {
        "status": "success",
        "message": "Successfully checked the username not_a_real_user@bboxx.co.uk",
        "data": "False" 
        }
    }
```

This endpoint can be called by users with `SYSTEM` privileges to validate whether a username is valid.

If a username is valid the response_code will be `200` and the payload in `r.json()["data"]` will be `True`.

If a username is invalid the response_code will still be `200` but the payload in `r.json()["data"]` will be `False`

  | value
--:|:------
endpoint | `/auth/validate_user`
method(s) | `GET`
permissions |  `SYSTEM`
params | username <font color="DarkGray">_(str)_</font>
payload | N/A
response | `200`

