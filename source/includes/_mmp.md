# Market Maker Protection

Mass quoting, an important part of any well-functioning market, requires market makers to post liquidity in a vast range of instruments. Market maker protection (MMP) is a feature that helps MM control their risk of getting hit simultaneously in multiple contracts. 

MMP is available on request and is manully enabled by Delta Exchange team. It is only supported for Portfolio Margin accounts.

## Usage
1. MMP orders need to be tagged in the time_in_force field. Only MMP orders are cancelled when MMP is triggered.
2. MMP configuration can be changed using the [Update MMP Config](https://docs.delta.exchange/#update-mmp-config) Api.


## MMP Config Parameters
1. window_interval : This defines the window in seconds in which MMP limits are checked. The window starts after the first trade. When the interval has ended, the counters are reset.

2. freeze_interval : This defines the time interval in seconds for which MMP orders are frozen once MMP gets triggered. MMP is reset once freeze interval has ended (counted from the time mmp gets triggerd). You can set this to 0 if you want to do a [Manual reset](https://docs.delta.exchange/#reset-mmp) instead of automatic reset.

3. trade_limit: Trade limit in terms of the underlying (like 10 btc) for which mmp is triggered. Trade limit is direction agnostic. Buy and sell orders are added and dont offset each other.

4. delta_limit: Delta notional limit in terms of the underlying. This takes into account the sign of delta for a contract. So, if you trade 10 btc worth of an call option with 0.1 delta and 10 btc worth of put option with -0.05 delta, then net delta notional is 10*0.1 + 10*(-0.05) = 5 btc. Delta for futures contract is 1.
   
5. vega_limit: Vega notional limit in terms of the underlying. 


## Socket MMP update 
When MMP is triggered, we publish a message on socket indicating when MMP was triggered and the timestamp when MMP will be reset. 