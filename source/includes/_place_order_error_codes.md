# Place order errors
This section lists various errors returned by the system while placing order. The error format looks like this 

```
{
  success: false,
  error: {
    code: ...,        // error code
    context: {
      ...
    }
  }
}
```

Here is a list of error codes and their explanation

error code | description
--|--
insufficient_margin  | Margin required to place order with selected leverage and quantity is insufficient.
order_size_exceed_available | Rhe order book doesn't have sufficient liquidity, hence the order couldnt be filled (for ex - ioc orders).
risk_limits_breached | orders couldn't be placed as it will breach allowed risk limits.
invalid_contract | The contract/product is either doesn\'t exist or has already expired.
immediate_liquidation | Order will cause immediate liquidation.
out_of_bankruptcy | Order prices are out of position bankruptcy limits.
self_matching_disrupted_post_only | Self matching is not allowed during auction.
immediate_execution_post_only | orders couldn't be placed as it includes post only orders which will be immediately executed.