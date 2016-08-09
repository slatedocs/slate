## `/home`
```python
url = "http://smartapi.bboxx.co.uk/v1/home"
r = requests.get(url)

print r
>>> <Response 200> 

print r.text
>>> "Welcome to the SMARTSolar API: 2016-08-09T10:14:48.318496"
```

### Description

The `/home` endpoint provides a quick way to confirm that the endpoint is up and running. A simple `GET` or `POST` request will generate a 200 response if the API is running. 

The endpoint does not require authentication and can also be access from a standard web-browser:  
`http://smartapi.bboxx.co.uk/v1/home`

The response will also return (in plain text) `Welcome to the SMARTSolar API: <timestamp>`. 