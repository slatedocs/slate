## GetProduct

**Category:** User<br />
**Permissions:** Public<br />
**Call Type:** Synchronous

Retrieves the details about a specific product on the trading venue. A product is an asset that is tradable or paid out.

### Request

```json
{
  "OMSId":  1,
  "ProductId":  1
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OMSId     | **integer.** The ID of the Order Management System that includes the product. |
| ProductId | **long integer.** The ID of the product on the specified Order Management System. |

### Response

```json
{
    "omsId":0,
    "productId":0,
    "product":null,
    "productFullName":null,
    "productType":0,
    "decimalPlaces":0.0,
    "tickSize":0.0,
    "noFees":false
}
```

| Key             | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| omsId           | **integer.** The ID of the Order Management System that offers the product. |
| productId       | **long integer.** The ID of the product.                     |
| product         | **string.** “Nickname” or shortened name of the product. For example, NZD (New Zealand Dollar). |
| productFullName | **string.** Full and official name of the product. For example, New Zealand Dollar. |
| productType     | **string.** The nature of the product. One of:<br />0 Unknown (an error condition)<br />1 NationalCurrency<br />2 CryptoCurrency<br />3 Contract |
| decimalPlaces   | **integer.** The number of decimal places in which the product is divided. The maximum is 8. For example, US Dollars are divided into 100 units, or 2 decimal places. Other products may be different. Burundi Francs use 0 decimal places and the Rial Omani uses 3. |
| tickSize        | **real.**  The smallest increment in which the product may trade. |
| noFees          | **Boolean.** Shows whether trading the product incurs transaction fees. The default is *false*; that is, if *NoFees* is *false*, transaction fees will be incurred. If *NoFees* is *true*, no fees are incurred. |

