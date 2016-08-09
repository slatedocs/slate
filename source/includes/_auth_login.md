## `/auth/login`
> A simple `POST` request with correct details yields the following response:   

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
This is the endpoint used to generate a token.  For a full explanation see <a href=/#authentication-and-permissions>Authentication and Permissions.</a>

  | value
--:|:------
endpoint | `/auth/login`
method(s) | `POST`
permissions |  N/A
params | N/A
payload | username and password (unformatted)
response | `200`

