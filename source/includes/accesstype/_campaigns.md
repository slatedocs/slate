# Campaigns

## LIST all Campaigns

```shell
$ curl -H "X-SUBAUTH: <your-auth-token>" https://www.accesstype.com/api/v1/campaigns.json
{
  "campaigns": [{
    "id": 25,
    "account_id": 2,
    "target_amount_cents": 10000000,
    "target_amount_currency": "INR",
    "subscription_group_id": 1,
    "name": "Life On The Border And The Unheared stories",
    "description": "Soldiers at the border have become a staple source of news for mainstream media. But how much do we know about life at the border for those who call it home? In one of the villages along the LoC, a crippling disease is preventing people from getting Aadhaar cards.",
    "created_at": "2018-04-09T05:28:22.746Z",
    "updated_at": "2018-04-09T05:28:22.746Z",
    "deleted_at": null,
    "goal_reached": false,
    "enabled": true,
    "metadata": [],
    "collected_amount": "0.00",
    "collected_amount_cents": 0,
    "collected_amount_currency": "INR",
    "collected_amount_percentage": 0,
    "target_amount": "100000.00",
    "subscription_plans": [{
      "id": 10,
      "subscription_group_id": 1,
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
      "metadata": {},
      "assets": [],
      "display_assets": []
    }]
  }]
}
```

This API will list out all campaigns

## GET a Campaign

```shell
$ curl -H "X-SUBAUTH: <your-auth-token>" https://www.accesstype.com/api/v1/campaigns/<campaign-id>.json
{
  "campaign": {
    "id": 1,
    "target_amount_cents": 10000000,
    "target_amount_currency": "INR",
    "subscription_group_id": 1,
    "name": "Life On The Border And The Unheared stories",
    "description": "Soldiers at the border have become a staple source of news for mainstream media. But how much do we know about life at the border for those who call it home? In one of the villages along the LoC, a crippling disease is preventing people from getting Aadhaar cards.",
    "created_at": "2018-04-09T05:28:22.746Z",
    "updated_at": "2018-04-09T05:28:22.746Z",
    "deleted_at": null,
    "goal_reached": false,
    "enabled": true,
    "metadata": [],
    "collected_amount": "0.00",
    "collected_amount_cents": 0,
    "collected_amount_currency": "INR",
    "collected_amount_percentage": 0,
    "target_amount": "100000.00",
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
      "assets": [],
      "display_assets": []
    }]
  }
}
```

This will fetch a specific campaign
