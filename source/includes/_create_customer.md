## `/customers/create_customer`
### Description

> We are required to send the entity_id and *either* the external_customer_id (int) *or* the external_customer_code (str) or both.

```python
url = "http://smartapi.bboxx.co.uk/v1/customers/create_customer"
data = json.dumps({
    "name": "Test Customer",
    "external_customer_id": 1234,
    "external_customer_code": 'tc_0123',
    "entity_id": test_entity_id
})
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

r = requests.put(url=url, data=data, headers=headers)

print r
>>> "status": "success",
            "message": "Created Test Customer(1234) successfully",
            "data": {
                "name": Test Customer,
                "customer_id": 1,
                "external_customer_id": 1234,
                "external_customer_code": tc_0123,
                "entity_id": 4,
                "customer_entity_linker_id": 1
            }
```

> Here's an example with only external_customer_code supplied.

```python
url = "http://smartapi.bboxx.co.uk/v1/customers/create_customer"
data = json.dumps({
    "name": "Test Customer",
    "external_customer_code": 'tc_0123',
    "entity_id": test_entity_id
})
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

r = requests.put(url=url, data=data, headers=headers)

print r
>>> "status": "success",
            "message": "Created Test Customer(None) successfully",
            "data": {
                "name": Test Customer,
                "customer_id": 1,
                "external_customer_id": None,
                "external_customer_code": tc_0123,
                "entity_id": 4,
                "customer_entity_linker_id": 1
            }
```

> If neither `external_customer_code` or `external_customer_id` are supplied the API will return the following error.

```python
url = "http://smartapi.bboxx.co.uk/v1/customers/create_customer"
data = json.dumps({
    "name": "Test Customer",
    "entity_id": test_entity_id
})
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

r = requests.put(url=url, data=data, headers=headers)
print r.json()
>>> {
        "validation_errors":
            {"missing_data": "Missing external_customer_id and external_customer_code."}
    }
```

> Customers with-in an entity cannot be duplicated

```python
print r.json()
>>> {
        "validation_errors":
            {"external_customer_id": "The pairing of external_customer_id(1234) and entity_id #4 is not unique."}
    }
```
This endpoint is required to create a new <a href=/#customer>`Customer`</a> in the system. Customers are complex since they need to be linked to their  <a href=/#entity>`entity`</a> at creation time. In addition SMARTSolar will keep a unique identifier for each <a href=/#customer>`Customer`</a> (`customer_id`) which is different to the identifier of the third party (`external_customer_id` or `external_customer_code`). Therefore this endpoint is separate to provide the control required to create unique customers successfully.


### Endpoint
To create a new <a href=/#customer>`Customer`</a> send a `POST` request to `/customers/create_customer`

    | value
---:|:------
__endpoint__ | `/customers/create_customer`
__method__ | `POST`
__url_params__ | N/A
__payload__ | entity_id, name <font color="DarkGray">_(optional)_</font>, external_customer_id <font color="DarkGray">_(optional)_</font>, external_customer_code <font color="DarkGray">_(optional)_</font>, reason <font color="DarkGray">_(optional)_</font>
__response__ | 201
__permissions__ | `ADMIN`


### Identifying Customers
Each <a href=/#customer>`Customer`</a> has a unique integer id in the SMARTSolar system. However external parties are likely to have their own, independent, ways of identifying customers. External parties will want to access their customers using their external_id's but internally SMARTSolar will have to use the unique interger assigned during creation. In addition, the format of the external identifier could be an integer or a string. To account for this the <a href=/#customer>`Customer`</a> object has the following fields:

* `customer_id` - An integer created and handled internally by the SMARTSolar system.
* `external_customer_id` <font color="DarkGray">_(int)_</font> - uniquely identifies that <a href=/#customer>`Customer`</a> with-in that third party entity.
* `external_customer_code` <font color="DarkGray">_(str)_</font> - uniquely identifies that <a href=/#customer>`Customer`</a> with-in that third party entity.


The combination of `external_customer_+(id/code)` and the <a href=/#entity>`Entity`</a> that the <a href=/#customer>`Customer`</a> belongs to __MUST__ be unqiue. An attempt to make multiple customers in the same entity with the same `external_customer_(id/code)` with result in the following error from the API.

`{"validation_errors": {"external_customer_id": "The pairing of external_customer_id(1234) and entity_id #4 is not unique."}}`


