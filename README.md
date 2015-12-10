# TradeGecko developer docs
--------
### Adding a resource

All resources are in locale files and they are registered in `source/index.md` under resources.

To add a new resource, save a copy of `example.en.yml` into the locales directory and rename it (and the key below `en`),
then add it to the list in `source/index.md`.

### Example attribute.
```
name: {
  name: "",
  type: "String",
  description: "",
  filterable: "",
  updatable: true,
  creatable: true,
  required: false,
  readonly: false,
  beta: false,
  deprecated: false,
  private: false
},
```

### To Do

LedgerAccount
FulfillmentReturn
Login
Payment
Webhook

### Add a new resource with

`thor generate model ClassName`

You will need 
```
OAUTH_SECRET=xxx
OAUTH_ID=xxx
OAUTH_TOKEN=xxx
```

In your .env.
