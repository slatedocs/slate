


# Getting Started

  Delta is an exchange for trading of cryptocurrency derivatives. We currently offer Futures contracts on bitcoin (BTC) and ether (ETH). The following features stand us apart from other cryptocurrency exchanges:

-   **Leverage:** All derivative contracts traded on Delta have built in leverage of up to $100$x. This means that with say $100 worth of BTC, you can take a position of size $10000.
    
-   **Speculate or manage risk:** Our futures contracts can be used to benefit from both rise or fall in cryptocurrency prices or to hedge price risk.
    
-   **BTC settlement:** Fiat currencies are not supported on Delta. This means that all the calculations of profit/ loss as well as trade settlement in done in BTC terms.
    
Once you have created your account, you need to transfer BTC to your Delta Wallet before your can start trading.

  **Making your first trade on Delta**

  The trading dashboard of Delta is comprised of multiple panels. These include chart, order book/ recent trades, order submission and open orders & position panels. The functions and uses of these panels are delineated in the picture below.

![enter image description here](https://drive.google.com/file/d/1d3xUt7mWutD6w_4AUg6gDNlkOcxmGQKE/view?usp=sharing)

To place a trade, you need to:

-   Select the contract you are interested in
    
-   Specify the number of contracts that you are looking to buy/ sell
    
Decide on the order type (e.g. limit or market) and place it

 Once an order is placed, it will immediately show up in ‘Open Orders’ tab in the Balances panel. On execution of the order you acquire a new ‘Open position’ which displayed in the Balances panel.

 Trading derivatives is more involved and quite different from spot buying and selling of cryptocurrencies. The mechanics of margining, calculation of PnL, details of contract settlement may not be always obvious and we’d encourage you to browse through the Tutorials section as well as the rest of the documentation.

  We hope you have a happy and profitable trading experience on Delta!

# Tutorials

## Futures

A derivative is a financial security which derives its value from an underlying asset or group of assets. The derivative itself is a contract between two parties and its price is driven by fluctuations in the underlying asset.

 Futures is a type of derivative that is essentially an agreement between two parties to buy/ sell an asset (e.g. Ether) at a predetermined future date and price. There is a deterministic but complex relation between the price of the underlying asset and its Futures contract. However, simplistically, we can assume that both spot and Futures price tend to move in the same direction.

  
**Trading Futures vs. the underlying**

Futures offer several advantages over trading the underlying asset directly. Futures .. :

-   enable you to benefit from both price increases (long position) as well as declines (short position)
    
-   provide financial leverage
    
-   can be used to hedge price risk
    
-   tend to incur lower transaction fees
    
**Directional trades**

View on the price of an underlying can be expressed via a Futures contract for it. Going long (buying) futures will generally lead to a profit if the price of the underlying rises. Conversely,

shorting (selling) Futures will generally result in a profit if the price of the underlying declines.

 **Hedging**

A Futures contract can be used to hedge the price risk of the underlying asset. Let’s say you own 1 BTC (Bitcoin). If you want to lock the current BTC price of $8000, then you can short sell 8000 BTC/ USD Futures (assuming each contract size is 1 USD). Once this hedge is in place, regardless of bitcoin price movement, the effective value of your position will remain constant at $8000.

## Math for Futures

The math behind Futures is better illustrated with an example. Let’s say, we would like to trade Ether-Bitcoin (ETH-BTC) Futures. We need to define a few parameters:

 **Underlying:** This is the asset over which a Futures contract is defined. In our example the underlying is Ether.

 **Quote currency:** This is the currency in which the price of the underlying in quoted. In our example, price of Ether is quoted in Bitcoin terms. Hence, quote currency is BTC.

 **Base currency:** This is the currency in which the PnL of a Futures position is calculated. In our example, the base currency is same as the quote currency, i.e. Bitcoin. However, this need not always be true.

**Multiplier:** This refers to the quantity of the underlying that the two parties trading a single Futures contract agree to buy/ sell in future. If our ETH-BTC Futures contract entails agreement to buy/ sell m Ethers at a future date, then m is the multiplier.

Given above, if you buy (or even sell) *n* ETH-BTC Futures contracts at Fut_EntryPrice, then your overall position size (nominal exposure) is:

$$n *m* Fut\_EntryPrice \  (in \ BTC)$$

To understand why this the position size consider this: the buyer of the Futures contract has agreed to buy *n*m* Ethers at contract expiry, with each Ether priced at Fut_EntryPrice Bitcoins. Thus, at the time of settlement, he will need to have n*m*Fut_EntryPrice Bitcoins to honor the agreement.

 However, to be able to enter into a Futures trade, you are not required to have resources equalling the position size. This is where financial leverage kicks in.

 **Margin%:** This is the fraction of your position size that you are required to post as collateral when entering into a Futures trade. So, in our example, to buy/ sell *n* contracts, you need to have only:

$$n*m* Margin\% *  Fut\_EntryPrice \ (in \ BTC)$$

This also means that maximum position size that you can afford is 1/Margin% times the collateral (in BTC) that you have available. Thus,

$$^1/(Margin\%) = Financial\ leverage$$

### PnL Computation

 **Unrealised PnL**
For a **long** position in a Futures contract:

$$PnL = n*m*(Fut\_CurrentPrice - Fut\_EntryPrice) \ (in \  BTC)$$

  For a **short** position in a Futures contract:

$$PnL = - n*m*(Fut\_CurrentPrice - Fut\_EntryPrice) \ (in\  BTC)$$

  It is worth noting that your (realised or unrealised) profits and losses are adjusted from the margin you post. Profit on a Futures position add to the Margin (collateral). Conversely, loss erodes margin and you might need to top it up to continue holding your position.

**Realised PnL**
In case of Futures, PnL can be realised either by exiting the position in market or via settlement process at the maturity of the contract

Exit **long** position in market

$$PnL = n*m*(Fut\_ExitPrice - Fut\_EntryPrice) \ (in \ BTC)$$

Exit **long** position via settlement

$$PnL = n*m*(Fut\_SettlementPrice - Fut\_EntryPrice) \ (in \ BTC)$$

 Exit **short** position in market

$$PnL = -n*m*(Fut\_ExitPrice - Fut\_EntryPrice)\  (in \ BTC)$$

 Exit **short** position via settlement

$$PnL = -n*m*(Fut\_SettlementPrice - Fut\_EntryPrice) \  (in \  BTC) $$

 *Settlement price is determined at the maturity of the contract through a pre-defined method described in the [contract specifications](https://delta.exchange/contracts/) . All open positions at the time of contract maturity are closed at the settlement price.*

## Inverse Futures

The Futures contract discussed above are also known as **Vanilla Futures**. Inverse Futures are similar to Vanilla Futures, but only with one key distinction: the relationship between Futures price and position PnL is sort of inverted.

For a **long** position in an inverse Futures contract

$$PnL = n*m*(1/ Fut\_EntryPrice - 1/ Fut\_CurrentPrice) \ (in \ BTC) $$

 For a **short** position in an inverse Futures contract

$$PnL = - n*m*(1/ Fut\_EntryPrice - 1/ Fut\_CurrentPrice) \ (in \  BTC)$$

## Leverage

Leverage has a multiplier effect on your trading returns. This is best illustrated with an example. Let’s say you have $100, and you think BTC price is likely to go up. Currently, 1 BTC = $10,000

### No Leverage (trade the underlying)

Buy 0.01 BTC using your $100. If after a week, BTC rises by 10% to $11,000 , your position in BTC is now worth $110 and your PnL is $10. And, the return on your equity (RoE), $100 in this case is:

  $$RoE_{NoLeverage} = PnL / Equity$$

$$= \$10/\$100 = 10\%$$

  

### With Leverage (trade the Futures contract)

Long USD - BTC Futures contract using $100 as the margin money. Let’s assume that the contract size is 0.01 BTC and Margin% is 10%. This means that $100 as margin is sufficient for 10 contracts.

 Let’s further assume that the Futures contract price broadly follows BTC price movement. Now, we can approximate the PnL as

 $$PnL = 10 * 0.01 * (11000 - 10000) = \$100$$

  So, in this case, we have generated a PnL of $100 with the an equity of $100.

$$RoE_{Leverage} = \$100/ \$100 = 100\%$$

 It is also easy to see that,

$$RoE_{Leverage} = RoE_{NoLeverage}/ Margin\% $$
$$= RoE_{NoLeverage} *Financial_{Leverage}$$

 Do note that leverage is a double edged sword. Just as it will amplify your profits, it will also have the same multiplier effect on your losses.

# Trading Guide

## Trade lifecycle

### Funding exchange wallet

Bitcoin is the currency of transactions on Delta. This means that margins and PnL on Delta are denominated in Bitcoins. Before you are able to trade, you need to fund your exchange wallet with Bitcoins. You can see detail on how to deposit/ withdraw Bitcoins from your Delta wallet on the **Account Details** page.

 ### Placing an order

Orders can be placed in Place Order Panel in the trading dashboard. We currently support three types of order:

  -   **Limit order:** is an order to buy or sell a specified number of derivative contracts at a specified price. A limit order will only ever fill at the specified price or better price.
    
-   **Market order:** is an order to buy or sell a specified number of derivative contracts at the best available price available in the order book. There is no guarantee that a market order will fill at the price specified. A market order may fill at a number of different prices, based on the quantity of the market order and the quantities of the existing orders on the order book at the time.
- **Stop order:** write text here
    
### Margin & PnL Calculations

A new order is allowed to be submitted to the exchange only if the trader has sufficient balance available to reserve the order margin. Order margin computation happens in one of the two ways:

-   Trader doesn’t have an existing position in the contract: the system computes the initial margin that would be required if this position is acquired. This is the amount that is blocked as order margin.
    
-   Trader has an existing position in the contract: in this case, the system computes the margin required for the updated overall position after the placed order has been executed. The difference between this computed margin requirement and the current position margin is what is additionally needed for this order. This is the amount that is block as order margin. [fair price](#fpm)
    
Details on the various types of margins and their calculations are available [here](#marginexplain).

Existing positions on Delta are marked at [fair Price](#fpm). This means that your unrealised PnL and hence the current value of margin allocated to a particular position are a function of the marked price. PnL calculations are illustrated with example in the [PnL Math](#pnlmath) section.

### Settlement

You can square off a position in a derivatives contract in the exchange. Position that are held till maturity are cash settled at a price that is computed using the settlement method described in the [contract specifications](https://delta.exchange/contracts).

  

### Maintenance & Market Disruption Events

Trading can be halted for scheduled maintenance and in case of unanticipated events that have the potential to disrupt trading.

 - **Scheduled maintenance:** trading suspension happens in two phases. Phase 1: Order book is put in cancel-only mode and no new orders are accepted. Phase 2: Order book is completely frozen and, new order or cancellations are accepted and no matches occur.
 - **Market disruption events:** These could include unavailability of spot price from one or more exchanges that contribute to the underlying index, uncharacteristically high price volatility among other things. In addition to suspension of trading activity, market disruption events could also impact contract maturities and settlement

 When it is time to restart trading activity, market is put in post-only mode. New maker orders will be accepted, but no matches will occur. Trading will resume once there is sufficient liquidity in the order book 

  

## <a id="fpm"></a>Fair Price Marking

Leverage is inherent in derivative contracts, combined with high volatility of crypto-currencies can lead to unwarranted liquidations. Lack of liquidity could further exacerbate this situation as price swings in a derivatives contract relative to the underlying index could widen even further.

To ensure a great trader experience, Delta marks all open position at Fair Price instead of Last Traded Price. The Fair Price has lesser volatility and is more resilient against attempts to manipulate market.

It is worth noting that Fair Price marking is relevant only computation of Unrealized PnL and Liquidation price. Realized PnL is computed using actual trading prices and is thus not impacted by Fair Price.

### Calculation of Fair Price of a Futures Contract

At maturity, Futures Price = Underlying Index Price, for any Futures contract. At all other times, Futures contract broadly moves in tandem with the Underlying Index, with the difference between the two referred to as basis, i.e.

$$Basis = Futures\_Price - Underlying\_Index\_Price$$

 Since the Underlying Index is the foundation of the Futures contract, it is logical to assume that

$$Futures\_Fair_Price = Underlying\_Index\_Price + Fair\_Basis$$

The Underlying_Index_Price is obviously independent of the trading happening on Delta and is sourced in real-time from leading spot exchanges.

### Impact Price

To understand the computation of Fair_Basis, we first need to introduce the notion of Impact Price. This price tries to estimate the price at which a typical long or short position (called Impact Position) in the Futures contract can be entered at any given time.

 Impact Position, in terms of number is contracts to be traded, is provided in the specifications for each Futures contract. It is easy to see that Impact Price is a function of: (a) Impact Position and (b current state of the order book.

$$Impact\_Bid\_Price = Average \ Fill \ Price \ to \ execute \ a \ typical \ short \ trade$$

$$Impact\_Ask\_Price = Average \ Fill \ Price \  to \  execute \ a \ typical \ long \ trade$$

 $$Impact\_Mid\_Price = Average (Impact\_Bid\_Price, Impact\_Ask\_Price)$$

  
### Fair Basis Calculation

 We first compute an annualised fair value basis rate, $\%Fair\_Basis$:

 $$\%Fair\_Basis = (Impact\_Mid\_Price/ Underlying\_Index\_Price - 1) * (365*86400/ time\_to\_expiry\_in\_sec)$$

$\%Fair\_Basis$ is computed only once every minute. Further, in case at any time of update, market is illiquid, i.e.

$$(Impact\_Ask\_Price - Impact\_Bid\_Price) > Maintenance\_Margin, \ \%Fair\_Basis \text{ is not updated.}$$

$$\text{Now, } Fair\_Basis = Underlying\_Index\_Price * \%Fair\_Basis * (time\_to\_expiry\_in\_sec/ (365* 86400))$$

 Now, that we have the $Fair\_Basis$, the fair price of the Futures (or the mark price) can be easily computed:

$$Futures\_Fair\_Price = Underlying\_Index\_Price + Fair\_Basis$$

It is worth noting that only live positions are marked using the Fair Price. Thus, unrealised PnL may swing with the Mark Price, realised PnL is determined using actual traded price and is unimpacted by Mark Price.

## <a id="marginexplain"></a>Margining Explainer

Margin is the collateral that you need to post when entering into a leveraged derivatives contract. The amount required to enter into a new position is referred to as Initial Margin, which is dependent on the leverage offered in the derivatives contract.

If the trade against you, the unrealised loss in your position is adjusted against the initially posted margin. When the remaining margin (Initial Margin - Unrealised Loss) goes below Liquidation Margin, [liquidation process](#liquidation) is triggered.

 Delta follows a **Segregated Margin approach**, in which margin is explicitly assigned to each position and is not shared across positions. A position is specific to a particular contract. Thus, for each contract, two margin sub-accounts are maintained:

$Position \ Margin$: Margin allocated to all existing (may include multiple long/ short positions) in given derivatives contract

$Order\  Margin$: Margin allocated to all open orders in a given derivatives contract

It is worth noting that Unrealized PnL is not factored into $Position \ Margin$ or $Order\  Margin$.

$Position \ Margins$ and $Order\  Margins$ are allocated from your $Wallet\  Balance$. Thus, at any time, the amount that remains unallocated is what is available for placing a new order. This is referred to as $Available\  Balance$.

$$Available\  Balance = Wallet\  Balance - (Position\  Margin + Order\  Margin)$$

Everytime a new order is placed, the system does three things:

 1. computes the Reservation margin for this new order,
 2. checks whether $reservation \ margin <= Available \ Balance$ and
 3. if $2$ holds, then transfer $Reservation \ Margin$ amount from $Available \ Balance$ to the $Order\  Margin$ of the contract

  

### Reservation Margin Computation

$Initial \ Margin\  (IM)$ requirements for a standalone order are as follows:
-   **Buy limit order:** $IM = (Initial\ Margin\% * \#Contracts * Multiplier * Limit\_Bid\_Price)$
    
-   **Buy market order:** $IM = (InitialMargin\% * \#Contracts * Multiplier * MarkPrice)$
    
-   **Sell limit order:** $IM = (InitialMargin\% * \#Contracts * Multiplier * Max (Limit\ Offer\ Price, BestBid)$
    
-   **Sell market order:** $IM = (InitialMargin\% * \#Contracts * Multiplier * Max (MarkPrice, BestBid)$
    

 Now, if there are existing positions/ orders in the contract, then the Initial Margin requirement for the combined position $(existing + new \ order)$ is recomputed. For this computation, positions on opposite side are netted in such a manner that for two offsetting contracts, margin is required only once.

$Reservation\  Margin$ is then the difference of the Initial Margin requirement for the combined position ($existing + new \ order$) and the $Position\ Margin$ and $Order \ Margin$ currently allocated to the derivative contract.

### Impact on Margins on order cancellations

In a given contract, $Order\  Margin$ account contains margin blocked for all the current open orders. If one or more of these open orders is cancelled, the Initial Margin requirement for the remaining open orders and existing orders is recomputed. The new Initial Margin requirement will either be same as earlier or lower. If case of latter, excess margin is released.

## <a id="pnlmath"></a>PnL Math

All open positions on Delta are marked at the [Fair Price](#fpm) of the Futures contract. Thus, $Unrealized \ PnL$ and $Liquidiation \ Prices$ are computed using Fair Prices, while $Realized \  PnL$ is based on actual entry and exit prices.

 PnL for a long/ short position in a Vanilla Futures

$$PnL = ± n*m*(Fut\_CurrentPrice - Fut\_EntryPrice)$$

PnL for a long/ short position in an Inverse Futures

$$PnL = ± n*m*(1/ Fut\_EntryPrice - 1/ Fut\_CurrentPrice)$$

 where $m$ is the multiplier and $n$ is the position size (i.e. number of contracts).

If a position is acquired at multiple entry prices, an average entry price is computed and used for PnL computation.

## <a id="liquidation"></a>Liquidation
Each position on Delta has an associated prices:

-   $Liquidation \ Price$: At $Liquidation \ Price$, the difference of $Position \ Margin$ minus $Unrealized\  PnL$ of the position is equal to the $Liquidation \ Margin$.
    
-   $Bankruptcy \ Price$: At $Bankruptcy \ Price$, the $Unrealized \ Loss$ of a position equal to the $Position\  Margin$.
    
When $Liquidation\  Price$ of a position is hit, liquidation of this position is initiated. It is worth noting that since Delta uses Segregated Margins, liquidation of position in a particular contract has no bearing on other existing positions and open orders on other derivative contracts.

Liquidation mechanism on Delta is comprised of the following steps:

-   All open orders on the derivative contract are cancelled. This may or may not free up some margin blocked for these order.
    
-   An Immediate-or-Cancel order is submitted to the market to close the positions in the contract. The limit price of this order is set to the Bankruptcy Price. This ensures that the Realised Loss will always be lower than the Position Margin.
    
-   If the liquidation results in being filled at price better than the Bankruptcy Price, then the user keeps whatever remaining Position Margin there is.
    
-   In case the position is not fully liquidated (for example due to lack of liquidity), the remainder of the position is terminated at Bankruptcy Price and ADL is triggered.
    

**Liquidation Examples**
You have an open long position of $1000$ contracts in Bitcoin-Dollar Futures with an $Avg\ Entry \ Price$ of $10000$. The $Liquidation\  Price$ for this position is $9500$ and the $Bankruptcy \ Price$ is $9200$.

As soon as the Mark prices reaches $9500$ or below, your position will enter Liquidation. An immediate-or-cancel sell order is submitted on your behalf at $9200$. The limit price of this order assures that if the order is matched, the portfolio value of the margin account will not be less than zero.

  Case 1: Liquidation order gets filled at $9400$. At this price since your margin is not fully eroded, the remaining margin is released.

 Case 2: The Liquidation order at gets only partially filled and say 300 contracts are left over. This will trigger [ADL](#autodel). The system will find counterparties on the short side and a trade between you and these counterparties for $300$ contracts at $9200$  ($Bankruptcy\  Price$) is made to happen.

  

## <a id="autodel"></a>Auto deleveraging

Auto deleveraging (ADL) is initiated if liquidation of a position is doesn’t get completed before the $Mark\  Price$ reaches the $Bankruptcy \ Price$ of the position. This means that the Liquidation order (which is an immediate-or-cancel order at Bankruptcy Price) is either completely or partially unfilled. In this situation, the left over contracts from the position under liquidation are forcefully matched (at the $Bankruptcy \ Price$) with counterparties on the opposite side.

 It is worth noting that all the open orders of the deleveraged counterparties in the same contract are also cancelled. Those deleveraged are notified via email and are given an opportunity to re-enter their positions.

  **Selection of ADL counterparties**

ADL counterparties are selected on the basis of profits (in $\%$ terms) of their positions. All open positions are ranked according to their $Profit\%$, with the position with the highest $Profit\%$ on top. Deleveraging starts from the top position and continues to deleverage the subsequent positions until all the leftover contracts from the Liquidation order which led to ADL are matched.

 You can gauge the likelihood of your position being selected as an ADL counterparty using the ADL Indicator. This indicator informs in which quintile your position falls when all open positions in your side (long or short) are sorted by $Profit\%$. Obviously, positions in the top (bottom) quintile are most (least likely to get deleveraged.

 **ADL Example**

 In Dollar-Bitcoin Futures contract, there are 7 longs, and their positions sizes and $Profit\%$ are as follows:
| Account 	| #Contracts 	| Unrealised PnL 	| Profit %Rank 	| Quintile 	|
|:---------:	|:------------:	|:----------------:	|:--------------:	|:----------:	|
|    1    	|     100    	|      -10%      	|       6      	|     1    	|
|    2    	|     20     	|       20%      	|       1      	|     5    	|
|    3    	|     50     	|       5%       	|       3      	|     4    	|
|    4    	|     80     	|      0.2%      	|       4      	|     3    	|
|    5    	|      5     	|       15%      	|       2      	|     5    	|
|    6    	|     30     	|      -20%      	|       7      	|     1    	|
|    7    	|     70     	|       -7%      	|       5      	|     2    	|
 Let’s assume a short position is to be closed via ADL. We will start with the Account which has the highest $Profit\% \ Rank$ and continue to move to following Accounts till we have the requisite number of long contracts to match the short position being liquidated.

 **Case 1:** The short position has $15$ contracts. In this case, Account 2 will have $15$ of its $20$ contracts matched against this short position at the Bankruptcy Price of the short position. No other accounts will be impacted.

**Case 2:** The short position has $40$ contracts. In this case, $20$ contracts of Account $, $5$ contracts of Account 5 and $15$ contracts of Account 3 will be deleveraged.






