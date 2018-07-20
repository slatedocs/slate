## `/auth/validate_user_password`

> A simple `GET` request with a valid username/password combination yields the following response:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/auth/validate_user_and_password?username=a-valid-user@bboxx.co.uk&password=a-valid-password'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    r.json()
    >>> {
        "status": "success",
        "message": "Successfully checked the username a-valid-user@bboxx.co.uk with it's password",
        "data": "True" 
        }
    }
```
> A `GET` request with an invalid username/password combination yields the following response

```python
    url = 'https://smartapi.bboxx.co.uk/v1/auth/validate_user?username=not_a_real_user@bboxx.co.uk&password=not-a-valid-password'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    r.json()
    >>> {
        "status": "success",
        "message": "Successfully checked the username not_a_real_user@bboxx.co.uk with it's password",
        "data": "False" 
        }
    }
```


> `params` may also be used:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/auth/validate_user_and_password'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}
    
    params = {
        "username": "not_a_real_user@bboxx.co.uk",
        "password": "not_a_real_pass",
    }
    
    r = requests.get(url=url, params=params, headers=headers)

    r.json()
    >>> {
        "status": "success",
        "message": "Successfully checked the username not_a_real_user@bboxx.co.uk with it's password",
        "data": "False" 
        }
    }
```

This endpoint can be called by users with `SYSTEM` privileges to validate whether a username is valid.

If the username/password combination is valid the response_code will be 200 and the payload in "data" will be "True"
If the username/password combination is invalid the response_code will still be 200 but the payload in "data" will be `False`

  | value
--:|:------
endpoint | `/auth/validate_user_and_password`
method(s) | `GET`
permissions |  `SYSTEM`
params | username <font color="DarkGray">_(str)_</font> password <font color="DarkGray">_(str)_</font>
payload | N/A
response | `200`