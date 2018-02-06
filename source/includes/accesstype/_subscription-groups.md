# Subscription Groups

## LIST all Subscription Groups

```shell
$ curl -H "X-SUBAUTH: <your-auth-token>" https://accesstype.com/api/v1/subscription_groups.json
{
  "subscription_groups": [{
    "id": 25,
    "account_id": 2,
    "name": "print",
    "description": "Digital + Print",
    "assets": [{
        "type": "site"
    }],
    "subscription_type": "individual",
    "public": true,
    "created_at": "2017-09-04T09:05:06.035Z",
    "updated_at": "2017-09-07T10:21:21.109Z",
    "deleted_at": null,
    "preferred_identity_provider": "email",
    "metadata_fields": [
      "full-name",
      "email",
      "mobile-or-contact-number",
      "street-or-apartment",
      "area-or-locality",
      "city-or-village-and-state",
      "pin-code",
      "country"
    ],
    "subscription_plans": [{
      "id": 23,
      "subscription_group_id": 25,
      "duration_length": 3,
      "price_cents": 34900,
      "price_currency": "INR",
      "additional_assets": [],
      "created_at": "2017-09-04T09:05:06.047Z",
      "updated_at": "2017-09-04T09:05:06.047Z",
      "duration_unit": "months",
      "description": null,
      "title": "print-3",
      "max_trial_period_length": null,
      "max_trial_period_unit": null,
      "recurring": false,
      "metadata": {}
    }]
  }]
}
```

This API will list out all public subscription groups

## GET a Subscription Group

```shell
$ curl -H "X-SUBAUTH: <your-auth-token>" https://accesstype.com/api/v1/subscription_groups/<group-id>.json
{
  "subscription_group": {
    "id": 25,
    "account_id": 2,
    "name": "print",
    "description": "Digital + Print",
    "assets": [{
        "type": "site"
    }],
    "subscription_type": "individual",
    "public": true,
    "created_at": "2017-09-04T09:05:06.035Z",
    "updated_at": "2017-09-07T10:21:21.109Z",
    "deleted_at": null,
    "preferred_identity_provider": "email",
    "metadata_fields": [
      "full-name",
      "email",
      "mobile-or-contact-number",
      "street-or-apartment",
      "area-or-locality",
      "city-or-village-and-state",
      "pin-code",
      "country"
    ],
    "subscription_plans": [{
      "id": 23,
      "subscription_group_id": 25,
      "duration_length": 3,
      "price_cents": 34900,
      "price_currency": "INR",
      "additional_assets": [],
      "created_at": "2017-09-04T09:05:06.047Z",
      "updated_at": "2017-09-04T09:05:06.047Z",
      "duration_unit": "months",
      "description": null,
      "title": "print-3",
      "max_trial_period_length": null,
      "max_trial_period_unit": null,
      "recurring": false,
      "metadata": {}
    }]
  }
}
```

This will fetch a subscription, either a public or private one
