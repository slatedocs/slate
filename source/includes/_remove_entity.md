## `/products/<imei>/remove_entity`

Use this endpoint to remove an entity from the product. 

> A `PUT` request to this endpoint removes the specified entity.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/remove_entity"
    data = json.dumps({
        "entity_id": 4,
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data headers=headers)

    print r.json()
    >>>{
        "status": "success"
        "message": "Entity #4 removed from Product #000000000000000",
        "data": {
            "000000000000000": ["BBOXX Capital Kenya"]
        },
    }
```

This endpoint is used to change the entity to which a unit is. A succesful request will generate a 200 response and return a list of all entites that this unit is assigned to. 

    | value 
---:|:------
__endpoint__ | `/products/<imei>/remove`
__method__ | `PUT`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"entity_id": <id>}`
__response__ | 200

### Entity Id
The body of the `PUT` should be a valid `entity_id`. You can see a list of all entities by querying the `/entities` endpoint and a list of the entites with a particular product by querying the Product Entity Linker.

### Unknown Entity
All units with no entity are assigned to entity #1 - Unknown Entity. This entity is removed as soon as a new entity is assigned to the unit. If all entities are removed the unit is re-assigned to Unknown Entity. 

### Multiple Entities
A unit can be assigned to many entities. 
To add a new entity to the existing list simply use `/products/<imei>/assign_entity`. 
To change the entity rather than adding a new entity see `/products/<imei>/change_entity`
To remove an entity see `/products/<imei>/remove_entity

