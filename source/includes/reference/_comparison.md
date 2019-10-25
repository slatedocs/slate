# Comparison

## Request comparison quotes

> Example Request:

```shell
curl -X GET https://api.transferwise.com/v3/comparisons/?sourceCurrency=GBP&targetCurrency=EUR&sendAmount=10000
```

> Example Response:

```json
{
  "sourceCurrency": "GBP",
  "targetCurrency": "EUR",
  "sourceCountry": null,
  "targetCountry": null,
  "providerCountry": null,
  "providerType": null,
  "sendAmount": 10000.0,
  "providers": [
    {
      "id": 39,
      "alias": "transferwise",
      "name": "TransferWise",
      "logo": "https://dq8dwmysp7hk1.cloudfront.net/logos/transferwise.svg",
      "type": "moneyTransferProvider",
      "partner": false,
      "quotes": [
        {
          "rate": 1.15989,
          "fee": 37.12,
          "receivedAmount": 11555.84,
          "dateCollected": "2019-10-22T14:36:43Z",
          "sourceCountry": null,
          "targetCountry": null,
          "markup": 0.0,
          "deliveryEstimation": {
            "duration": {
              "min": "PT20H8M16.305111S",
              "max": "PT20H8M16.305111S"
            },
            "providerGivesEstimate": true
          }
        }
      ]
    },
    {
      "id": 1,
      "alias": "barclays",
      "name": "Barclays",
      "logo": "https://dq8dwmysp7hk1.cloudfront.net/logos/barclays.svg",
      "type": "bank",
      "partner": false,
      "quotes": [
        {
          "rate": 1.12792426,
          "fee": 0.0,
          "receivedAmount": 11279.24,
          "dateCollected": "2019-10-22T14:00:04Z",
          "sourceCountry": "GB",
          "targetCountry": "ES",
          "markup": 2.75592858,
          "deliveryEstimation": {
            "duration": {
              "min": "PT24H",
              "max": "PT24H"
            },
            "providerGivesEstimate": true
          }
        },
        ...
        {
          "rate": 1.12792426,
          "fee": 0.0,
          "receivedAmount": 11279.24,
          "dateCollected": "2019-10-22T14:00:04Z",
          "sourceCountry": "GB",
          "targetCountry": "FI",
          "markup": 2.75592858,
          "deliveryEstimation": {
            "duration": {
              "min": "PT24H",
              "max": "PT24H"
            },
            "providerGivesEstimate": true
          },
          ...
        }
        ...
      ]
    }
  ]
}
```

The comparison API can be used to request price and speed information about various money transfer providers. This includes not only TransferWise but other providers in the market.


### Price Estimation

The quotes (price / speed) provided by this API are based off of real quotes collected from 3rd party websites. We collect both the advertised exchange rate and fee for each provider for various amounts. When a comparison is requested we calculate the markup % on the collected exchange rate on the mid-market rate at the time of collection, we then apply this markup % on the current mid-market rate to provide a realistic estimate of what each provider offers. We collect data for all providers ~ once per hour to ensure we provide as accurate and up to date information as possible.

Note: Today, we only provide estimations for FX transactions with a Bank Transfer pay-in / pay-out option. This is important to stress as many providers offer significantly different fees / exchange rates when used debit / credit card, cash etc.

For more details on the data collection process please see the following page:

[https://transferwise.com/gb/compare/disclaimer](https://transferwise.com/gb/compare/disclaimer)

If you have questions or suspect any data to be inaccurate or incomplete please contact us at:

[comparison@transferwise.com](mailto:comparison@transferwise.com)


### Delivery Estimation

Similar to price, we collect speed data for most (if not all) providers which we have price information for. Many providers display speed estimates to their customers in a number of different ways. 

Some examples:

- "The transfer should be complete within 2-5 days"
- "The money should arrive in your account within 48 hours"
- "Should arrive by 26th Aug"
- "Could take up to 4 working days"

The below API intends to model these in a consistent format by providing a min / max range for all delivery estimations. An estimate that states "up to X" will have "max" set to a duration but "min" as null, a "from X" will have "min" set to a duration and "max" as null. Finally for those providers who offer a specific, point in time estimation (like TransferWise), the API will surface a duration where min/max are equal. 


### Quotes structure

In order to provide the most flexible and accurate data for clients, we surface a denormalised list of quotes per provider where each quote represents a unique collection of comparison "dimensions". 

A single given provider may expose multiple quotes for the same currency route. The most common example is where a provider offers different pricing for one country vs another country which uses the same currency. e.g:

Provider X:

- GBP EUR 1000 [GB -> ES] fee: 10, rate: 1.5
- GBP EUR 1000 [GB -> DE] fee: 8, rate: 1.5
- GBP EUR 1000 [GB -> FR] fee: 10, rate: 1.35

The same principle applies for speed. I.e a provider may have different speed estimates for different target countries and hence we expose these as discrete quotes - where a quote is a unique combination of route / country / speed / price factors.

A client may choose to reduce this set of quotes down to a single or several quotes in order to display a relevant quote to a given user. An example where we take the cheapest quote for a given currency route (and also surface the target country) can be seen at the below link:

[https://transferwise.com/gb/compare/?sourceCurrency=GBP&targetCurrency=EUR&sendAmount=1000](https://transferwise.com/gb/compare/?sourceCurrency=GBP&targetCurrency=EUR&sendAmount=1000)


### Request

**`GET https://api.transferwise.com/v3/comparisons/?sourceCurrency=GBP&targetCurrency=EUR&sendAmount=10000`**

Field (Query Param)   | Description                                                     | Format
---------             | -------                                                         | -----------
sourceCurrency        | ISO 4217 source currency code                                   | Text
targetCurrency        | ISO 4217 target currency code                                   | Text
sendAmount            | Amount in source currency                                       | Decimal
sourceCountry         | (Optional) Filter by source country (ISO 3166-1 Alpha-2 code)   | Text
targetCountry         | (Optional) Filter by target country (ISO 3166-1 Alpha-2 code)   | Text
providerType          | (Optional) Filter by provider type                              | One of "bank","moneyTransferProvider"


### Response

Field                                           | Description                                                        | Format
---------                                       | -------                                                            | -----------
id                                              | Provider id                                                        | Integer
alias                                           | Provider alias (lowercase slug name)                               | Text
name                                            | Provider name (presentational / formal name)                       | Text
logo                                            | URL pointing to provider logo (default svg format)                 | Text
type                                            | Provider type                                                      | Text
partner                                         | Whether a partner of TransferWise or not                           | Boolean
quotes                                          | An array of estimated quotes per provider                          | Array
quotes.rate                                     | The live estimated exchange for the provider for this quote        | Timestamp
quotes.fee                                      | The estimated fee for the provider for this quote                  | Integer
quotes.receivedAmount                           | The total estimated receive amount for the provider for this quote | Integer
quotes.dateCollected                            | The date of collection for the original quote                      | Text
quotes.sourceCountry                            | Source country (ISO 3166-1 Alpha-2 code)                           | Timestamp
quotes.targetCountry                            | Target country (ISO 3166-1 Alpha-2 code)                           | Decimal
quotes.deliveryEstimation                       | Delivery estimation details - i.e a speed estimate                 | Object
quotes.deliveryEstimation.duration              | Duration range                                                     | Object
quotes.deliveryEstimation.duration.min          | Minimum quoted time for transaction delivery                       | ISO 8601 duration format
quotes.deliveryEstimation.duration.max          | Maximum quoted time for transaction delivery                       | ISO 8601 duration format
quotes.deliveryEstimation.providerGivesEstimate | Whether a provider publicly surfaces / exposes a speed estimate    | Boolean
