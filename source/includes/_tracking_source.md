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

| Database value | source value           | comment                         |
| -------------- | ---------------------- | ------------------------------- |
| 0              | website                | default value                   |
| 1              | mobile_ios             | ios device                      |
| 2              | mobile_android         | android device                  |
| 3              | mobile_other           | other mobile devices            |
| 4              | mobile_android_offline | android device but offline mode |
| 5              | mobile_ios_offline     | ios device but offline mode     |
| 6              | push_cart              | Push Cart chrome extension      |
