# Metadata

## Get metadata

```shell
curl --location --request GET 'https://api.sx.bet/metadata'
```

> The above command returns JSON structured like this

```json
{
  "status": "success",
  "data": {
    "executorAddress": "0x52adf738AAD93c31f798a30b2C74D658e1E9a562",
    "oracleFees": {
      "0xA173954Cc4b1810C0dBdb007522ADbC182DaB380": "2600000000000000000",
      "0xe2aa35C2039Bd0Ff196A6Ef99523CC0D3972ae3e": "2600000000000000000",
      "0xaa99bE3356a11eE92c3f099BD7a038399633566f": "2600000000000000000"
    },
    "sportXAffiliate": {
      "address": "0xa21ac1436f7fcD43008c9473A78433339E222FcA",
      "amount": "1400000000000000000"
    },
    "makerOrderMinimums": {
      "0xA173954Cc4b1810C0dBdb007522ADbC182DaB380": "5000000000000000",
      "0xe2aa35C2039Bd0Ff196A6Ef99523CC0D3972ae3e": "10000000",
      "0xaa99bE3356a11eE92c3f099BD7a038399633566f": "30000000000000000000"
    },
    "takerMinimums": {
      "0xA173954Cc4b1810C0dBdb007522ADbC182DaB380": "2500000000000000",
      "0xe2aa35C2039Bd0Ff196A6Ef99523CC0D3972ae3e": "5000000",
      "0xaa99bE3356a11eE92c3f099BD7a038399633566f": "30000000000000000000"
    },
    "addresses": {
      "416": {
        "WETH": "0xA173954Cc4b1810C0dBdb007522ADbC182DaB380",
        "USDC": "0xe2aa35C2039Bd0Ff196A6Ef99523CC0D3972ae3e",
        "WSX": "0xaa99bE3356a11eE92c3f099BD7a038399633566f"
      }
    },
    "bettingEnabled": true,
    "totalVolume": 214120305.80276245,
    "domainVersion": "4.0",
    "EIP712FillHasher": "0x3E96B0a25d51e3Cc89C557f152797c33B839968f",
    "TokenTransferProxy": "0xCc4fBba7D0E0F2A03113F42f5D3aE80d9B2aD55d",
    "bridgeFee": 1
  }
}
```

This endpoint retrieves metadata on the exchange itself and useful parameters to interact with the exchange.

### HTTP Request

`GET https://api.sx.bet/metadata`

### Response format

| Name               | Type    | Description                                                                                                                                                                 |
| ------------------ | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| status             | string  | `success` or `failure` if the request succeeded or not                                                                                                                      |
| data               | any     | The metadata for the exchange                                                                                                                                               |
| executorAddress    | string  | The executor address for the sx.bet exchange. Use this address for setting the `executor` when posting new orders as a market maker                                         |
| oracleFees         | any     | A mapping from token address to a percentage indicating the fees paid on profit for each token. To convert to a readable number, divide by 10^20                            |
| sportXAffiliate    | any     | The default sx.bet affiliate. Currently set to 0 and unused                                                                                                                 |
| makerOrderMinimums | any     | A mapping from token address to a real token amount indicating the minimum maker order size. To convert into a readable amount, see [the token conversion section](#tokens) |
| takerMinimums      | any     | A mapping from token address to a real token amount indicating the minimum taker order size. To convert into a readable amount, see [the token conversion section](#tokens) |
| addresses          | any     | A mapping from network id -> canonical token name -> token address of assets supported by the exchange                                                                      |
| bettingEnabled     | boolean | `true` if betting is enabled for your region, false otherwise. See [here](https://help.sx.bet/en/articles/3613372-terms-and-conditions) for the supported regions           |
| totalVolume        | number  | All time total volume on the exchange                                                                                                                                       |
| domainVersion      | string  | Used in EIP712 signing                                                                                                                                                      |
| EIP712FillHasher   | string  | Address used in EIP712 signing for filling orders                                                                                                                           |
| TokenTransferProxy | string  | Address used in EIP712 signing for enabling betting                                                                                                                         |
| bridgeFee          | number  | USD fee for bridge transaction from Polygon to SX Network                                                                                                                   |
