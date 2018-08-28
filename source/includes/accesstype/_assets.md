# Assets

## LIST All Assets accessible to a user

```shell--request
$ curl -H "X-SUBAUTH: <auth-token>" https://www.accesstype.com/api/v1/subscribers/<provider>/<identity>/assets.json

```
```shell--response

{
   "assets":[
     {
       "metadata":{},
       "title":"public",
       "type":"site"
     }
   ]
}

```