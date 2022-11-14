# General Information
## Definitions
  **Assets:** are cryptocurrencies or fiat currencies. Each asset has a 3/4 letter code (e.g. BTC, USDC). A derivative contract on Delta Exchange will entail multiple assets, namely:

   - **Underlying Asset:** This is the asset over which a futures or perpetual contract is defined. For e.g. the underlying asset of the BTCUSD perpetual contract is BTC. 

   - **Quoting Asset:** The asset in which price of the quoting is called the quoting asset. For e.g. the BTCUSD contract is quoted in USD. Therefore, the quoting asset of the contract is USD.
   
   - **Settling Asset:** The asset in which the margin and Profit/ Loss of a contract is denominated. For e.g. the BTCUSD contract is margined and settled in BTC. Therefore, the settling asset of the contract is BTC.

**Products**: are the derivative contracts listed on Delta Exchange. Each contract can be referred by either its Product ID (e.g. 27 is the Product ID of BTCUSD contract) or Symbol (BTCUSD is the symbol for BTCUSD contract). It is worth noting that Orders, Orderbook APIs expect Product IDs. 
e.g

product_id| symbol |product_type| description
--|--|--|--
27  |BTCUSD|inverse_future|Bitcoin Perpetual futures, quoted in US Dollar and settled & margined in BTC
45|XRPUSDQ|future|XRP/USD perpetual futures USDC Quanto, quoted in US Dollar and settled & margined in USDC
46|BTCUSD_27Dec|inverse_future|27th December Bitcoin future quoted in US Dollar


## Symbology

**Contract symbol:** has the following format

    Underlying Asset| Quoting Asset|Q (optional; applicable only to quanto contracts)|_|Matruity Date (optional, applicable only for futures contracts)
    
    e.g. BTCUSD, BTCUSD_27Dec, LEOUSDQ
  
**Mark Price:** Each contract has a unique [Mark Price](https://www.delta.exchange/user-guide/)  which can be referred to by: **MARK: Contract_Symbol (MARK:BTCUSD)** 

**Index Price:** The prices of the underlying assets for the contracts listed on Delta Exchange are obtained from various spot exchanges, and are computed by averaging prices from multiple exchanges. Details of all the indices are available on this [page](https://www.delta.exchange/indices/).
  

For a given Underlying Asset/ Quoting Asset pair, the Index price symbol is: ***.DE|Underlying Asset|Quoting Asset|*** 
e.g. **.DEBNBXBT**
It is important to note that the BTCUSD Index price doesn't follow this convention as its symbol is **.DEXBTUSD**.

  
## Pagination
Pagination allows to fetch data page-wise. We use cursor based pagination where each response metadata contains a before and after cursor. The cursor needs to passed on with the next request to paginate over the result. Please note that the cursors are updated with each new page.

Pagination can be called in following APIs

API|End point|
--|--
Products|/products
Orders|/orders
Orders History|/orders/history
Fills|/fills
Wallet transactions|/wallet/transactions

**Pagination parameters**

  - after 
    - after cursor to fetch the next page
  - before 
    - before cursor to fetch the previous page
  - page_size
    - page size for pagination

In API response, meta data will contain the cursors as show below

```
{
  success: true,
  result: [ {}, {}, .....],
  meta: {
    after: "an_arbitary_string",
    before: "another_arbitary_string"
  }
}
```
  
**Example**

https://api.delta.exchange/v2/products?page_size=30

https://api.delta.exchange/v2/products?page_size=30&after=after_cursor_from_last_request

## Data Centers 
Delta Exchange data centers are in **AWS Tokyo**