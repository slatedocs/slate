## GetOrderFee

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Returns an estimate of the transaction fee for a specific order side, instrument, and order type. Fees are set and calculated by the operator of the trading venue.

The exchange generally deducts fees from the "receiving" side of the trade (although an operator can modify this). There are two products in every trade (and in every instrument); for example, the instrument BTCUSD comprises a BitCoin product and a US dollar product. Placing a buy order on the book causes fees to be deducted from Product 1, in this case, BitCoin; placing a sell order causes fees to be deducted from Product 2, in this case, US dollar.

A user with Trading permission can get fee estimates for any account that user is associated with and for any instrument or product that that account can trade; a user with Operator permission can get fee estimates for any account, instrument, or product.

### Request

```json
{
    "omsId":0,
    "accountId":0,
    "instrumentId":0,
    "productId":0,
    "amount":0.0,
    "price":0.0,
    "orderType":0,
    "makerTaker":0,
    "side":0
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| omsId        | **integer.** The ID of the Order Management System on which the trade would take place. |
| accountId    | **integer.** The ID of the account requesting the fee estimate. |
| instrumentId | **integer.** The proposed instrument against which a trading fee would be charged. |
| productId    | **integer.** The ID of the product (currency) in which the fee will be denominated. |
| amount       | **real.** The quantity of the proposed trade for which the Order Management System would charge a fee. |
| price        | **real.** The price at which the proposed trade would take place. Supply your price for a limit order; the exact price is difficult to know before execution. |
| orderType    | **integer..** The type of the proposed order. One of:<br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade<br /> |
| makerTaker   | **integer.** Depending on the venue, there may be different fees for a maker (one who places the order on the books, either buy or sell) or taker (one who accepts the order, either buy or sell). If the user places a large order that is only partially filled, he is a partial maker.<br />0 Unknown<br />1 Maker<br />2 Taker |
| side         | **integer.** One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown |

### Response

```json
{
  "OrderFee":  0.01,
  "ProductId":  1 
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OrderFee  | **real.** The estimated fee for the trade as described. The minimum value is 0.01. |
| ProductId | **integer.** The ID of the product (currency) in which the fee is denominated. |


