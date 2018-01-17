## voucher object

voucher objects have the following minimal attributes:

####id

A unique identifier for this voucher.

####account

Identifier of the account to which this voucher is assigned.

####cancelled

Boolean.

####credit_earned

Numeric, two decimal places

####credit_used

Numeric, two decimal places

####expiration_date

Date credit expires/expired (UTC)

####earned_date

Date credit was earned (UTC)

### voucher.balance

<script>tryit('voucher.balance')</script> 

Checks the user's voucher balance of available credit.

Parameters:

####org_id

optional, organization for which to return voucher products; defaults to the user's organization; if specified, must be that or that organization's parent

Response: On success, returns a `balance` attribute and a `voucher_product` attribute giving an array of available product objects with `id`, `name`, and `credits` attributes.

### voucher.refund

<script>tryit('voucher.refund')</script> 

Refunds credit to the user's voucher balance.

Parameters:

####voucher_transaction_id

id of transaction to refund

####receipt

receipt attribute previously returned by voucher.use

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix

####device_id

optional, arbitrary string identifying issuing device

####device_name

optional, arbitrary string with a displayable name for device

####org_id

optional, organization for which to update the voucher transaction; defaults to the user's organization; if specified, must be that or that organization's parent

Response: On success, returns empty results.

### voucher.use

<script>tryit('voucher.use')</script> 

Uses credit from the user's voucher balance.

Parameters:

####credit

amount of credit to use.

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix

####device_id

optional, arbitrary string identifying issuing device

####device_name

optional, arbitrary string with a displayable name for device

####voucher_product

optional, the particular product for which credits are being redeemed

####org_id

optional, organization for which to record the voucher transaction; defaults to the user's organization; if specified, must be that or that organization's parent

Response: On success, returns a `voucher_transaction_id` attribute and a string `receipt` attribute.

