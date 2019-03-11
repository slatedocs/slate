

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


## Edit Portfolio

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

## Delete Portfolio

Delete your Portfolio object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/delete
```
> BODY

```json
{
  "itemId": 10153
}
```
> Response

```json
{
    "result": [
        {
            "id": 10153,
            "name": "xxxxx",
            "user_id": "5cde2208-1078-11e8-ae1b-83714d76deca",
            "display_name": "xxxxxx",
            "user_item_type_id": 23,
            "user_item_type_code": "portfolio",
            "visibility_code": "P",
            "visibility_name": "Private",
            "list_order": null,
            "create_date": "2019-02-08T10:32:09.965Z",
            "modify_date": "2019-02-11T09:22:37.460Z",
            "is_enable": false,
            "is_deleted": true,
            "can_write": false,
            "can_read": false,
            "is_fav": true
        }
    ]
}
```

## List Portfolios

List your Portfolio objects

```APIs
GET https://dev.zoomsymbols.com/api/user-portfolio-v2/list
```
> Params (Optional)

```
type: text
P: Private portfolio (Default)
O: Open/Public Portfolio
S: Shared Portfolio with current user
F: Fav Portfolio by current user
```
> Response

```json
{
  "result": [{
      "id": 10154,
      "name": "Portfolio Name 2",
      "user_id": "5cde2208-1078-11e8-ae1b-83714d76deca",
      "display_name": "Akram 5 akamal",
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
      "is_fav": null
    },
    ...
  ]
}
```

## Get Portfolio By Id

Get your Portfolio object by Id

```APIs
GET https://dev.zoomsymbols.com/api/user-portfolio-v2/get
```
> Params

```
itemId: the portfolio object id
```
> Response

```json
{
  "result": {
    "id": 10142,
    "name": "Portfolio title",
    "user_id": "96886a12-b727-11e8-a6f2-47a14068dc69",
    "display_name": "Hani.... Rihan....",
    "user_item_type_id": 23,
    "user_item_type_code": "portfolio",
    "visibility_code": "O",
    "visibility_name": "Open",
    "list_order": null,
    "create_date": "2019-02-07T14:34:42.787719",
    "modify_date": "2019-02-07T14:34:42.787719",
    "is_enable": true,
    "is_deleted": false,
    "can_write": false,
    "can_read": true,
    "is_fav": false,
    "item_data": [{
      "currency_id": 1,
      "currency_name": "Reported Currency",
      "iso_code": null,
      "default_commision": 0.2,
      "notes": "test notes",
      "transactions": [{
                        "transaction_id": 13,
                        "transaction_type": "cash",
                        "symbol_id": null,
                        "symbol_value": null,
                        "symbol_name": null,
                        "quantity": 6,
                        "trade_price": 11.2,
                        "commision": 0.2,
                        "currency_id": 72,
                        "currency_name": "Israeli Shekel",
                        "iso_code": "ILS",
                        "cash_deposits": 100,
                        "transaction_date": "2019-02-08",
                        "transaction_time": "16:00:00",
                        "notes": "test notes 2"
                      }
                      ,
                        ...
      ]
    }]
  }
}
```

## Favorite Portfolio

Favorite Portfolio object by id

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/addToFavorite
```
> BODY

```json
{
  "itemId": 10154
}
```
> Response

```json
{
    "result": {
        "id": 10154,
        "name": "Portfolio Name 2",
        "user_id": "5cde2208-1078-11e8-ae1b-83714d76deca",
        "display_name": "Akram 5 akamal",
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
        "is_fav": true,
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

## Unfavorite Portfolio

Favorite Portfolio object by id

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/removeFromFavorite
```
> BODY

```json
{
  "itemId": 10154
}
```
> Response

```json
{
    "result": {
        "id": 10154,
        "name": "Portfolio Name 2",
        "title": "Portfolio Name 2",
        "user_id": "5cde2208-1078-11e8-ae1b-83714d76deca",
        "display_name": "Akram 5 akamal",
        "user_item_type_id": 23,
        "user_item_type_code": "portfolio",
        "visibility_code": "P",
        "visibility_name": "Private",
        "list_order": null,
        "create_date": "2019-02-08T12:32:54.776882",
        "modify_date": "2019-02-11T11:19:04.774586",
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


## Share Portfolio

Share your Portfolio object with users

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/shareItemWith
```
> BODY

```json
{
  "itemId": 10154,
  "user": "username or email", // Optional
  "team": "Team Id", // Optional
  "can_read": true/false,
  "can_write": true/false
}
```
> Response

```json
{
    "result": [
        {
            "id": 10154,
            "user_id": "96886a12-b727-11e8-a6f2-47a14068dc69",
            "username": "hrihan",
            "display_name": "Hani.... Rihan....",
            "team_id": null,
            "team_name": null,
            "can_write": false
        }
    ]
}
```

## UnShare Portfolio

UnShare your Portfolio object with users

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/unshareItemWith
```
> BODY

```json
{
  "itemId": 10154,
  "user": "username or email", // Optional
  "team": "Team Id", // Optional
}
```


## List Sharing of Portfolio

List Sharings of Portfolio object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/listSharing
```
> BODY

```json
{
  "itemId": 10154
}
```
> Response

```json
{
    "result": [
        {
            "id": 10154,
            "user_id": "96886a12-b727-11e8-a6f2-47a14068dc69",
            "username": "hrihan",
            "display_name": "Hani.... Rihan....",
            "team_id": null,
            "team_name": null,
            "can_write": false
        }
    ]
}
```

## Add Transaction

Add new transaction to portfolio object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/addTransaction
```
> BODY

```json
{  
  "itemId" : 10147, 
  "transaction_type":"cash",
  "quantity" : 6,
  "trade_price" : 11.2,
  "commision" : 0.2,
  "currency_code" : "USD",
  "cash_deposits" : 100,
  "transaction_date" : "2019-02-08",
  "transaction_time" : "16:00",
  "notes" : "test notes 2"
}
```
> Response

```json
{
    "result": {
        "transaction_id": 14,
        "transaction_type": "cash",
        "symbol_id": null,
        "symbol_value": null,
        "symbol_name": null,
        "quantity": 6,
        "trade_price": 11.2,
        "commision": 0.2,
        "currency_id": 161,
        "currency_name": "US Dollar",
        "iso_code": "USD",
        "cash_deposits": 100,
        "transaction_date": "2019-02-08",
        "transaction_time": "16:00:00",
        "notes": "test notes 2"
    }
}
```

## Update Transaction

Update your transaction object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/updateTransaction
```
> BODY

```json
{  
  "itemId" : 10147, 
  "transaction_type":"cash",
  "quantity" : 6,
  "trade_price" : 11.2,
  "commision" : 0.2,
  "currency_code" : "USD",
  "cash_deposits" : 100,
  "transaction_date" : "2019-02-08",
  "transaction_time" : "16:00",
  "notes" : "test notes 2"
}
```
> Response

```json
{
    "result": {
        "transaction_id": 14,
        "transaction_type": "buy",
        "symbol_id": 68,
        "symbol_value": "MSFT",
        "symbol_name": "Microsoft Corporation",
        "quantity": 6,
        "trade_price": 11.2,
        "commision": 0.2,
        "currency_id": 161,
        "currency_name": "US Dollar",
        "iso_code": "USD",
        "cash_deposits": 100,
        "transaction_date": "2019-02-08",
        "transaction_time": "16:00:00",
        "notes": "test notes 2"
    }
}
```

## Delete Transaction

Delete your transaction object

```APIs
POST https://dev.zoomsymbols.com/api/user-portfolio-v2/deleteTransaction
```
> BODY

```json
{  
  "transactionId":14
}
```
> Response

```json
{
    "result": {
        "transaction_id": 14,
        "transaction_type": "buy",
        "symbol_id": 68,
        "symbol_value": "MSFT",
        "symbol_name": "Microsoft Corporation",
        "quantity": 6,
        "trade_price": 11.2,
        "commision": 0.2,
        "currency_id": 161,
        "currency_name": "US Dollar",
        "iso_code": "USD",
        "cash_deposits": 100,
        "transaction_date": "2019-02-08",
        "transaction_time": "16:00:00",
        "notes": "test notes 2",
        "is_deleted": true
    }
}
```

## Get Transaction Dropdown items

For mobile UI, Get Transaction Dropdown items

```APIs
GET https://dev.zoomsymbols.com/api/user-portfolio-v2/getTransactionDropDownItems
```

> Response

```json
{
  "result": [{
      "code": "all",
      "name": "All"
    },
    {
      "code": "open",
      "name": "Open"
    },
    {
      "code": "close",
      "name": "Close"
    }
  ]
}
```

## Get Transaction Types

For mobile UI, Get Transaction types

```APIs
GET https://dev.zoomsymbols.com/api/user-portfolio-v2/getTransactionTypes
```

> Response

```json
{
  "result": [{
      "code": "buy",
      "name": "Buy"
    },
    {
      "code": "sell",
      "name": "Sell"
    },
    {
      "code": "cash",
      "name": "Cash"
    }
  ]
}
```

## Get Portfolio Summary 

For mobile UI, Get summary view for user's portfolio objects

```APIs
GET https://dev.zoomsymbols.com/api/user-portfolio-v2/getPortfolioSummary
```

> Response

```json
{
  "columns": [{
      "code": "portfolio_id",
      "name": "Portfolio Id",
      "styles": {
        "textAlign": "right"
      },
      "format": {
        "type": "number",
        "cellsFormat": "d",
        "formatValue": "0"
      }
    },
    {
      "code": "portfolio_name",
      "name": "Portfolio Name",
      "styles": {
        "textAlign": "left"
      }
    },
    {
      "code": "symbol_count",
      "name": "Stocks",
      "styles": {
        "textAlign": "right"
      },
      "format": {
        "type": "number",
        "cellsFormat": "d",
        "formatValue": "0"
      }
    },
    {
      "code": "profit",
      "name": "Gain",
      "styles": {
        "textAlign": "right"
      },
      "format": {
        "type": "number",
        "cellsFormat": "d",
        "formatValue": "2"
      },
      "width": 120
    },
    {
      "code": "profit_pct",
      "name": "Gain %",
      "styles": {
        "textAlign": "right"
      },
      "format": {
        "type": "number",
        "cellsFormat": "d",
        "formatValue": "2"
      },
      "width": 120
    }
  ],
  "result": [{
      "portfolio_id": 10147,
      "portfolio_name": "Akram portfolio title",
      "symbol_count": 2,
      "total_buy_value": "179.00",
      "total_sell_value": "291.00",
      "portfolio_value": "1393.44",
      "profit": "1214.44",
      "profit_pct": "578.46"
    },
    ...
  ]
}
```

## Get Transactions

Get all transactions for a given item id.

```APIs
GET https://dev.zoomsymbols.com/api/user-portfolio-v2/getTransactions
```

> Parameters

```
itemId: your_item_id
```

> Response

```json
{
    "columns": [
       {
           "code": "symbol_value",
           "name": "Symbol",
           "styles": {
               "textAlign": "left"
           },
           "width": 140,
           "fixed": true,
           "onPress": {
               "navigateTo": {
                   "screen": "Symbol",
                   "params": {
                       "symbolItem": {
                           "symbol_id": "{symbol_id}",
                           "symbol_value": "{symbol_value}",
                           "symbol_name": "{symbol_name}"
                       }
                   } 
               }
           }
       },
       ...
    ]
}
```
