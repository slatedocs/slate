

# Portfolio APIs

You can manage your Portfolios objects

> Notes
> `visibility` of Portfolio refer to how the object will appear to other users, can be of of the following:

```
P: Private portfolio (Default)
O: Open/Public Portfolio
```

## Add Portfolio

Add new Portfolio object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/create
```
> BODY

```json
{
  "name":"Portfolio Name",
  "visibility" : "P",
  "item_data":{
  	"currency_code" : "ILS",
    "default_commision" : 20,
    "notes":"test notes 2"
  }
}
```
> Response

```json
{
    "result": {
        "id": 10154,
        "name": "Portfolio Title",
        "user_id": "xxxx",
        "display_name": "xxxxx",
        "user_item_type_id": 23,
        "user_item_type_code": "portfolio",
        "visibility_code": "P",
        "visibility_name": "Private",
        "list_order": null,
        "create_date": "2019-02-08T12:32:54.776882",
        "modify_date": "2019-02-08T12:32:54.776882",
        "is_enable": true,
        "is_deleted": false,
        "can_write": true,
        "can_read": true,
        "is_fav": false,
        "item_data": [
            {
                "currency_id": 72,
                "currency_name": "Israeli Shekel",
                "iso_code": "ILS",
                "default_commision": 20,
                "notes": "test notes 2",
                "transactions": []
            }
        ]
    }
}
```


## Edit Profile

Edit your Portfolio object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/update
```
> BODY

```json
{
  "id": 10154,
  "name":"Portfolio Name 2",
  "visibility" : "P",
  "item_data":{
  	"currency_code" : "ILS",
    "default_commision" : 20,
    "notes":"test notes 2"
  }
}
```
> Response

```json
{
    "result": {
        "id": 10154,
        "name": "Portfolio Title 2",
        "user_id": "xxxx",
        "display_name": "xxxxx",
        "user_item_type_id": 23,
        "user_item_type_code": "portfolio",
        "visibility_code": "P",
        "visibility_name": "Private",
        "list_order": null,
        "create_date": "2019-02-08T12:32:54.776882",
        "modify_date": "2019-02-08T12:32:54.776882",
        "is_enable": true,
        "is_deleted": false,
        "can_write": true,
        "can_read": true,
        "is_fav": false,
        "item_data": [
            {
                "currency_id": 72,
                "currency_name": "Israeli Shekel",
                "iso_code": "ILS",
                "default_commision": 20,
                "notes": "test notes 2",
                "transactions": []
            }
        ]
    }
}
```