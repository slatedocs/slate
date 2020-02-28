# Place order error description
various errors returned by system while placing order

error | description
--|--
InsufficientMargin  | Margin required to place order with selected leverage and quantity is insufficient.
OrderSizeExceededAvailable | order size more than available, the order book doesn't have sufficient liquidity.
OrderExceedsSizeLimit | orders couldn't be placed as it will breach allowed risk limits.
OrderLeverageNotSet | Order leverage is not set for this order, set any order leverage.
InvalidProduct | The contract/product is either doesn\'t exist or has already expired.
ImmediateLiquidationOrder | Order will cause immediate liquidation.
LowerthanBankruptcy | Order prices are out of position bankruptcy limits.
SelfMatchingPostOnlyMode | Self matching is not allowed in post only mode.
ImmediateExecutionPostOnlyOrder | orders couldn't be placed as it includes post only orders which will be immediately executed.
~~BracketOrderPositionExists~~ | __DEPRECATED__ Cannot add bracket order when position already exists.	
~~InvalidBracketOrder~~ |__DEPRECATED__  Cannot add bracket order because either the stop loss price or take profit price is incorrect.