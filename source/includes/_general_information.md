# General Information
## Definitions
  **Assets:** are cryptocurrencies or fiat currencies. Each asset has a 3/4 letter code (e.g. BTC, USDC). A derivative contract on Delta Exchange will entail multiple assets, namely:

   - **Underlying Asset:** This is the asset over which a futures or perpetual contract is defined. For e.g. the underlying asset of the BTCUSD perpetual contract is BTC. 

   - **Quoting Asset:** The asset in which price of the quoting is called the quoting asset. For e.g. the BTCUSD contract is quoted in USD. Therefore, the quoting asset of the contract is USD.
   
   - **Settling Asset:** The asset in which the margin and Profit/ Loss of a contract is denominated. For e.g. the BTCUSD contract is margined and settled in BTC. Therefore, the settling asset of the contract is BTC.

**Products**: are the derivative contracts listed on Delta Exchange. Each contract can be referred by either its Product ID (e.g. xx is the Product ID of BTCUSD contract) or Symbol (yy is the symbol for BTCUD contract). It is worth noting that xx APIs expect Product IDs. All other APIs work with Symbols.

## Symbology

**Contract symbol:** has the following format

    Underlying Asset| Quoting Asset|Q (optional; applicable only to quanto contracts)|_|Matruity Date (optional, applicable only for futures contracts)
    
    e.g. BTCUSD, BTCUSD_27Dec, LEOUSDQ
  
**Mark Price:** Each contract has a unique [Mark Price](https://www.delta.exchange/user-guide/)  which can be referred to by: **MARK: Contract_Symbol (MARK:BTCUSD)** 

**Index Price:** The prices of the underlying assets for the contracts listed on Delta Exchange are obtained from various spot exchanges, and are computed by averaging prices from multiple exchanges. Details of all the indices are available on this [page](https://www.delta.exchange/indices/).
  

For a given Underlying Asset/ Quoting Asset pair, the Index price symbol is: ***.DE|Underlying Asset|Quoting Asset|*** 
e.g. **.DEBNBXBT**
It is important to note that the BTCUSD Index price doesn't follow this convention as its symbol is **.DEXBTUSD**.

  

## Data Centers 
Delta Exchange data centers are in AWS Ireland