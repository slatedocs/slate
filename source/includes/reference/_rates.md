# Exchange Rates
## List
> Example Request (Bearer token):

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD" \
     -H "Authorization: Bearer <your api token>"
```

> Example Request (Basic authentication):

```shell
curl -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD" \
     --user <your api client_id>:<your api client_secret> 
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

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&time=2019-02-13T14:53:01`**

Fetch exchange rate of specific historical timestamp.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2019-02-13T14:53:01&to=2019-03-13T14:53:01&group=day`**

Fetch exchange rate history over period of time with daily interval.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2019-02-13T14:53:01&to=2019-03-13T14:53:01&group=hour`**

Fetch exchange rate history over period of time with hourly interval.<br/>

**`GET https://api.sandbox.transferwise.tech/v1/rates?source=EUR&target=USD&from=2019-02-13T14:53:01&to=2019-03-13T14:53:01&group=minute`**

Fetch exchange rate history over period of time with 10 minute interval.<br/>




### Request

Note that this endpoint supports two types of authentication: Bearer token and Basic authentication (client_id/client_secret).

Field                 | Description                                                        | Format
---------             | -------                                                            | -----------
source                | Source(send) currency code.                                        | Text
target                | Target(receive) currency code.                                     | Text
time                  | Timestamp to get historic exchange rate.                           | Timestamp
from                  | Period start date/time to get exchange rate history.               | Timestamp or Date
to                    | Period end date/time to get exchange rate history.                 | Timestamp or Date
group                 | Interval: *day* *hour* *minute*                                    | Text




### Response

List of exchange rate values which meet your query criteria.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
rate                  | Exchange rate value.                          | Decimal
source                | Source(send) currency code                    | Text
target                | Target(receive) currency code                 | Text
time                  | Timestamp for exchange rate.                  | Timestamp




### Additional notes about date/time formatting used above

The request/response field(s) below support both Timestamp (combined date and time) and Date (date only) formats:

Field                  | Sample
---------              | ---------
from                   | 2019-03-13T14:53:01 or 2019-03-13
to                     | 2019-03-13T14:53:01+0100 or 2019-03-13+0100

The request/response field(s) below support only Timestamp (combined date and time):

Field                  | Sample
---------              | ---------
time                   | 2019-03-13T14:53:01 or 2019-03-13T14:53:01+0100

Timezone offset is supported but optional.

