# Invoices

## GET invoice details for a subscription

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>"
https://accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriptions/<subscription_id>/invoices/<invoice_id>/download.json
```
```shell--response
It returns the invoice.pdf file in pdf format
```
This API is used to download the invoice in the pdf format.

### Invoice Template Variables

The below format considers the price inclusive of taxes.

| Name                             | Description                                                                                                                                                                                                                                                                                                                 |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| user_name                        | Name of the user in the accesstype who purchased the subscription                                                                                                                                                                                                                                                           |
| invoice_number                   | The sequence of invoice number for that account. Example: publisher_name/1, publiser_name/2                                                                                                                                                                                                                                 |
| user_email                       | Email of the user in the accesstype who purchased the subscription                                                                                                                                                                                                                                                          |
| date                             | Date of purchase of subscription. Example: 11 Dec 2018                                                                                                                                                                                                                                                                      |
| payment_method                   | Payment gateway used by the purchaser. Example: razorpay, simpl, paytm                                                                                                                                                                                                                                                      |
| recurring                        | true if it's a recurring subscription, false if it's a one time payment                                                                                                                                                                                                                                                     |
| base_price                       | Basic price is the amount receivable by the publisher from the user for the purchase of subscription minus any tax on the product.For example if 110 is the price paid by the user and 10 % if the tax specified by the admin. The base price is calculated by the following formula (110/(1+10/100)), which equals 100     |
| subscription_group_title         | The subscription group name, the subscription plan belongs to                                                                                                                                                                                                                                                               |
| subscription_plan_title          | The subscription plan name, for which the user purchases a subscription                                                                                                                                                                                                                                                     |
| subscription_plan_price          | The price of the subscription plan, specified by the admin without any discount applied                                                                                                                                                                                                                                     |
| amount_paid                      | The amount received from the user. If the user applies a discount, discount is applied on the plan amount.                                                                                                                                                                                                                  |
| discount_details                 | It's a hash with following fields code - which represents the discount code applied by the user discount_percentage - which represents the percentage of discount applied discount_amount - which represents the amount of the discount Example: {"code" => "UAT","discount_percentage" => 20,"discount_amount" => "77.97"} |
| taxes                            | It's a hash with tax objects. If multiple taxes are specified by the admin, multiple tax objects will be present in this object {"SGST" => {"percentage" => "9.0","amount" => "28.07","currency" => "INR"},  "CGST" => {"percentage" => "9.0","amount" => "28.07","currency" => "INR"} }                                    |
| subscription_end_date            | Represents the end date of the subscription                                                                                                                                                                                                                                                                                 |
| dynamic_assets                   | This is applicable for pay per asset type of subscriptions. Suppose if user purchases a storytitle, slug will be available in this field  Example: [{id: "some_asset_id", title: "Some title", slug: "/some-slug"}]                                                                                                         |
| amount_after_discount_before_tax | This amount is arrived at, when discount is applied on the base price|                                                                                                                                   