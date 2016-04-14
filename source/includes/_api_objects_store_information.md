# Store Information Object

Profile of an individual store.

|||
|---|---|
| Managed by | [Store Information Resource](/api/stores/v2/store_information)

## Store Information Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | string | Unique store identifier. |
| domain | string | Primary domain name. |
| name | string | The store's name |
| address | string | Display address |
| phone | string | Display phone number |
| admin_email | string | Email address of the store administrator |
| order_email | string | Email address for orders and fulfillment |
| timezone | object | An object that defines the store's time zone, following conventions of the PHP \"date\" function (for details, please see: http://php.net/manual/en/function.date.php). This object contains the following elements: \"name\": a string identifying the time zone, in the format \"<Continent-name>/<City-name>\". \"raw_offset\": a negative or positive number, identifying the offset from UTC/GMT, in seconds, during winter/standard time. \"dst_offset\": -/+ (number) offset from UTC/GMT, in seconds, during summer/daylight saving time. \"dst_correction\": a boolean indicating whether this time zone observes daylight saving time. \"date_format\" is a nested object, which contains the following internal elements: \"display\": string that defines dates' display format, in the pattern: \"M jS Y\". \"export\": string that defines the CSV export format for orders, customers, and products, in the pattern: \"M jS Y\". \"extended_display\": string that defines dates' extended-display format, in the pattern: \"M jS Y @ g:i A\". |
| language | string | Default language code |
| currency | string | Default currency code |
| currency_symbol | string | Default symbol for values in the currency |
| decimal_separator | string | Default decimal separator for values in the currency |
| thousands_separator | string | Default thousands separator for values in the currency |
| decimal_places | string | Default decimal places for values in the currency |
| currency_symbol_location | string | Default position of the currency symbol (left or right) |
| weight_units | string | Default weight units (metric or imperial) |
| dimension_units | string | Default dimension units (metric or imperial) |
| dimension_decimal_places | string | The number of decimal places |
| dimension_decimal_token | string | The symbol that separates the whole numbers from the decimal points |
| dimension_thousands_token | string | The symbol used to denote thousands |
| plan_name | string | Name of the Bigcommerce plan this store belongs to |
| plan_level | string | BigCommerce plan level to which this store is subscribed |
| logo | object |
| is_price_entered_with_tax | boolean | A BOOLEAN value that indicates whether or not prices are entered with tax |
| active_comparison_modules | array |

## Webhook Events

### Store Cancelled

```
store/app/uninstall
```
Occurs when a client store is cancelled and uninstalled from the platform.
