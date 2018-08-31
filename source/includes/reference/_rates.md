# Exchange Rates
## Get Exchange Rates
> Example Request:

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD"
     -H "Authorization: <your api token>"
```

> Example Response:

```json
[
    {
        "rate": 1.166,
        "source": "EUR",
        "target": "USD",
        "time": "2018-08-31T10:43:31+0000"
    }
]
```
**`GET https://api.sandbox.transferwise.tech/v1/rates`**

Fetch latest exchange rates of all currencies.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD`**

Fetch latest exchange rate of one currency pair.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&time=2017-02-13T14:53:01`**

Fetch exchange rate of specific historical timestamp.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2017-02-13T14:53:01&to=2017-03-13T14:53:01&group=day`**

Fetch exchange rate history over period of time with daily interval.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2017-02-13T14:53:01&to=2017-03-13T14:53:01&group=hour`**

Fetch exchange rate history over period of time with hourly interval.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2017-02-13T14:53:01&to=2017-03-13T14:53:01&group=minute`**

Fetch exchange rate history over period of time with 10 minute interval.<br/>


### Request

Field                 | Description                                                        | Format
---------             | -------                                                            | -----------
source                | Source(send) currency code.                                        | Text
target                | Target(receive) currency code.                                     | Text
time                  | Timestamp to get historic exchange rate for specific time/date.    | Timestamp
from                  | Period start date to get exchange rate history.                    | Timestamp
to                    | Period end date to get exchange rate history.                      | Timestamp
group                 | Interval: day;hour;minute                                          | Text




### Response

List of exchange rate values which meet your query criteria.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
rate                  | Exchange rate value.                          | Decimal
source                | Source(send) currency code                    | Text
target                | Target(receive) currency code                 | Text
time                  | Timestamp for exchange rate.                  | Timestamp


