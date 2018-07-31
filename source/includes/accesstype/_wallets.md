# Wallets

##  POST subscriber wallet token

This request allows to POST a user's wallet token from any wallet provider. 
Examples of Providers: [Simpl](https://getsimpl.com), [PayTm](https://paytm.com)

Allowed values for `subscriber_wallet.provider` are `simpl`,`paytm`.

|Parameter|Type|Mandatory|Description|
|---	|---	|---	|---	|
|subscriber_wallet.provider|string|Yes|Valid Values `simpl`,`paytm`|
|subscriber_wallet.metadata|object|Yes|Can have multiple key value pairs. Can be used to store tokens provided by wallet provider. E.g., `"token": "8ashfsdfvyhurn8g9w85gjf"` |


The request body is returned back in the response.

```shell
$ curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST http://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_wallets.json -d '{
     "subscriber_wallet": {
        "provider": "simpl",
        "metadata": {
            "token": "8ashfsdfvyhurn8g9w85gjf"     
        }        
    }
 }'
```
## LIST wallet tokens of subscriber

This API call returns all the wallet tokens of a subscriber.



```shell
$ curl -H "X-SUBAUTH: <auth-token>" http://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/subscriber_wallets.json

Sample Response:
{
    "subscriber_wallets": [
        {
            "provider": "simpl",
            "metadata": {
                "token": "hbsi87y8wrho3q8wfbyu"
            }
        },
        {
            "provider": "paytm",
            "metadata": {
                "token": "8089dsfvwj5tp870q938nff"
            }
        }
    ]
}
```