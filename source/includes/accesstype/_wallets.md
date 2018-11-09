# Subscriber Wallets

##  POST subscriber wallet token

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST http://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_wallets.json -d '{
     "subscriber_wallet": {
        "provider": "simpl",
        "metadata": {
            "token": "8ashfsdfvyhurn8g9w85gjf"
        }
    }
 }'
```
```shell--response
{
  "subscriber_wallet": {
    "provider": "simpl",
    "metadata": {
      "token": "thenashfsdfvyurn8g9w85gjf"
      }
    }
  }
```
This request allows to POST a user's wallet token from any wallet provider.
Examples of Providers: [Simpl](https://getsimpl.com), [PayTm](https://paytm.com)

Allowed values for `subscriber_wallet.provider` are `simpl`,`paytm`.

|Parameter|Type|Mandatory|Description|
|---	|---	|---	|---	|
|subscriber_wallet.provider|string|Yes|Valid Values `simpl`,`paytm`|
|subscriber_wallet.metadata|object|Yes|Can have multiple key value pairs. Can be used to store tokens provided by wallet provider. E.g., `"token": "8ashfsdfvyhurn8g9w85gjf"` |


The request body is returned back in the response.

## LIST wallets of subscriber

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" http://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_wallets.json

```
```shell--response
{
  "subscriber_wallets": [{
    "provider": "paytm_auto_debit",
    "metadata": {
      "exprires_at": "1517922233955"
      }
    },
    {
    "provider": "simpl",
    "metadata": {}
    }]
  }
```
This API call returns all the wallets of a subscriber.

## DELETE wallets of subscriber

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" http://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_wallets.json -X DELETE

```

This API deletes all the wallets of a subscriber.

