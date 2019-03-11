

# Symbols Company APIs

Requires authentication.

## Get Company People

Returns company people for a given symbol.

```APIs
GET https://dev.zoomsymbols.com/api/v2/symbols/getCompanyPeople
```

> Parameters

```
(Must be given at least one parameter.)
symbol: your_symbol
symbolId: symbol_id
```

> Response

```json
{
    "result": [
        {
           "company_id": 21835,
           "symbol_id": "34378",
           "symbol_value": "MSFT",
           "company_name": "Microsoft Corporation",
           "person_info_id": 9503042,
           "person_name_prefix": "Mr.",
           "person_name": "Ali El Faramawy",
           "job_title": "Head of The Emerging Markets Digital Transformation Organisation"
        },
        ...
    ]
}
```
