## `/products/<imei>/assign_entity`

> A `PUT` request to this endpoint assigns an entity to the specified entity.

```python
    url = http://smartapi.bboxx.co.uk/v1/products/000000000000/assign_entity
    data = json.dumps("entity_id": 5)
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Product #866771029508370 assigned to entity: 5", 
        "data": {
            "866771029508370": ["Test Entity"]
        }
    }
```

This endpoint is used to assign an entity to a unit. A succesful request will generate a 200 response and return a list of all entites that this unit is assigned to. 

    | value 
---:|:------
__endpoint__ | `/products/<imei>/assign_entity`
__method__ | `PUT`
__url_params__ | `product_imei` _(int)_
__payload__ | `{"entity_id": <id>}`
__response__ | 200

### Entity Id
The body of the `PUT` should be a valid `entity_id`. You can see a list of entities by querying the `/entities` endpoint. +

## Unknown Entity
All units with no entity are assigned to entity #1 - Unknown Entity. This entity is removed as soon as a new entity is assigned to the unit. If all entities are removed the unit is re-assigned to Unknown Entity. 

### Multiple Entities
A unit can be assigned to many entities. 
To add a new entity to the existing list simply use `/products/<imei>/assign_entity`. 
To change the entity rather than adding a new entity see `/products/<imei>/change_entity`
To remove an entity see `/products/<imei>/remove_entity

