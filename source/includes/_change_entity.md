## `/products/<imei>/change_entity`

Since a <a href="#/product">`Product`</a> can be assigned to multiple entities a specific endpoint is required to change the entity that a product belongs to. 

> A `PUT` request to this endpoint changes the specified entity to an another entity.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/change_entity"
    data = json.dumps({
        "old_entity_id": 5,
        "new_entity_id": 6
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data headers=headers)

    print r.json()
    >>>{
        "status": "success"
        "message": "Product #000000000000000 assigned to entity: 4",
        "data": {
            "000000000000000": ["BBOXX Capital Kenya"]
        },
    }
```

This endpoint is used to change the entity to which a unit is. A succesful request will generate a 200 response and return a list of all entites that this unit is assigned to. 

    | value 
---:|:------
__endpoint__ | `/products/<imei>/change_entity`
__method__ | `PUT`
__url_params__ | `product_imei` _(int)_
__payload__ | `{"old_entity_id": <id>, "new_entity_id": <id>}`
__response__ | 200

### Entity Id
The body of the `PUT` should be a valid `entity_id`. You can see a list of entities by querying the `/entities` endpoint.

### Unknown Entity
All units with no entity are assigned to entity #1 - Unknown Entity. This entity is removed as soon as a new entity is assigned to the unit. If all entities are removed the unit is re-assigned to Unknown Entity. 

### Multiple Entities
A unit can be assigned to many entities. 
To add a new entity to the existing list simply use `/products/<imei>/assign_entity`. 
To change the entity rather than adding a new entity see `/products/<imei>/change_entity`
To remove an entity see `/products/<imei>/remove_entity

