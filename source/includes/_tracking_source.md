# Tracking Source

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/endpoint',
  headers={ source: 'mobile_android_offline' }
)
```

```shell
curl "https://app.procurementexpress.com/api/v1/endpoint"
  -H " source: mobile_android_offline"
```

We can track source for given models. This will help us identify which device has created those data

| models        |
| ------------- |
| User          |
| Company       |
| Budget        |
| PurchaseOrder |
| Product       |
| Supplier      |

`app_source` header params needs to be pass to set source for those models, and it will accept one of given values

| source value           | comment                         |
| ---------------------- | ------------------------------- |
| website                | default value                   |
| mobile_ios             | ios device                      |
| mobile_android         | android device                  |
| mobile_other           | other mobile devices            |
| mobile_android_offline | android device but offline mode |
| mobile_ios_offline     | ios device but offline mode     |
| push_cart              | Push Cart chrome extension      |